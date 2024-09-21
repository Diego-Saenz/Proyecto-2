from flask import Flask, render_template, request, redirect, url_for, flash
import os
import database as db

template_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
template_dir = os.path.join(template_dir,'src','templates')

app = Flask(__name__, template_folder = template_dir)

@app.route('/')
def home():
    cursor = db.database.cursor()
    cursor.execute("SELECT modelo, codigo, tipo, precio, año, imagen  FROM AUTO")
    miresultado = cursor.fetchall()
    
    insertObjet = []
    nombreColumnas = [column[0] for column in cursor.description]
    
    for record in miresultado:
        data_dict = dict(zip(nombreColumnas, record))
        insertObjet.append(data_dict)
    
    cursor.close()
    
    return render_template('index.html', dato=insertObjet)

@app.route('/autos', methods= ['POST'])
def añadirAuto():
    codigo = request.form['codigo']
    tipo = request.form['tipo']
    modelo = request.form['modelo']
    precio = request.form['precio']
    año = request.form['año']
    imagen = request.form['imagen']

    if modelo and codigo and tipo and precio and año and imagen:
        cursor = db.database.cursor()
        sql = 'INSERT INTO Auto(codigo, tipo, modelo, precio, año, imagen) VALUES (%s, %s, %s, %s, %s, %s)'
        data = (codigo, tipo, modelo, precio, año, imagen)
        cursor.execute(sql, data)
        db.database.commit()
        cursor.close()
    return redirect(url_for('home'))

@app.route('/delete/<string:id>')
def delete(id):
    cursor = db.database.cursor()
    cursor.execute("DELETE FROM AUTO WHERE codigo = {0}".format(id))
    db.database.commit()
    cursor.close()
    return redirect(url_for('home'))

@app.route('/edit/<string:id>', methods=['POST'])
def edit(id):
    codigo = request.form['codigo']
    tipo = request.form['tipo']
    modelo = request.form['modelo']
    precio = request.form['precio']
    año = request.form['año']
    imagen = request.form['imagen']

    if codigo and tipo and modelo and precio and año and imagen:
        cursor = db.database.cursor()
        sql = "UPDATE AUTO SET codigo = %s, tipo = %s, modelo = %s, precio = %s, año = %s, imagen = %s WHERE codigo = %s"
        data = (codigo, tipo, modelo, precio, año, imagen, id)
        cursor.execute(sql, data)
        db.database.commit()
        cursor.close()
    return redirect(url_for('home'))    



if __name__ == '__main__':
    app.run(debug=True, port=4000)
