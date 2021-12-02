SELECT * FROM location;
INSERT INTO location (location_address, location_city) VALUES
('1544 Church Lane', 'Pleasant Grove'),
('1299 Dance Drive', 'Orem'),
('123 Music Street', 'Pleasant Grove'),
('456 Athlete Lane', 'Lindon'),
('789 Health Street', 'Lehi'),
('333 Home Drive', 'Pleasant Grove'),
('555 Learnit Lane', 'Pleasant Grove');

SELECT * FROM location_type;

INSERT INTO location_type (location_name) VALUES
('Church'),
('Gym'),
('House'),
('Park'),
('Health Center'),
('School');

SELECT * FROM location_type_at_location;  

INSERT INTO location_type_at_location (location_id, location_type_id) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '3'),
('7', '6');

SELECT * FROM employee_at_location;

INSERT INTO employee_at_location (employee_id, location_type_id) VALUES
('1', '5'),
('2', '5'),
('3', '4'),
('4', '3'),
('5', '1'),
('6', '2'),
('7', '6'),
('8', '6'),
('9', '6'),
('10', '6'),
('11', '6'),
('12', '2'),
('13', '2');


