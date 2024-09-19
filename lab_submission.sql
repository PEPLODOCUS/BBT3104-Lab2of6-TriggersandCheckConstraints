-- CREATE TRG_AFTER_UPDATE_ON_customers

DELIMITER //

CREATE TRIGGER TRG_AFTER_UPDATE_ON_customers
AFTER UPDATE ON customers
FOR EACH ROW

    DELETE FROM customers_data_reminders
    WHERE customer_id = OLD.customer_id;

    IF NEW.some_field IS NULL THEN  
        INSERT INTO customers_data_reminders (customer_id, reminder_text)
        VALUES (NEW.customer_id, 'Please fill in the missing data for some_field.');
    END IF;

    IF NEW.another_field IS NULL THEN  
        INSERT INTO customers_data_reminders (customer_id, reminder_text)
        VALUES (NEW.customer_id, 'Please fill in the missing data for another_field.');
    END IF;


DELIMITER  ;


-- UPDATE part
