-- Create normalized table with primary key
CREATE TABLE dam_levels_1nf (
    AssessmentId INT PRIMARY KEY AUTO_INCREMENT, 
    year INT, 
    dam_name VARCHAR(100), 
    assessment_officer VARCHAR(100),
    officer_reg INT, 
    water_level DECIMAL(10,1),
    dam_latitude DECIMAL(9,6),
    dam_longitude DECIMAL(9,6)
);

-- Insert data from flat table
INSERT INTO dam_levels_1nf (
    year, dam_name, assessment_officer, officer_reg, water_level, dam_latitude, dam_longitude
)
SELECT
    year, dam_name, assessment_officer, officer_reg, water_level, dam_latitude, dam_longitude
FROM
    damm_levels;