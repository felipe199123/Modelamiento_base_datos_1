CREATE TABLE Cliente ( 
  rut_cliente       NUMBER(11) NOT NULL, 
  dv CHAR(1)        NOT NULL, 
  primer_nombre     VARCHAR2(250) NOT NULL, 
  segundo_nombre    VARCHAR2(250), 
  apellido_paterno  VARCHAR2(250) NOT NULL, 
  apellido_materno  VARCHAR2(250), 
  direccion         VARCHAR2(250) NOT NULL, 
  fono              NUMBER NOT NULL, 
  correo            VARCHAR2(250) NOT NULL, 
  comuna_id         NUMBER NOT NULL 
)  
CREATE TABLE Cliente ( 
  rut_cliente       NUMBER(11) NOT NULL, 
  dv CHAR(1)        NOT NULL, 
  primer_nombre     VARCHAR2(250) NOT NULL, 
  segundo_nombre    VARCHAR2(250), 
  apellido_paterno  VARCHAR2(250) NOT NULL, 
  apellido_materno  VARCHAR2(250), 
  direccion         VARCHAR2(250) NOT NULL, 
  fono              NUMBER NOT NULL, 
  correo            VARCHAR2(250) NOT NULL, 
  comuna_id         NUMBER NOT NULL 
);

-- Añadir la PK a la Tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT cliente_PK PRIMARY KEY (rut_cliente);

CREATE TABLE Comunas( 
    id_comuna NUMBER NOT NULL, 
    nombre VARCHAR2(250) NOT NULL, 
    provincia_id NUMBER NOT NULL 
);

ALTER TABLE Comunas ADD CONSTRAINT comuna_PK PRIMARY KEY (id_comuna);

-- Añadir la Clave Foranea o FK a la tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT comuna_FK FOREIGN KEY (comuna_id) 
    REFERENCES Comunas (id_comuna);
    
-- Ingresar datos en la Comunas
INSERT INTO Comunas VALUES(1, 'Arica', 1);
INSERT INTO Comunas VALUES(2, 'los Muermos', 1);

-- Ingresar datos a la tabla Clientes
INSERT INTO Clientes VALUES(123,'K','Alan','','Brito','','Su casa #123',5555,'alan@brito.cl',1);
INSERT INTO Clientes VALUES(321,'K','Pedro','','Brito','','Su casa #123',6666,'pedro@brito.cl',1);

-- Select básico
SELECT * FROM Clientes;
SELECT * FROM  Comunas;

-- Select Ordenado según columna
SELECT * FROM Clientes ORDER BY primer_nombre DESC;

SELECT
   cl.primer_nombre AS "Nombre",
    cl.apellido_paterno AS "Apellido",
    cl.comuna_id AS "comuna"
FROM Clientes 
    JOIN Comunas co ON (cl.comuna_id = co.id_comuna);
    
    
SELECT * FROM Comunas;

SELECT * FROM Clientes;

SELECT 
    co.nombre
FROM Comunas co;

SELECT 
    cl.rut_cliente,
    cl.primer_nombre,
    cl.apellido_paterno,
    cl.comuna_id
FROM Clientes cl;

SELECT 
    cl.rut_cliente AS "Rut",
    cl.primer_nombre,
    cl.apellido_paterno,
    cl.comuna_id,
    co.nombre AS "Nombre Comuna"
FROM Clientes cl 
    JOIN Comunas co ON (cl.comuna_id = co.id_comuna)
;