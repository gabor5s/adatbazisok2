CREATE OR REPLACE TRIGGER telep_trg
  BEFORE INSERT OR UPDATE ON telep
  FOR EACH ROW

DECLARE
  v_kamion_darab NUMBER;

BEGIN
  IF inserting
  THEN
    IF :new.id IS NULL
    THEN
      :new.id := telep_seq.nextval;
    END IF;
  
    :new.created  := SYSDATE;
    :new.dml_flag := 'I';
    :new.version  := 1;
  ELSE
    SELECT COUNT(*)
      INTO v_kamion_darab
      FROM jarmu j
     WHERE j.telep_id = :new.id;
  
    IF :new.jarmu_kapacitas < v_kamion_darab
    THEN
      raise_application_error(pkg_exception.gc_no_capacity_exc_code,
                              'A kapacitas nem lehet kevesebb mint a jelenleg ott tartozkodo kamionok szama.');
    END IF;
  
    IF nvl(:new.dml_flag, 'U') <> 'D'
    THEN
      :new.dml_flag := 'U';
    END IF;
  
    :new.version := :old.version + 1;
  END IF;

  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');
END;
/
