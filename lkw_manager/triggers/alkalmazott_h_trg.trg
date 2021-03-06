CREATE OR REPLACE TRIGGER alkalmazott_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON alkalmazott
  FOR EACH ROW
DECLARE
  v_mod_user alkalmazott_h.mod_user%TYPE;
  v_mod_time alkalmazott_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO alkalmazott_h(id,
                            vezeteknev,
                            keresztnev,
                            szuletesi_datum,
                            lakhely,
                            beosztas,
                            telep_id,
                            last_mod,
                            created,
                            mod_user,
                            dml_flag,
                            version)
                            values(:old.id,
                                   :old.vezeteknev,
                                   :old.keresztnev,
                                   :old.szuletesi_datum,
                                   :old.lakhely,
                                   :old.beosztas,
                                   :old.telep_id,
                                   v_mod_time,
                                   :old.created,
                                   v_mod_user,
                                   'D',
                                   :old.version+1);
  ELSE
    INSERT INTO alkalmazott_h(id,
                              vezeteknev,
                              keresztnev,
                              szuletesi_datum,
                              lakhely,
                              beosztas,
                              telep_id,
                              last_mod,
                              created,
                              mod_user,
                              dml_flag,
                              version)
                              values(:new.id,
                                     :new.vezeteknev,
                                     :new.keresztnev,
                                     :new.szuletesi_datum,
                                     :new.lakhely,
                                     :new.beosztas,
                                     :new.telep_id,
                                     :new.last_mod,
                                     :new.created,
                                     :new.mod_user,
                                     :new.dml_flag,
                                     :new.version);
  END IF;
END;
/
