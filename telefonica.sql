CREATE DATABASE telefonica;

USE telefonica;

CREATE TABLE provincias(
  codProvincia INT PRIMARY KEY,
  nombre VARCHAR(20)
);

CREATE TABLE clientes(
  codCliente INT PRIMARY KEY,
  provincia REFERENCES provincias,
  nroCuit INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  ciudad VARCHAR(20),
  telefono1 INT,
  telefono2 INT,
  codPostal INT,
);

CREATE TABLE tipoLlamados(
  codTipoLlamado INT PRIMARY KEY,
  descripcion VARCHAR(100)
);

CREATE TABLE llamados(
  codLlamado INT PRIMARY KEY,
  cliente INT REFERENCES clientes,
  tipoLlamado INT REFERENCES tipoLlamados,
  fecha DATE NOT NULL,
  telefono INT,
  duracion INT
);

CREATE TABLE facturas(
  numero INT,
  letra VARCHAR(1),
  cliente INT REFERENCES clientes,
  fechaEmision DATE NOT NULL,
  fechaVencimiento DATE NOT NULL,
  PRIMARY KEY (numero, letra)
);

CREATE TABLE facturaItems(
  numeroItem INT PRIMARY KEY,
  factura INT REFERENCES facturas,
  precio DECIMAL (10,2),
  cantidad SMALLINT
);

CREATE TABLE fabricantes(
  codFabricante INT PRIMARY KEY,
  nombre VARCHAR(20),
  tiempoEntregaPromedio INT
);

CREATE TABLE productos(
  codProducto INT PRIMARY KEY,
  facturaItem INT REFERENCES facturas,
  fabricante INT REFERENCES fabricantes,
  nombre VARCHAR(20),
  precioUnitario DECIMAL (10,2)
);
