-- Split officer into its own table
CREATE TABLE officers (
    officer_name VARCHAR(100),
    officer_reg INT PRIMARY KEY
);

INSERT INTO officers (officer_name, officer_reg)
SELECT DISTINCT assessment_officer, officer_reg
FROM assessments;

-- Create new assessments table
CREATE TABLE water_level_assessments (
    AssessmentId INT PRIMARY KEY AUTO_INCREMENT,
    year INT,
    officer_reg INT,
    water_level DECIMAL(10,1)
);

INSERT INTO water_level_assessments (year, officer_reg, water_level)
SELECT year, officer_reg, water_level
FROM assessments;
