DELIMITER $$

CREATE PROCEDURE UPDATE_LEADERS_SCORE(
    IN in_School_ID INT, 
    IN in_Leaders_Score INT
)
BEGIN
    -- Check if the input score is within the valid range
    IF in_Leaders_Score BETWEEN 0 AND 99 THEN
        -- Update the Leaders_Score
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leaders_Score
        WHERE School_ID = in_School_ID;

        -- Determine the Leaders_Icon based on the in_Leaders_Score value
        IF in_Leaders_Score BETWEEN 0 AND 19 THEN
            UPDATE chicago_public_schools
            SET Leaders_Icon = 'Very Weak'
            WHERE School_ID = in_School_ID;
        ELSEIF in_Leaders_Score BETWEEN 20 AND 39 THEN
            UPDATE chicago_public_schools
            SET Leaders_Icon = 'Weak'
            WHERE School_ID = in_School_ID;
        ELSEIF in_Leaders_Score BETWEEN 40 AND 59 THEN
            UPDATE chicago_public_schools
            SET Leaders_Icon = 'Average'
            WHERE School_ID = in_School_ID;
        ELSEIF in_Leaders_Score BETWEEN 60 AND 79 THEN
            UPDATE chicago_public_schools
            SET Leaders_Icon = 'Strong'
            WHERE School_ID = in_School_ID;
        ELSEIF in_Leaders_Score BETWEEN 80 AND 99 THEN
            UPDATE chicago_public_schools
            SET Leaders_Icon = 'Very Strong'
            WHERE School_ID = in_School_ID;
        END IF;
    ELSE
        -- Return an error message for invalid input
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Input parameter in_Leaders_Score is outside the accepted range (0-99)';
    END IF;
END$$

DELIMITER ;