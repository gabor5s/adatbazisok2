CREATE OR REPLACE TRIGGER munka_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON munka
  FOR EACH ROW
DECLARE
  v_mod_user munka_h.mod_user%TYPE;
  v_mod_time munka_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO munka_h(id,
                        rakomany,
                        indulasi_hely,
                        erkezesi_hely,
                        indulasi_datum,
                        erkezesi_datum,
                        rakomany_suly,
                        kamion_id,
                        szerelveny_id,
                        fuvarszervezo_id,
                        tavolsag,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:old.id,
                               :old.rakomany,
                               :old.indulasi_hely,
                               :old.erkezesi_hely,
                               :old.indulasi_datum,
                               :old.erkezesi_datum,
                               :old.rakomany_suly,
                               :old.kamion_id,
                               :old.szerelveny_id,
                               :old.fuvarszervezo_id,
                               :old.tavolsag,
                               v_mod_time,
                               :old.created,
                               v_mod_user,
                               'D',
                               :old.version + 1);
  ELSE
    INSERT INTO munka_h(id,
                        rakomany,
                        indulasi_hely,
                        erkezesi_hely,
                        indulasi_datum,
                        erkezesi_datum,
                        rakomany_suly,
                        kamion_id,
                        szerelveny_id,
                        fuvarszervezo_id,
                        tavolsag,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:new.id,
                               :new.rakomany,
                               :new.indulasi_hely,
                               :new.erkezesi_hely,
                               :new.indulasi_datum,
                               :new.erkezesi_datum,
                               :new.rakomany_suly,
                               :new.kamion_id,
                               :new.szerelveny_id,
                               :new.fuvarszervezo_id,
                               :new.tavolsag,
                               :new.last_mod,
                               :new.created,
                               :new.mod_user,
                               :new.dml_flag,
                               :new.version);
  END IF;
END;
/
