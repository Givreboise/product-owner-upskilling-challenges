---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
-- select * FROM sites

-- Get all sites sorted by name
-- select * FROM sites ORDER BY name ASC

-- Gett all activity names sorted by name
-- select name FROM activities ORDER BY name ASC

-- Get all "Sport" activities
-- select category FROM activities WHERE category = 'Sport'

-- Get all Escape Games in Nantes
-- select * FROM activities WHERE name LIKE '%Escape Game%' AND city = 'Nantes'

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
-- SELECT COUNT (*) FROM activities

-- Count all "Adventure" activities
-- SELECT COUNT (*) FROM activities WHERE category ='Adventure'

-- Count the number of activities per category
-- SELECT COUNT (*) AS total, category FROM activities GROUP BY category

-- Get the 3 category names with the biggest number of activities
SELECT COUNT (*) AS total, category FROM activities GROUP BY category ORDER BY total DESC LIMIT 3

---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working from site ile de Nantes sorted by first name
SELECT * FROM employees JOIN sites ON sites.id = employees.site_id WHERE sites.name = 'Ile de Nantes'

-- Get all the activity names where you have been to, sorted by name
SELECT name FROM activities
JOIN team_building_sessions ON team_building_sessions.activity_id = activities.id
JOIN participations	ON participations.team_building_session_id = team_building_sessions.id
JOIN employees ON employees.id = participations.employee_id
WHERE employees.first_name = 'Chloé' AND employees.last_name = 'Fluzin'

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
SELECT DISTINCT teams.name FROM teams
JOIN team_building_sessions ON teams.id = team_building_sessions.team_id
JOIN activities ON activities.id = team_building_sessions.activity_id
WHERE category = 'Adventure'
ORDER BY teams.name ASC

-- Get the team names and total number of team building sessions done, sorted by top teams
SELECT teams.name, COUNT (team_building_sessions.id) AS total_sessions FROM team_building_sessions
JOIN teams ON team_building_sessions.team_id = teams.id
GROUP BY teams.name
ORDER BY total_sessions desc

-- Get all the employee names, team names and site names that have never attended a team building session
SELECT employees.last_name,
employees.first_name,
teams.name,
sites.name
FROM employees
JOIN teams ON teams.id = employees.team_id
JOIN sites ON sites.id = employees.site_id
LEFT JOIN participations ON participations.employee_id = employees.id WHERE participations.employee_id IS NULL

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to leASt expensive
SELECT teams.name, SUM(team_building_sessions.price) AS total_price FROM team_building_sessions
JOIN teams ON teams.id = team_building_sessions.team_id
GROUP BY teams.name
ORDER BY total_price DESC

-- Get the site names and total number of team building sessions done, sorted by top sites
SELECT sites.name, COUNT(DISTINCT team_building_sessions.id) AS total_sessions FROM sites
JOIN employees ON employees.site_id = sites.id
JOIN participations ON participations.employee_id = employees.id
JOIN team_building_sessions ON team_building_sessions.id = participations.team_building_session_id
GROUP BY sites.name
