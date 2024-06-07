---- tabla productos 

CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Categoria VARCHAR(50),
    PrecioVenta DECIMAL(10, 2),
    StockActual INT,
    StockMinimo INT,
    Proveedor INT,
    FOREIGN KEY (Proveedor) REFERENCES Proveedores(ProveedorID)
);

---- tabla proveedores

CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY,
    NombreProveedor VARCHAR(100),
    Contacto VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE ProveedorEnvio (
    ProveedorEnvioID INT PRIMARY KEY,
    NombreProveedor VARCHAR(100),
    Contacto VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Direccion VARCHAR(100)
);

---- Ventas 

CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY,
    Fecha DATE,
    ClienteID INT,
    TotalVenta DECIMAL(10, 2),
    TotalDomicilio DECIMAL(10, 2),
    MedioPagoID INT,
    FOREIGN KEY (MedioPagoID) REFERENCES MediosPagos(MediospagoID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE DetalleVentas (
    DetalleVentaID INT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);


---- Medio_Pago

CREATE TABLE MediosPagos (
    MedioPagoID INT PRIMARY KEY,
    NombreMediosPago VARCHAR(50),
    TotalSaldo DECIMAL(10, 2),
    FechaEnvio DATE
);

---- Cuentas 

CREATE TABLE Cuentas (
   CuentasID INT PRIMARY KEY,
   NombreCuenta VARCHAR (100),
   NumeroCuenta INT,
   TotalSaldo DECIMAL(10, 2)
);


---- Compra

CREATE TABLE Compras (
    CompraID INT PRIMARY KEY,
    Fecha DATE,
    ProveedorID INT,
    TotalCompra DECIMAL(10, 2),
    ProveedorEnvio INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID),
    FOREIGN KEY (ProveedorEnvioID) REFERENCES ProveedoresEnvio(ProveedoresEnvioID)
    
);

CREATE TABLE DetalleCompras (
    DetalleCompraID INT PRIMARY KEY,
    CompraID INT,
    ProductoID INT,
    Cantidad INT,
    CostoUnitario DECIMAL(10, 2),
    FOREIGN KEY (CompraID) REFERENCES Compras(CompraID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);