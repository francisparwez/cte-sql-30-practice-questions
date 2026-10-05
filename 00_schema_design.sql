CREATE DATABASE CTE_Practice_DB;
GO

USE CTE_Practice_DB;
GO

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(12, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT FK_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT FK_order_items_orders FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT FK_order_items_products FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO
    customers (
        customer_id,
        customer_name,
        city,
        signup_date
    )
VALUES (
        1,
        'Ali Khan',
        'Karachi',
        '2024-01-15'
    ),
    (
        2,
        'Sara Ahmed',
        'Lahore',
        '2024-02-10'
    ),
    (
        3,
        'Hamza Malik',
        'Islamabad',
        '2024-03-05'
    ),
    (
        4,
        'Ayesha Noor',
        'Karachi',
        '2024-03-18'
    ),
    (
        5,
        'Bilal Shah',
        'Lahore',
        '2024-04-22'
    ),
    (
        6,
        'Fatima Iqbal',
        'Islamabad',
        '2024-05-12'
    ),
    (
        7,
        'Usman Tariq',
        'Karachi',
        '2024-06-01'
    ),
    (
        8,
        'Hira Saeed',
        'Rawalpindi',
        '2024-06-15'
    ),
    (
        9,
        'Danish Raza',
        'Lahore',
        '2024-07-03'
    ),
    (
        10,
        'Maham Ali',
        'Karachi',
        '2024-07-20'
    ),
    (
        11,
        'Zain Abbas',
        'Islamabad',
        '2024-08-11'
    ),
    (
        12,
        'Laiba Hassan',
        'Lahore',
        '2024-08-25'
    ),
    (
        13,
        'Omar Farooq',
        'Karachi',
        '2024-09-07'
    ),
    (
        14,
        'Sana Javed',
        'Rawalpindi',
        '2024-09-19'
    ),
    (
        15,
        'Ahmed Butt',
        'Lahore',
        '2024-10-04'
    ),
    (
        16,
        'Muneeb Aslam',
        'Karachi',
        '2024-10-18'
    ),
    (
        17,
        'Iqra Sheikh',
        'Islamabad',
        '2024-11-02'
    ),
    (
        18,
        'Talha Mir',
        'Lahore',
        '2024-11-15'
    ),
    (
        19,
        'Maryam Khan',
        'Karachi',
        '2024-12-01'
    ),
    (
        20,
        'Arslan Qureshi',
        'Rawalpindi',
        '2024-12-10'
    ),
    (
        21,
        'Nimra Tariq',
        'Karachi',
        '2025-01-08'
    ),
    (
        22,
        'Saad Ahmed',
        'Lahore',
        '2025-01-21'
    ),
    (
        23,
        'Mehwish Raza',
        'Islamabad',
        '2025-02-05'
    ),
    (
        24,
        'Fahad Ali',
        'Karachi',
        '2025-02-18'
    ),
    (
        25,
        'Anum Malik',
        'Lahore',
        '2025-03-03'
    );

INSERT INTO
    products (
        product_id,
        product_name,
        category,
        price
    )
VALUES (
        1,
        'Laptop Pro 14',
        'Laptops',
        185000
    ),
    (
        2,
        'Laptop Air 13',
        'Laptops',
        145000
    ),
    (
        3,
        'Gaming Laptop X',
        'Laptops',
        220000
    ),
    (
        4,
        'Business Laptop B',
        'Laptops',
        160000
    ),
    (
        5,
        'Smartphone Pro',
        'Smartphones',
        95000
    ),
    (
        6,
        'Smartphone Air',
        'Smartphones',
        75000
    ),
    (
        7,
        'Smartphone Lite',
        'Smartphones',
        45000
    ),
    (
        8,
        'Tablet Pro',
        'Tablets',
        85000
    ),
    (
        9,
        'Tablet Air',
        'Tablets',
        65000
    ),
    (
        10,
        'Tablet Mini',
        'Tablets',
        45000
    ),
    (
        11,
        'Wireless Headphones',
        'Accessories',
        25000
    ),
    (
        12,
        'Noise Cancelling Pro',
        'Accessories',
        35000
    ),
    (
        13,
        'Wireless Earbuds',
        'Accessories',
        18000
    ),
    (
        14,
        'Mechanical Keyboard',
        'Accessories',
        22000
    ),
    (
        15,
        'Gaming Mouse',
        'Accessories',
        12000
    ),
    (
        16,
        '4K Monitor',
        'Monitors',
        70000
    ),
    (
        17,
        'Ultrawide Monitor',
        'Monitors',
        90000
    ),
    (
        18,
        'Office Monitor',
        'Monitors',
        45000
    ),
    (
        19,
        'Smart Watch Pro',
        'Wearables',
        55000
    ),
    (
        20,
        'Smart Watch Lite',
        'Wearables',
        35000
    ),
    (
        21,
        'Fitness Band',
        'Wearables',
        18000
    ),
    (
        22,
        'USB-C Hub',
        'Accessories',
        8500
    ),
    (
        23,
        'Webcam HD',
        'Accessories',
        15000
    ),
    (
        24,
        'Portable SSD 1TB',
        'Storage',
        28000
    ),
    (
        25,
        'Portable SSD 2TB',
        'Storage',
        45000
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date,
        amount,
        status
    )
VALUES (
        1001,
        1,
        '2025-01-05',
        45000,
        'Completed'
    ),
    (
        1002,
        2,
        '2025-01-08',
        78000,
        'Completed'
    ),
    (
        1003,
        3,
        '2025-01-12',
        125000,
        'Completed'
    ),
    (
        1004,
        4,
        '2025-01-15',
        35000,
        'Pending'
    ),
    (
        1005,
        5,
        '2025-01-18',
        92000,
        'Completed'
    ),
    (
        1006,
        1,
        '2025-01-22',
        68000,
        'Completed'
    ),
    (
        1007,
        6,
        '2025-01-25',
        145000,
        'Completed'
    ),
    (
        1008,
        7,
        '2025-01-28',
        52000,
        'Cancelled'
    ),
    (
        1009,
        8,
        '2025-02-03',
        38000,
        'Completed'
    ),
    (
        1010,
        9,
        '2025-02-07',
        85000,
        'Completed'
    ),
    (
        1011,
        10,
        '2025-02-10',
        110000,
        'Completed'
    ),
    (
        1012,
        2,
        '2025-02-14',
        55000,
        'Completed'
    ),
    (
        1013,
        3,
        '2025-02-18',
        95000,
        'Pending'
    ),
    (
        1014,
        11,
        '2025-02-21',
        72000,
        'Completed'
    ),
    (
        1015,
        12,
        '2025-02-25',
        48000,
        'Completed'
    ),
    (
        1016,
        1,
        '2025-02-28',
        82000,
        'Completed'
    ),
    (
        1017,
        13,
        '2025-03-04',
        135000,
        'Completed'
    ),
    (
        1018,
        14,
        '2025-03-08',
        62000,
        'Completed'
    ),
    (
        1019,
        15,
        '2025-03-12',
        44000,
        'Cancelled'
    ),
    (
        1020,
        4,
        '2025-03-16',
        98000,
        'Completed'
    ),
    (
        1021,
        5,
        '2025-03-20',
        155000,
        'Completed'
    ),
    (
        1022,
        6,
        '2025-03-24',
        67000,
        'Completed'
    ),
    (
        1023,
        7,
        '2025-03-27',
        89000,
        'Completed'
    ),
    (
        1024,
        8,
        '2025-03-30',
        52000,
        'Pending'
    ),
    (
        1025,
        16,
        '2025-04-03',
        175000,
        'Completed'
    ),
    (
        1026,
        17,
        '2025-04-07',
        73000,
        'Completed'
    ),
    (
        1027,
        18,
        '2025-04-11',
        46000,
        'Completed'
    ),
    (
        1028,
        19,
        '2025-04-15',
        120000,
        'Completed'
    ),
    (
        1029,
        20,
        '2025-04-19',
        58000,
        'Completed'
    ),
    (
        1030,
        9,
        '2025-04-23',
        91000,
        'Completed'
    ),
    (
        1031,
        10,
        '2025-04-27',
        68000,
        'Completed'
    ),
    (
        1032,
        2,
        '2025-04-30',
        115000,
        'Completed'
    ),
    (
        1033,
        21,
        '2025-05-04',
        82000,
        'Completed'
    ),
    (
        1034,
        22,
        '2025-05-08',
        97000,
        'Completed'
    ),
    (
        1035,
        23,
        '2025-05-12',
        142000,
        'Completed'
    ),
    (
        1036,
        24,
        '2025-05-16',
        76000,
        'Completed'
    ),
    (
        1037,
        25,
        '2025-05-20',
        88000,
        'Completed'
    ),
    (
        1038,
        1,
        '2025-05-24',
        105000,
        'Completed'
    ),
    (
        1039,
        3,
        '2025-05-27',
        132000,
        'Completed'
    ),
    (
        1040,
        5,
        '2025-05-30',
        69000,
        'Completed'
    );

INSERT INTO
    order_items (
        order_id,
        product_id,
        quantity
    )
VALUES (1001, 7, 1),
    (1001, 13, 1),
    (1002, 6, 1),
    (1002, 23, 1),
    (1003, 1, 1),
    (1004, 11, 1),
    (1005, 8, 1),
    (1005, 13, 1),
    (1006, 2, 1),
    (1007, 3, 1),
    (1008, 16, 1),
    (1009, 10, 1),
    (1010, 5, 1),
    (1011, 4, 1),
    (1012, 9, 1),
    (1013, 2, 1),
    (1014, 19, 1),
    (1015, 20, 1),
    (1016, 8, 1),
    (1017, 3, 1),
    (1018, 17, 1),
    (1019, 15, 1),
    (1020, 5, 1),
    (1020, 13, 1),
    (1021, 1, 1),
    (1022, 6, 1),
    (1023, 16, 1),
    (1024, 18, 1),
    (1025, 3, 1),
    (1026, 19, 1),
    (1027, 22, 1),
    (1028, 2, 1),
    (1029, 25, 1),
    (1030, 4, 1),
    (1031, 9, 1),
    (1032, 1, 1),
    (1033, 5, 1),
    (1034, 17, 1),
    (1035, 3, 1),
    (1036, 6, 1),
    (1037, 8, 1),
    (1038, 2, 1),
    (1039, 1, 1),
    (1040, 7, 1),
    (1001, 22, 2),
    (1002, 13, 2),
    (1005, 15, 2),
    (1007, 11, 1),
    (1010, 13, 2),
    (1011, 12, 1),
    (1014, 14, 1),
    (1017, 12, 1),
    (1021, 17, 1),
    (1025, 16, 1),
    (1032, 24, 1),
    (1035, 25, 1),
    (1038, 23, 1),
    (1039, 21, 1),
    (1040, 15, 2);