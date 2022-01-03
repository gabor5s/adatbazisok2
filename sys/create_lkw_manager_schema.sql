PROMPT Creating user LKW_MANAGER...

----------------------------------
-- 1. Create user, add grants   --
----------------------------------
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM dba_users t WHERE t.username='LKW_MANAGER';
  IF v_count = 1 THEN 
    EXECUTE IMMEDIATE 'DROP USER lkw_manager CASCADE';
  END IF;
END;
/
CREATE USER lkw_manager 
  IDENTIFIED BY "12345678" 
  DEFAULT TABLESPACE users
  QUOTA UNLIMITED ON users
;

GRANT CREATE TRIGGER TO lkw_manager;
GRANT CREATE SESSION TO lkw_manager;
GRANT CREATE TABLE TO lkw_manager;
GRANT CREATE VIEW TO lkw_manager;
GRANT CREATE SEQUENCE TO lkw_manager;
GRANT CREATE PROCEDURE TO lkw_manager;
GRANT CREATE TYPE TO lkw_manager;

PROMPT Done.
