CREATE OR REPLACE TRIGGER jarmu_trg
  BEFORE INSERT OR UPDATE ON jarmu
  FOR EACH ROW

BEGIN
  IF inserting
  THEN
    IF :new.id IS NULL
    THEN
      :new.id := jarmu_seq.nextval;
    END IF;
  
    IF :new.futott_km < 0
    THEN
      raise_application_error(pkg_exception.gc_mileage_not_valid_exc_code,
                              'A kilotemerora allasa nem lehet kisebb mint 0.');
    END IF;
  
    :new.created  := SYSDATE;
    :new.dml_flag := 'I';
    :new.version  := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D'
    THEN
      :new.dml_flag := 'U';
    END IF;
  
    IF :old.futott_km > :new.futott_km
    THEN
      raise_application_error(pkg_exception.gc_mileage_not_valid_exc_code,
                              'Az uj kilometerora allas nem lehet kisebb mint a mostani.');
    END IF;
  
    :new.version := :old.version + 1;
  END IF;

  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');
END;
/
