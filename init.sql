CREATE TABLE reservations_log (
    id SERIAL PRIMARY KEY,
    hotel_name VARCHAR(64),
    room_name VARCHAR(64),
    guest_first_name VARCHAR(64),
    guest_last_name VARCHAR(64),
    guest_email VARCHAR(255),
    start_date DATE,
    end_date DATE
);

CREATE TABLE guest_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64)
);

CREATE TABLE guest (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    email VARCHAR(255),
    type_id INTEGER REFERENCES guest_type(id)
);

CREATE TABLE room_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64)
);

CREATE TABLE hotel (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    description VARCHAR(255),
    stars INTEGER
);

CREATE TABLE room (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    description VARCHAR(255),
    floor INTEGER,
    max_guests INTEGER,
    type_id INTEGER REFERENCES room_type(id),
    hotel_id INTEGER REFERENCES hotel(id)
);

CREATE TABLE reservation (
    id SERIAL PRIMARY KEY,
    room_id INTEGER REFERENCES room(id),
    guest_id INTEGER REFERENCES guest(id),
    start_date DATE,
    end_date DATE,
    check_in BOOLEAN,
    check_out BOOLEAN
);

-- Insertar datos en guest_type
INSERT INTO guest_type (name) VALUES
    ('VIP'),
    ('No VIP');

-- Insertar datos en hotel
INSERT INTO hotel (name, description, stars) VALUES
    ('Grand Luxe Hotel', 'Elegante hotel de lujo con vistas impresionantes y comodidades de clase mundial.', 5),
    ('Centro Plaza Hotel', 'Ubicado en el corazón del centro de la ciudad, ofrece comodidad y accesibilidad.', 4),
    ('Marina Resort & Spa', 'Hotel frente al mar con spa, piscinas y restaurantes gourmet.', 4),
    ('Skyline Suites', 'Exclusivas suites con vistas panorámicas de la ciudad y servicios de alta calidad.', 5),
    ('Coastal Retreat Hotel', 'Un refugio tranquilo junto al océano con habitaciones cómodas y relajantes.', 3);

-- Insertar datos en room_type
INSERT INTO room_type (name) VALUES
    ('Suite'),
    ('Habitación Doble'),
    ('Habitación Individual'),
    ('Suite Ejecutiva'),
    ('Estudio');

-- Insertar datos en room
INSERT INTO room (name, description, floor, max_guests, type_id, hotel_id) VALUES
    ('Habitación 101', 'Descripción de la Habitación 101', 1, 2, 1, 1),
    ('Habitación 102', 'Descripción de la Habitación 102', 2, 1, 3, 1),
    ('Habitación 201', 'Descripción de la Habitación 201', 1, 2, 2, 2),
    ('Habitación 202', 'Descripción de la Habitación 202', 2, 3, 4, 2),
    ('Habitación 301', 'Descripción de la Habitación 301', 1, 2, 5, 3);

-- Insertar datos en guest
INSERT INTO guest (first_name, last_name, email, type_id) VALUES
    ('Juan', 'Pérez', 'juan@example.com', 1),
    ('María', 'González', 'maria@example.com', 2),
    ('Carlos', 'Martínez', 'carlos@example.com', 2),
    ('Laura', 'Gómez', 'laura@example.com', 1),
    ('Pablo', 'Rodríguez', 'pablo@example.com', 2);

-- Insertar datos en reservation
INSERT INTO reservation (room_id, guest_id, start_date, end_date, check_in, check_out) VALUES
    (1, 1, '2024-02-01', '2024-02-10', true, true),
    (2, 2, '2024-03-15', '2024-03-20', true, true),
    (3, 3, '2024-04-01', '2024-04-10', true, true),
    (4, 4, '2024-05-10', '2024-05-20', true, true),
    (5, 5, '2024-06-01', '2024-06-10', true, true);

-- Insertar datos en reservations_log
INSERT INTO reservations_log (hotel_name, room_name, guest_first_name, guest_last_name, guest_email, start_date, end_date)
VALUES
    ('Grand Luxe Hotel', 'Habitación 101', 'Juan', 'Pérez', 'juan@example.com', '2024-02-01', '2024-02-10'),
    ('Grand Luxe Hotel', 'Habitación 102', 'María', 'Gómez', 'maria@example.com', '2024-03-15', '2024-03-20'),
    ('Centro Plaza Hotel', 'Habitación 201', 'Carlos', 'Martínez', 'carlos@example.com', '2024-04-01', '2024-04-10'),
    ('Centro Plaza Hotel', 'Habitación 202', 'Laura', 'Gómez', 'laura@example.com', '2024-05-10', '2024-05-20'),
    ('Marina Resort & Spa', 'Habitación 301', 'Pablo', 'Rodríguez', 'pablo@example.com', '2024-06-01', '2024-06-10');
