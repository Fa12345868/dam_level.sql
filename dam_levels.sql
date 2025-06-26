USE dam_levels ;
DROP TABLE IF EXISTS damm_levels ;
CREATE TABLE damm_levels (
	year INT , 
    dam_name VARCHAR(100) , 
    assessment_officer VARCHAR(100) ,
    officer_reg INT , 
    water_level NUMERIC (10,1),
    dam_latitude DECIMAL(9,6),
    dam_longitude DECIMAL(9,6)
);  

INSERT INTO damm_levels (year, dam_name, assessment_officer, officer_reg, water_level, dam_latitude, dam_longitude)
VALUES
    (2014, "STEENBRAS LOWER", "V. Mokere", 201124, 21.5, -34.180527, 18.866688),
    (2015, "STEENBRAS LOWER", "V. Mokere", 201124, 22.7, -34.180527, 18.866688),
    (2016, "STEENBRAS LOWER", "V. Mokere", 201124, 23.2, -34.180527, 18.866688),
    (2017, "STEENBRAS LOWER", "V. Mokere", 201124, 19.1, -34.180527, 18.866688),
    (2018, "STEENBRAS LOWER", "V. Mokere", 201124, 18.6, -34.180527, 18.866688),

    (2014, "THEEWATERSKLOOF", "S. Dlamini", 201130, 42.0, -33.987892, 19.204830),
    (2015, "THEEWATERSKLOOF", "S. Dlamini", 201130, 38.3, -33.987892, 19.204830),
    (2016, "THEEWATERSKLOOF", "S. Dlamini", 201130, 35.5, -33.987892, 19.204830),
    (2017, "THEEWATERSKLOOF", "S. Dlamini", 201130, 29.7, -33.987892, 19.204830),
    (2018, "THEEWATERSKLOOF", "S. Dlamini", 201130, 26.4, -33.987892, 19.204830),

    (2016, "VOELVLEI", "A. Peterson", 201145, 37.5, -33.289410, 19.089430),
    (2017, "VOELVLEI", "A. Peterson", 201145, 31.2, -33.289410, 19.089430),
    (2018, "VOELVLEI", "A. Peterson", 201145, 28.9, -33.289410, 19.089430),

    (2017, "BERG RIVER", "M. Ndlovu", 201150, 35.0, -33.250000, 19.050000),
    (2018, "BERG RIVER", "M. Ndlovu", 201150, 33.7, -33.250000, 19.050000);

INSERT INTO damm_levels (year, dam_name, assessment_officer, officer_reg, water_level, dam_latitude, dam_longitude) 
VALUES
(2016, 'WEMMERSHOEK', 'T. Daniels', 201450, 35.6, -33.910000, 19.036000),
(2017, 'WEMMERSHOEK', 'T. Daniels', 201450, 29.2, -33.910000, 19.036000),
(2018, 'WEMMERSHOEK', 'T. Daniels', 201450, 22.8, -33.910000, 19.036000),
(2019, 'WEMMERSHOEK', 'T. Daniels', 201450, 40.3, -33.910000, 19.036000),

(2014, 'VOELVLEI', 'M. Sello', 201322, 38.9, -33.388720, 19.099450),
(2015, 'VOELVLEI', 'M. Sello', 201322, 41.5, -33.388720, 19.099450),
(2016, 'VOELVLEI', 'M. Sello', 201322, 36.7, -33.388720, 19.099450),
(2017, 'VOELVLEI', 'M. Sello', 201322, 28.1, -33.388720, 19.099450),

(2016, 'THEEWATERSKLOOF', 'Z. Mahlangu', 201488, 47.2, -34.042000, 19.323000),
(2017, 'THEEWATERSKLOOF', 'Z. Mahlangu', 201488, 27.5, -34.042000, 19.323000),
(2018, 'THEEWATERSKLOOF', 'Z. Mahlangu', 201488, 18.9, -34.042000, 19.323000),
(2019, 'THEEWATERSKLOOF', 'Z. Mahlangu', 201488, 35.4, -34.042000, 19.323000);

INSERT INTO damm_levels (year, dam_name, assessment_officer, officer_reg, water_level, dam_latitude, dam_longitude) 
VALUES
(2012, 'WEMMERSHOEK', 'T. Daniels', 201450, 33.2, -33.910000, 19.036000),
(2013, 'WEMMERSHOEK', 'T. Daniels', 201450, 31.6, -33.910000, 19.036000),
(2014, 'VOELVLEI', 'M. Sello', 201322, 42.7, -33.388720, 19.099450),
(2015, 'VOELVLEI', 'M. Sello', 201322, 44.5, -33.388720, 19.099450),
(2016, 'STEENBRAS LOWER', 'V. Mokere', 201124, 25.9, -34.180527, 18.866688),
(2017, 'STEENBRAS UPPER', 'V. Mokere', 201124, 23.8, -34.166702, 18.909760),
(2018, 'THEEWATERSKLOOF', 'Z. Mahlangu', 201488, 18.4, -34.042000, 19.323000),
(2019, 'THEEWATERSKLOOF', 'Z. Mahlangu', 201488, 38.2, -34.042000, 19.323000),
(2020, 'STEENBRAS LOWER', 'V. Mokere', 201124, 27.1, -34.180527, 18.866688),
(2021, 'STEENBRAS UPPER', 'V. Mokere', 201124, 26.3, -34.166702, 18.909760);

CREATE TABLE dam_levels_1nf (
	AssessmentId INT PRIMARY KEY AUTO_INCREMENT , 
    year INT , 
    dam_name VARCHAR(100) , 
    assessment_officer VARCHAR(100) ,
    officer_reg INT , 
    water_level NUMERIC (10,1),
    dam_latitude DECIMAL(9,6),
    dam_longitude DECIMAL(9,6) 
);

-- CREATE 1NF 
INSERT INTO dam_levels_1nf ( year , dam_name , assessment_officer , officer_reg , water_level , dam_latitude , dam_longitude ) 
 SELECT 
	year ,
    dam_name , 
    assessment_officer , 
    officer_reg , 
    water_level , 
    dam_latitude , 
    dam_longitude 
FROM 
	damm_levels ;
 
 -- CREATE 2NF 
 DROP TABLE IF EXISTS assessments ;
CREATE TABLE assessments (
	AssessmentId int PRIMARY KEY AUTO_INCREMENT, 
    year int,
    assessment_officer varchar(100) , 
    officer_reg int, 
    water_level decimal(10,1) 
);  


INSERT INTO assessments ( year , assessment_officer , officer_reg , water_level ) 
SELECT DISTINCT  year , assessment_officer , officer_reg , water_level  
FROM dam_levels_1nf 
ORDER BY year ;

CREATE TABLE dams (
	 dam_name VARCHAR(100), 
    dam_latitude decimal(9,6) , 
    dam_longitude decimal(9,6) 
);

INSERT INTO dams ( dam_name , dam_latitude , dam_longitude ) 
SELECT DISTINCT dam_name , dam_latitude , dam_longitude  
FROM dam_levels_1nf ;

CREATE TABLE dam_assessments (
	AssessmentId int PRIMARY KEY AUTO_INCREMENT , 
    dam_name VARCHAR(100) 
);

INSERT INTO dam_assessments (AssessmentId, dam_name)
VALUES
(1, 'STEENBRAS LOWER'),
(2, 'STEENBRAS LOWER'),
(3, 'THEEWATERSKLOOF'),
(4, 'THEEWATERSKLOOF'),
(5, 'THEEWATERSKLOOF'),
(6, 'THEEWATERSKLOOF'),
(7, 'THEEWATERSKLOOF'),
(8, 'VOELVLEI'),
(9, 'VOELVLEI'),
(10, 'VOELVLEI'),
(11, 'BERG RIVER'),
(12, 'BERG RIVER'),
(13, 'WEMMERSHOEK'),
(14, 'WEMMERSHOEK'),
(15, 'WEMMERSHOEK'),
(16, 'WEMMERSHOEK'),
(17, 'VOELVLEI'),
(18, 'VOELVLEI'),
(19, 'VOELVLEI'),
(20, 'VOELVLEI'),
(21, 'THEEWATERSKLOOF'),
(22, 'THEEWATERSKLOOF'),
(23, 'THEEWATERSKLOOF'),
(24, 'THEEWATERSKLOOF'),
(25, 'WEMMERSHOEK'),
(26, 'WEMMERSHOEK'),
(27, 'VOELVLEI'),
(28, 'VOELVLEI'),
(29, 'STEENBRAS LOWER'),
(30, 'STEENBRAS UPPER'),
(31, 'THEEWATERSKLOOF'),
(32, 'THEEWATERSKLOOF'),
(33, 'STEENBRAS LOWER'),
(34, 'STEENBRAS UPPER');

DROP TABLE dam_levels_1nf ;

-- CREATE 3NF 
CREATE TABLE water_level_assessments (
	AssessmentId int PRIMARY KEY AUTO_INCREMENT, 
    year int,
    assessment_officer varchar(100) , 
    officer_reg int, 
    water_level decimal(10,1)  
); 

INSERT INTO water_level_assessments (  year , assessment_officer , officer_reg , water_level ) 
SELECT  year , assessment_officer , officer_reg , water_level 
FROM assessments  
ORDER BY year ;

CREATE TABLE officers ( 
	officer_name VARCHAR(100) ,
	officer_reg int 
);
 
INSERT INTO officers(officer_name , officer_reg ) 
SELECT assessment_officer , officer_reg 
FROM assessments ; 

DROP TABLE assessments ;