from flask import Flask, render_template
import os
import database as db

template_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'templates')
static_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static')

app = Flask(__name__, template_folder=template_dir, static_folder=static_dir)

@app.route('/index')
def index():
    cursor = db.database.cursor()
    cursor.execute("SELECT * FROM AUTO")
    miresultado = cursor.fetchall()
    
    insertObjet = []
    nombreColumnas = [column[0] for column in cursor.description]
    
    for record in miresultado:
        data_dict = dict(zip(nombreColumnas, record))
        insertObjet.append(data_dict)
    
    cursor.close()
    
    return render_template('index.html', dato=insertObjet)

@app.route('/')
def principal():
    return render_template('principal.html')

@app.route('/historia')
def historia():
    return render_template('historia.html')

# Asesoramiento
@app.route('/fichas-tecnicas')
def fichas_tecnicas():
    return render_template('asesoramiento/Fichas-Tecnicas.html')

@app.route('/oferta')
def oferta():
    return render_template('asesoramiento/oferta.html')

@app.route('/preventa-exclusiva')
def preventa_exclusiva():
    return render_template('asesoramiento/Preventa-Exclusiva.html')

# Servicios
@app.route('/garantia')
def garantia():
    return render_template('servicios/garantia.html')

@app.route('/repuesto')
def repuesto():
    return render_template('servicios/repuesto.html')

@app.route('/servicios_24h')
def servicios_24h():
    return render_template('servicios/servicio_24h.html')

if __name__ == '__main__':
    app.run(debug=True, port=4000)
