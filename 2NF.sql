CREATE TABLE assessments (
    AssessmentId INT PRIMARY KEY AUTO_INCREMENT,
    year INT,
    assessment_officer VARCHAR(100),
    officer_reg INT,
    water_level DECIMAL(10,1)
);

INSERT INTO assessments (year, assessment_officer, officer_reg, water_level)
SELECT DISTINCT year, assessment_officer, officer_reg, water_level
FROM dam_levels_1nf
ORDER BY year;

-- Create dams table
CREATE TABLE dams (
    dam_name VARCHAR(100),
    dam_latitude DECIMAL(9,6),
    dam_longitude DECIMAL(9,6)
);

INSERT INTO dams (dam_name, dam_latitude, dam_longitude)
SELECT DISTINCT dam_name, dam_latitude, dam_longitude
FROM dam_levels_1nf;

-- Link table
CREATE TABLE dam_assessments (
    AssessmentId INT AUTO_INCREMENT PRIMARY KEY,
    dam_name VARCHAR(100)
);

-- Insert values manually or generate them based on sequence
-- Example:
INSERT INTO dam_assessments (AssessmentId, dam_name)
VALUES (1, 'STEENBRAS LOWER'), (2, 'STEENBRAS LOWER'),..... ;