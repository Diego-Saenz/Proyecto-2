drop database if exists Concesionario;
create database Concesionario;
use Concesionario;

create table Cliente(
id int primary key,
nombre varchar(50),
direccion varchar(50),
telefono varchar(20),
email varchar(50)
);

create table Auto(
codigo int primary key,
tipo varchar(50),
modelo varchar(50),
precio decimal,
año date,
imagen text,
detalle_auto int,
foreign key (detalle_auto)references DetalleAuto(id)
);

create table DetalleAuto(
	id int primary key,
	motor varchar(50),
	caballos int,
	color varchar(50),
	tamaño varchar(50),
	vel_max int(4)
);


create table Venta(
	id int primary key,
	metodo_pago varchar(50),
	precio_total decimal,
	modo_entrega varchar(50),
	fecha_pago date,
	codigo_auto int,
	id_cliente int,
	foreign key(codigo_auto)references Auto(codigo),
	foreign key(id_cliente)references Cliente(id)
);

create table Factura(
	codigo int primary key,
    numTarjeta bigint,
    codSeguridad int,
    vencimineto date,
    Titular varchar(50),
    venta_id int,
    foreign key(venta_id) references venta(id)
);

-- Inserción de clientes
INSERT INTO Cliente (id, nombre, direccion, telefono, email)
VALUES
  (1, 'Juan Pérez', 'Av. Siempreviva 123', '123456789', 'juanperez@email.com'),
  (2, 'María López', 'Calle de las Flores 456', '987654321', 'marialopez@email.com'),
  (3, 'Pedro Gómez', 'Calle Principal 789', '555555555', 'pedrogomez@email.com'),
  (4, 'Ana Rodríguez', 'Calle Secundaria 101', '444444444', 'anarodriguez@email.com');

-- Inserción de detalles de autos
INSERT INTO DetalleAuto (id, motor, caballos, color, tamaño, vel_max)
VALUES
  (1, '1.6L Turbo', 150, 'Rojo', 'Compacto', 200),
  (2, '2.0L', 180, 'Negro', 'Mediano', 220),
  (3, '3.0L Diesel', 250, 'Blanco', 'Grande', 180),
  (4, '3.0L Diesel', 250, 'Gris', 'Grande', 180);

-- Inserción de autos
INSERT INTO Auto (codigo, tipo, modelo, precio, año, imagen, detalle_auto)
VALUES
  (1, 'sedan', 'Clase A', 25000, '2023-01-01', 'clase_a.jpg', 1),
  (2, 'sedan', 'Clase C', 35000, '2023-05-01', 'clase_c.jpg', 2),
  (3, 'van', 'Sprinter Furgon', 45000, '2022-11-01', 'sprinter_furgon.jpg', 3),
  (4, 'van', 'Sprinter Mixto', 50000, '2023-03-01', 'sprinter_mixto.jpg', 4);

-- Inserción de ventas
INSERT INTO Venta (id, metodo_pago, precio_total, modo_entrega, fecha_pago, codigo_auto, id_cliente)
VALUES
  (1, 'Tarjeta de Crédito', 25000, 'Concesionario', '2023-01-15', 1, 1),
  (2, 'Transferencia Bancaria', 35000, 'A domicilio', '2023-05-10', 2, 2),
  (3, 'Tarjeta de Débito', 45000, 'Concesionario', '2022-11-15', 3, 3),
  (4, 'Efectivo', 50000, 'A domicilio', '2023-03-20', 4, 4);
  
-- Inserción de facturas (asumiendo que todas las ventas se pagaron con tarjeta)
INSERT INTO Factura (codigo, numTarjeta, codSeguridad, vencimineto, Titular, venta_id)
VALUES
  (1, 1234567890123456, 123, '2025-12-31', 'Juan Pérez', 1),
  (2, 9876543210987654, 456, '2024-06-30', 'María López', 2),
  (3, 5555555555555555, 789, '2024-12-31', 'Pedro Gómez', 3),
  (4, 4444444444444444, 101, '2025-03-31', 'Ana Rodríguez', 4);