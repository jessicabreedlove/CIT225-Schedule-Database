# Test case scenarios for my database :)



#1. What activities does Robert have in the month of December?
SELECT c.first_name AS Child, a.type AS Activity, MONTHNAME(sa.date) AS Month
FROM activity a 
	INNER JOIN scheduled_activities sa 
    ON a.activity_id = sa.activity_id
    INNER JOIN child_has_scheduled_activities cha
    ON cha.scheduled_activities_id = sa.scheduled_activities_id
    INNER JOIN child c 
    ON c.child_id = cha.child_id
WHERE c.first_name = 'Robert'
GROUP BY a.type;

#2. What activities does Brandon have in the month of December?
SELECT c.first_name AS Child, a.type AS Activity, MONTHNAME(sa.date) AS Month
FROM activity a 
	INNER JOIN scheduled_activities sa 
    ON a.activity_id = sa.activity_id
    INNER JOIN child_has_scheduled_activities cha
    ON cha.scheduled_activities_id = sa.scheduled_activities_id
    INNER JOIN child c 
    ON c.child_id = cha.child_id
WHERE c.first_name = 'Brandon'
GROUP BY a.type;

#3. What activities does Sarah have in the month of December?
SELECT c.first_name AS Child, a.type AS Activity, MONTHNAME(sa.date) AS Month
FROM activity a 
	INNER JOIN scheduled_activities sa 
    ON a.activity_id = sa.activity_id
    INNER JOIN child_has_scheduled_activities cha
    ON cha.scheduled_activities_id = sa.scheduled_activities_id
    INNER JOIN child c 
    ON c.child_id = cha.child_id
WHERE c.first_name = 'Sarah'
GROUP BY a.type;

#4. What is Sarahs's birthday?
SELECT first_name AS Child, DATE_FORMAT(birthday, '%M %D %Y') AS Birthday
FROM child
WHERE first_name = 'Sarah';

#5. Who is in charge of the coming Family Home Evenings?
SELECT e.first_name, a.type, sa.date 
FROM employee e 
	INNER JOIN scheduled_activities sa
    ON e.employee_id = sa.employee_id
    INNER JOIN activity a
    ON a.activity_id = sa.activity_id
WHERE a.type LIKE 'Family%';

#6. Who is the soccer coach?
SELECT e.first_name, e.last_name, pt.profession
FROM employee e INNER JOIN
	employee_profession_type ept
    ON ept.employee_id = e.employee_id
    INNER JOIN profession_type pt
    ON pt.profession_type_id = ept.profession_type_id
WHERE profession LIKE 'soccer%';
	

#7. How many times does Sarah have dance in December?

#8. Who's teacher is having a class party? 


#9. What teacher is having the class party and when is it?

#10. How many activites are happening at the Health center in December?
