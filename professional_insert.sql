SELECT * FROM profession_type;

INSERT INTO profession_type (profession) VALUES
	('Pediatrician'),
    ('Dentist'),
    ('Soccer Coach'),
    ('Church Leader'),
    ('Piano Teacher'),
    ('Dance Teacher'),
    ('School Teacher');
    
INSERT INTO profession_type (profession) VALUES
('Parent');

SELECT * FROM employee;
    
INSERT INTO employee (first_name, last_name) VALUES
	('Matthew', 'Brown'),
    ('Reggie', 'Silver'),
    ('Butch', 'Beckham'),
    ('Molly', 'Graham'),
    ('Peter', 'Graham'),
    ('Alyssa', 'Michaels'),
    ('Cathy', 'Smee'),
    ('Roger', 'Lewis'),
    ('Bonnie', 'Potter'),
    ('Carol', 'Hill'),
    ('Ron', 'Snape');
    
#realized I needed to add parents 
INSERT INTO employee (first_name, last_name) VALUES
('Mamma','Bear'),
('Papa', 'Bear');
    
SELECT * FROM employee_profession_type;

INSERT INTO employee_profession_type (employee_id, profession_type_id) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('4', '5'),
('5', '4'),
('6', '6'),
('7', '7'),
('8', '7'),
('9', '7'),
('10', '7'),
('11', '7');

INSERT INTO employee_profession_type (employee_id, profession_type_id) VALUES
('12', '8'),
('13', '8');
    
    



    
    