CREATE OR REPLACE TRIGGER telep_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON telep
  FOR EACH ROW
DECLARE
  v_mod_user telep_h.mod_user%TYPE;
  v_mod_time telep_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO telep_h(id,
                        jarmu_kapacitas,
                        szerelveny_kapacitas,
                        telepules,
                        utca,
                        hazszam,
                        iranyitoszam,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:old.id,
                               :old.jarmu_kapacitas,
                               :old.szerelveny_kapacitas,
                               :old.telepules,
                               :old.utca,
                               :old.hazszam,
                               :old.iranyitoszam,
                               v_mod_time,
                               :old.created,
                               v_mod_user,
                               'D',
                               :old.version +1);
  ELSE
    INSERT INTO telep_h(id,
                        jarmu_kapacitas,
                        szerelveny_kapacitas,
                        telepules,
                        utca,
                        hazszam,
                        iranyitoszam,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:new.id,
                               :new.jarmu_kapacitas,
                               :new.szerelveny_kapacitas,
                               :new.telepules,
                               :new.utca,
                               :new.hazszam,
                               :new.iranyitoszam,
                               :new.last_mod,
                               :new.created,
                               :new.mod_user,
                               :new.dml_flag,
                               :new.version);
  END IF;
END;
/
