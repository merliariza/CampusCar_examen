CREATE DATABASE campuscar_db;
USE campuscar_db;

CREATE TABLE CAR_DEALER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(80),
    address VARCHAR(200)
);

CREATE TABLE EMPLOYEE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    car_dealer_id INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(80),
    phone VARCHAR(20),
    address VARCHAR(200),
    position VARCHAR(20),
    document_number VARCHAR(20),
    hire_date DATE,
    FOREIGN KEY (car_dealer_id) REFERENCES CAR_DEALER(id)
);

CREATE TABLE VEHICLE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    car_dealer_id INT,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50),
    year INT,
    vin VARCHAR(17) UNIQUE NOT NULL,
    price DECIMAL(10,2),
    color VARCHAR(10),
    condition VARCHAR(10),
    fuel_type VARCHAR(50),
    transmission_type VARCHAR(50),
    stock_quantity INT,
    FOREIGN KEY (car_dealer_id) REFERENCES CAR_DEALER(id)
);

CREATE TABLE CUSTOMER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(80),
    address VARCHAR(200),
    document_number VARCHAR(20) UNIQUE
);

CREATE TABLE SALES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    employee_id INT,
    sale_date DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(id)
);

CREATE TABLE INVOICE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sales_id INT,
    invoice_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (sales_id) REFERENCES SALES(id)
);

CREATE TABLE INVOICE_DETAIL (
    id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT,
    vehicle_id INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (invoice_id) REFERENCES INVOICE(id),
    FOREIGN KEY (vehicle_id) REFERENCES VEHICLE(id)
);

CREATE TABLE PAYMENT_METHOD (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE INVOICE_PAYMENT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT,
    payment_method_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (invoice_id) REFERENCES INVOICE(id),
    FOREIGN KEY (payment_method_id) REFERENCES PAYMENT_METHOD(id)
);

CREATE TABLE MOV_TYPE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    description TEXT
);

CREATE TABLE MOVEMENT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT,
    mov_type_id INT,
    quantity INT,
    movement_date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES VEHICLE(id),
    FOREIGN KEY (mov_type_id) REFERENCES MOV_TYPE(id)
);

CREATE TABLE MAINTENANCE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT,
    customer_id INT,
    service_date DATE,
    service_type VARCHAR(20),
    cost DECIMAL(10,2),
    description TEXT,
    FOREIGN KEY (vehicle_id) REFERENCES VEHICLE(id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id)
);

CREATE TABLE MAINTENANCE_DETAIL (
    id INT PRIMARY KEY AUTO_INCREMENT,
    maintenance_id INT,
    service_description TEXT,
    service_cost DECIMAL(10,2),
    FOREIGN KEY (maintenance_id) REFERENCES MAINTENANCE(id)
);