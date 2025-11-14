USE mgmtsys;

CREATE TABLE Employee(
    employee_id INT,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    hours_worked SMALLINT NOT NULL,
    salary DECIMAL(10,2) NOT NULL,

    PRIMARY KEY(employee_id),
    CHECK(hours_worked >= 0 AND hours_worked <= 50),
    CHECK(salary > 0),
    UNIQUE(email)
);

DESCRIBE Employee;

CREATE TABLE SalesAssociate(
    employee_id INT,
    commission_rate DECIMAL(5,2) NOT NULL,

    PRIMARY KEY(employee_id),
    FOREIGN KEY(employee_id) REFERENCES Employee(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE SalesAssociate;

CREATE TABLE Manager(
    employee_id INT,
    bonus_rate DECIMAL(5,2) NOT NULL,

    PRIMARY KEY(employee_id),
    FOREIGN KEY(employee_id) REFERENCES Employee(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE Manager;

CREATE TABLE Store(
    store_id INT,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(15) NOT NULL,
    postcode VARCHAR(7) NOT NULL,
    employee_id INT,

    PRIMARY KEY(store_id),
    FOREIGN KEY(employee_id) REFERENCES Manager(employee_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE Store;

CREATE TABLE Customer(
    customer_id INT,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    gender VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,

    PRIMARY KEY(customer_id),
    UNIQUE(email),
    UNIQUE(phone_number)
);

DESCRIBE Customer;

CREATE TABLE Warehouse(
    warehouse_id INT,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(15) NOT NULL,
    postcode VARCHAR(7) NOT NULL,
    sqft DECIMAL(10,2) NOT NULL,
    capacity INT NOT NULL,

    PRIMARY KEY(warehouse_id),
    CHECK(sqft > 0),
    CHECK(capacity > 0)
);

DESCRIBE Warehouse;

CREATE TABLE Supplies(
    store_id INT,
    warehouse_id INT,

    PRIMARY KEY(store_id, warehouse_id),
    FOREIGN KEY(store_id) REFERENCES Store(store_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(warehouse_id) REFERENCES Warehouse(warehouse_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

DESCRIBE Supplies;

CREATE TABLE Supplier(
    supplier_id INT,
    supplier_name VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(15) NOT NULL,
    postcode VARCHAR(7) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,

    PRIMARY KEY(supplier_id),
    UNIQUE(email),
    UNIQUE(phone)
);

DESCRIBE Supplier;

CREATE TABLE Product(
    product_id INT,
    product_name VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    discount DECIMAL(3,2) NOT NULL,
    pricing DECIMAL(10,2) NOT NULL,
    supplier_id INT NOT NULL,
    warehouse_id INT NOT NULL,

    PRIMARY KEY(product_id),
    FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(warehouse_id) REFERENCES Warehouse(warehouse_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK(discount >=0 AND discount <= 1),
    CHECK(pricing > 0)
);

DESCRIBE Product;

CREATE TABLE Shipment(
    shipment_id INT,
    store_id INT NOT NULL,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    arrival_date DATE,
    num_pallet INT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,

    PRIMARY KEY(shipment_id),
    FOREIGN KEY(store_id) REFERENCES Store(store_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK(num_pallet >0),
    CHECK(cost > 0),
    CHECK(arrival_date IS NULL OR arrival_date > order_date)
);

DESCRIBE Shipment;

CREATE TABLE ProductShipment(
    shipment_id INT,
    product_id INT,

    PRIMARY KEY(product_id, shipment_id),
    FOREIGN KEY(shipment_id) REFERENCES Shipment(shipment_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(product_id) REFERENCES Product(product_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

DESCRIBE ProductShipment;

CREATE TABLE Sale(
    sale_id INT,
    order_type VARCHAR(50) NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    sale_date DATE NOT NULL,

    PRIMARY KEY(sale_id),
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(employee_id) REFERENCES Employee(employee_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(product_id) REFERENCES Product(product_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(store_id) REFERENCES Store(store_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

DESCRIBE Sale;

CREATE TABLE Advertisement (
    ad_id INT,
    ad_name VARCHAR(100) NOT NULL,
    channels VARCHAR(50) NOT NULL,
    budget DECIMAL(12,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    PRIMARY KEY (ad_id),

    CHECK (budget > 0),
    CHECK (end_date >= start_date)
);

DESCRIBE Advertisement;

CREATE TABLE Ad_Product (
    ad_id INT,
    product_id INT,

    PRIMARY KEY (ad_id, product_id),

    FOREIGN KEY (ad_id) REFERENCES Advertisement(ad_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE Ad_Product;

CREATE INDEX idx_store_city ON Store(city);
CREATE INDEX idx_customer_email ON Customer(email);
CREATE INDEX idx_product_category ON Product(category);
CREATE INDEX idx_product_brand ON Product(brand);
CREATE INDEX idx_sale_date ON Sale(sale_date);
CREATE INDEX idx_advertisement_channels ON Advertisement(channels);

CREATE INDEX idx_product_supplier_id ON Product(supplier_id);
CREATE INDEX idx_sale_customer_id ON Sale(customer_id);
CREATE INDEX idx_sale_employee_id ON Sale(employee_id);
CREATE INDEX idx_sale_store_id ON Sale(store_id);
