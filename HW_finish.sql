-- Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов.

DROP PROCEDURE IF EXISTS SecondTransfer;

DELIMITER $$

CREATE PROCEDURE SecondTransfer(seconds int) 

BEGIN
	DECLARE result varchar(250);
	DECLARE days_n INT DEFAULT 0;
	DECLARE hours_n INT DEFAULT 0;
	DECLARE minutes_n INT DEFAULT 0;
	DECLARE seconds_n INT DEFAULT 0;

	SET days_n = seconds div 86400;
    SET hours_n = ((seconds - days_n*86400) div 3600);
	SET minutes_n = ((seconds - days_n*86400 - hours_n*3600) div 60);
    SET seconds_n = (seconds - days_n*86400 - hours_n*3600 - minutes_n*60);
    
    SET result = CONCAT(
                    CAST(days_n AS CHAR), ' days ',
                    CAST(hours_n AS CHAR), ' hours ',
                    CAST(minutes_n AS CHAR), ' minutes ',
                    CAST(seconds_n AS CHAR), ' seconds '
                    );
    SELECT result AS Response;
    
END$$

DELIMITER ;

CALL SecondTransfer(10000);



-- Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10
DROP FUNCTION IF EXISTS nod_f;

DELIMITER //
CREATE FUNCTION nod_f()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE num1 INT DEFAULT 1;
    DECLARE num2 INT DEFAULT 10;
    DECLARE result VARCHAR(50) DEFAULT 0;
   
  WHILE (num2-num1)>=0 DO
		IF num1 % 2 = 0 THEN
			SET result = CONCAT(result, " ", num1);
            SET num1 = num1+1;
        ELSE    
			SET num1 = num1+1;
		END IF;
END WHILE;
  
RETURN result;

END //
DELIMITER ;
    
SELECT nod_f();