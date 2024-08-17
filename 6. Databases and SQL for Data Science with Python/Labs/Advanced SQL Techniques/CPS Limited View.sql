CREATE VIEW CPS_LIMITED (
						School_Name,
                        Safety_Rating,
                        Family_Rating,
                        Environment_Rating,
                        Instruction_Rating,
                        Leaders_Rating,
                        Teachers_Rating
                        ) AS
SELECT NAME_OF_SCHOOL,
	   Safety_Icon,
	   Family_Involvement_Icon,
	   Environment_Icon,
	   Instruction_Icon,
	   Leaders_Icon,
       Teachers_Icon
FROM chicago_public_schools;
