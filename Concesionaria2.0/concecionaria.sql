create database Concesionario;
use Concesionario;

create table Cliente(
id int primary key,
nombre varchar(50),
apellido varchar(50),
direccion varchar(50)
);

create table Auto(
codigo int primary key,
tipo varchar(50),
modelo varchar(50),
precio float(11),
año year,
imagen text
);

create table Detalle_Auto(
id int primary key,
motor varchar(50),
caballos varchar(4),
peso int(5),
color varchar(50),
tamaño varchar(50),
par varchar(50),
vel_max int(4),
cod_auto int,
foreign key(cod_auto)references Auto(codigo)
);

create table Venta(
id int primary key,
sucursal varchar(50),
metodo_pago varchar(50),
precio_total float(50),
modo_entrega varchar(50),
intereses int(50),
fecha_pago date,
codigo_auto int,
id_cliente int,
foreign key(codigo_auto)references Auto(codigo),
foreign key(id_cliente)references Cliente(id)
);

INSERT INTO Cliente (id, nombre, apellido, direccion)
VALUES (1, 'Juan', 'Pérez', 'Calle 123');

INSERT INTO Cliente (id, nombre, apellido, direccion)
VALUES (2, 'María', 'García', 'Avenida 456');

INSERT INTO Cliente (id, nombre, apellido, direccion)
VALUES (3, 'Pedro', 'López', 'Calle 789');

INSERT INTO Cliente (id, nombre, apellido, direccion)
VALUES (4, 'Ana', 'Sánchez', 'Avenida 1011');

INSERT INTO Auto (codigo, tipo, modelo, precio, año, imagen)
VALUES (1, 'Auto', 'Corolla', '20000', 2023, 'https://www.cronista.com/files/image/311/311861/5ffe36d31e040.webp?oe=jpg');

INSERT INTO Auto (codigo, tipo, modelo, precio, año, imagen)
VALUES (2, 'Vans', 'Tucson', '35000', 2022, 'https://tiempolibreguzman.com/wp-content/uploads/2022/04/hyundai-tucson.jpg');

INSERT INTO Auto (codigo, tipo, modelo, precio, año, imagen)
VALUES (3, 'auto', 'Yaris', '15000', 2021, 'https://motormagazine.com.ar/wp-content/uploads/2020/11/Toyota-Yaris-2021-HB-S-Fondo-Gris-1.jpg');

INSERT INTO Auto (codigo, tipo, modelo, precio, año, imagen)
VALUES (4, 'auto', 'Mustang', '50000', 2020, 'https://resizer.iproimg.com/unsafe/1200x674/filters:format(webp)/https://assets.iprofesional.com/assets/jpg/2019/09/484292_landscape.jpg');

INSERT INTO Detalle_Auto (id, motor, caballos, peso, color, tamaño, par, vel_max, cod_auto)
VALUES (1, '2.0L', '150', '1300', 'Blanco', 'Mediano', '200 Nm', '200 km/h', 1);

INSERT INTO Detalle_Auto (id, motor, caballos, peso, color, tamaño, par, vel_max, cod_auto)
VALUES (2, '1.6L', '120', '1200', 'Rojo', 'Chico', '160 Nm', '180 km/h', 2);

INSERT INTO Detalle_Auto (id, motor, caballos, peso, color, tamaño, par, vel_max, cod_auto)
VALUES (3, '2.4L', '180', '1500', 'Gris', 'Mediano', '240 Nm', '220 km/h', 3);

INSERT INTO Detalle_Auto (id, motor, caballos, peso, color, tamaño, par, vel_max, cod_auto)
VALUES (4, '5.0L', '400', '1800', 'Negro', 'Grande', '500 Nm', '280 km/h', 4);

INSERT INTO Venta (id, sucursal, metodo_pago, precio_total, modo_entrega, intereses, fecha_pago, codigo_auto, id_cliente)
VALUES (1, 'Centro', 'Efectivo', '25000', 'Inmediato', '0', '2024-04-20', 1, 1);

INSERT INTO Venta (id, sucursal, metodo_pago, precio_total, modo_entrega, intereses, fecha_pago, codigo_auto, id_cliente)
VALUES (2, 'Norte', 'Tarjeta de crédito', '30000', 'A domicilio', '5', '2024-04-25', 2, 2);

INSERT INTO Venta (id, sucursal, metodo_pago, precio_total, modo_entrega, intereses, fecha_pago, codigo_auto, id_cliente)
VALUES (3, 'Sur', 'Transferencia bancaria', '22000', 'Inmediato', '0', '2024-04-22', 3, 3);

INSERT INTO Venta (id, sucursal, metodo_pago, precio_total, modo_entrega, intereses, fecha_pago, codigo_auto, id_cliente)
VALUES (4, 'Oeste', 'Efectivo', '40000', 'A domicilio', '3', '2024-04-27', 4, 4);