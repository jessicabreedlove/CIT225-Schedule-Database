SELECT * FROM activity_category;
INSERT INTO activity_category (activity_category) VALUES
	('Church'),
    ('School'),
    ('Medical'),
    ('Extra-Curricular'),
    ('Family');
    
SELECT * FROM activity;

INSERT INTO activity (type, activity_category_id) VALUES
('Piano', '4'),
('Soccer', '4'),
('Dance', '4'),
('Youth Activity', '1'),
('Dentist Appointment', '3'),
('Doctor Appointment', '3'),
('Family Home Evening', '5'),
('Class Party', '2');

