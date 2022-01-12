CREATE OR REPLACE TRIGGER munka_trg
  BEFORE INSERT OR UPDATE ON munka
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.id IS NULL
    THEN
      :new.id := munka_seq.nextval;
    END IF;
  
    :new.created    := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D'
    THEN
      :new.dml_flag := 'U';
    END IF;
  
    :new.version := :old.version + 1;
  END IF;
  
  if :new.erkezesi_datum < :new.indulasi_datum
    then
      raise_application_error(pkg_exception.gc_date_invalid_exc_code, 'Hibas datum: erkezesi datum nem lehet kisebb az indulasinal.');
      end if;

  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');
END;
/
