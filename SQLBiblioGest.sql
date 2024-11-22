CREATE DATABASE BiblioGest;
GO

USE BiblioGest;
GO

CREATE TABLE Categoria (
ID_Categoria INT PRIMARY KEY IDENTITY(1,1),
Nombre_Categoria NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Libro (
ID_Libro INT PRIMARY KEY IDENTITY(1,1),
Titulo NVARCHAR(255) NOT NULL,
ISBN NVARCHAR(20) UNIQUE NOT NULL,
Fecha_Publicacion DATE,
Editorial NVARCHAR(100),
Genero NVARCHAR(50),
ID_Categoria int,
FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);
GO

CREATE TABLE Autor (
ID_Autor INT PRIMARY KEY IDENTITY(1,1),
Nombre NVARCHAR(100) NOT NULL,
Apellido NVARCHAR(100) NOT NULL,
Nacionalidad NVARCHAR(50)
);
GO

CREATE TABLE Libro_Autor(
ID_Libro INT,
ID_Autor INT,
PRIMARY KEY (ID_Libro, ID_Autor),
FOREIGN KEY(ID_Libro) REFERENCES Libro(ID_Libro),
FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor)
);
GO

CREATE TABLE Ejemplar( 
ID_Ejemplar INT PRIMARY KEY IDENTITY(1,1),
ID_Libro INT NOT NULL,
Estado NVARCHAR(50) CHECK (Estado IN ('disponible', 'prestado', 'en reparación', 'perdido')),
FOREIGN KEY (ID_Libro) REFERENCES Libro(ID_Libro)
);
GO

CREATE TABLE Usuario (
ID_Usuario INT PRIMARY KEY IDENTITY(1,1),
Cedula NVARCHAR(20) UNIQUE NOT NULL,
Nombre NVARCHAR(100) NOT NULL,
Apellido NVARCHAR(100),
Email NVARCHAR(100) UNIQUE NOT NULL,
Direccion NVARCHAR(255) UNIQUE,
Telefono NVARCHAR(20) UNIQUE,
Genero CHAR(1) CHECK (Genero IN('M', 'F','O')) NOT NULL,
Tipo_Usuario NVARCHAR(50) CHECK (Tipo_Usuario IN ('estudiante', 'profesor', 'administrativo')) NOT NULL
);
GO

CREATE TABLE Prestamo(
ID_Prestamo INT PRIMARY KEY IDENTITY(1,1),
Fecha_Prestamo DATE NOT NULL,
Fecha_Devolucion DATE,
ID_Usuario INT NOT NULL,
ID_Ejemplar INT NOT NULL,
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
FOREIGN KEY(ID_Ejemplar) REFERENCES Ejemplar(ID_Ejemplar)
);
GO

SELECT * FROM Categoria;
SELECT * FROM Libro;
SELECT * FROM Autor;
SELECT * FROM Libro_Autor;
SELECT * FROM Ejemplar;
SELECT * FROM Usuario;
SELECT * FROM Prestamo;
GO

INSERT INTO Categoria (Nombre_Categoria)
VALUES
      ('Ciencia Ficción'),
	  ('Fantasía'),
	  ('Terror'),
	  ('Historia'),
	  ('Educación'),
	  ('Romance'),
	  ('Biografía');
GO

INSERT INTO Libro (Titulo, ISBN, Fecha_Publicacion, Editorial, Genero, ID_Categoria)
VALUES
      ('El señor de los anillos', '978-1234567890', '1954-07-09', 'Allen & Unwin', 'Fantasía',2),
	  ('Fundación', '978-9876543210','1951-05-15', 'Gnome Press', 'Ciencia Ficción', 1),
	  ('Drácula', '978-1928374560','1897-05-26','Archibald Constable and Company', 'Terror',3),
	  ('Imperio Romano', '978-85529637410', '1967-06-05', 'Sudamericana', 'Historia',4),
	  ('El alquimista', '978-673849123445', '1988-05-10', 'HarpeOne', 'Romance', 6);
GO

INSERT INTO Autor (Nombre, Apellido, Nacionalidad)
VALUES
      ('J.R.R.', 'Tolkien', 'Inglés'),
	  ('Isaac', 'Asimov', 'Ruso'),
	  ('Bram', 'Stoker', 'Irlandés'),
	  ('Edward', 'Gobbon', 'Británico'),
	  ('Paulo', 'Coelho', 'Brasileño');
GO

INSERT INTO Libro_Autor (ID_Libro, ID_Autor)
VALUES
      (1, 1),
	  (2, 2),
	  (3, 3),
	  (4, 4),
	  (5, 5);
GO

INSERT INTO Ejemplar (ID_Libro,Estado)
VALUES
      (1, 'disponible'),
	  (2, 'prestado'),
	  (3, 'perdido'),
	  (4,'en reparación'),
	  (5, 'disponible');
GO

INSERT INTO Usuario (Cedula, Nombre, Apellido,Email,Direccion, Telefono, Genero, Tipo_Usuario)
VALUES
      ('123456789', 'Juan', 'Pérez', 'juan.perez@gmail.com', 'Calle123a#152-67', '555123456', 'M', 'estudiante'),
	  ('987654321', 'Ana', 'López', 'ana.lopez@gmail.com', 'Calle153a#110-63', '555987654', 'F', 'estudiante'),
	  ('012345678', 'Carlos', 'Gómez', 'carlos.gomez@gmail.com', 'Calle133a#150-68', '5550128394', 'M', 'profesor'),
	  ('087654321', 'Lucía', 'Martínez', 'lucia,martinez@gmail.com', 'Calle100a#100-66', '555456372', 'F', 'estudiante'),
	  ('918273460', 'Andrés', 'Ramírez', 'andres,ramirez@gmail.com', 'Calle115a#132-13', '555098763', 'M', 'administrativo');
GO

INSERT INTO Prestamo (Fecha_Prestamo,Fecha_Devolucion, ID_Usuario, ID_Ejemplar)
VALUES
      ('2024-11-01', '2024-11-14', 1,1),
	  ('2024-11-03', '2024-11-17', 2,2),
	  ('2024-11-03', '2024-11-17', 3, 3),
	  ('2024-11-10', '2024-11-20', 4,3),
	  ('2024-11-12', '2024-11- 22', 5,5);
GO

SELECT * FROM Categoria;
SELECT * FROM Libro;
SELECT * FROM Autor;
SELECT * FROM Libro_Autor;
SELECT * FROM Ejemplar;
SELECT * FROM Usuario;
SELECT * FROM Prestamo;
GO