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
precio varchar(11),
año year
);

create table Detalle_Auto(
id int primary key,
motor varchar(50),
caballos varchar(4),
peso varchar(5),
color varchar(50),
tamaño varchar(50),
par varchar(50),
vel_max varchar(4),
cod_auto int,
foreign key(cod_auto)references Auto(codigo)
);

create table Venta(
id int primary key,
sucursal varchar(50),
metodo_pago varchar(50),
precio_total varchar(50),
modo_entrega varchar(50),
intereses varchar(50),
fecha_pago date,
codigo_auto int,
id_cliente int,
foreign key(codigo_auto)references Auto(codigo),
foreign key(id_cliente)references Cliente(id)
);

