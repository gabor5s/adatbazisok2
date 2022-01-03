CREATE OR REPLACE TRIGGER jarmu_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON jarmu
  FOR EACH ROW
DECLARE
  v_mod_user jarmu_h.mod_user%TYPE;
  v_mod_time jarmu_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO jarmu_h(id,
                        jarmu_tipus,
                        rendszam,
                        vasarlasi_datum,
                        forgalomba_helyezes,
                        evjarat,
                        futott_km,
                        teherbiras,
                        teljesitmeny,
                        sofor_id,
                        telep_id,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:old.id,
                               :old.jarmu_tipus,
                               :old.rendszam,
                               :old.vasarlasi_datum,
                               :old.forgalomba_helyezes,
                               :old.evjarat,
                               :old.futott_km,
                               :old.teherbiras,
                               :old.teljesitmeny,
                               :old.sofor_id,
                               :old.telep_id,
                               v_mod_time,
                               :old.created,
                               v_mod_user,
                               'D',
                               :old.version+1);
  ELSE
    INSERT INTO jarmu_h(id,
                        jarmu_tipus,
                        rendszam,
                        vasarlasi_datum,
                        forgalomba_helyezes,
                        evjarat,
                        futott_km,
                        teherbiras,
                        teljesitmeny,
                        sofor_id,
                        telep_id,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:new.id,
                               :new.jarmu_tipus,
                               :new.rendszam,
                               :new.vasarlasi_datum,
                               :new.forgalomba_helyezes,
                               :new.evjarat,
                               :new.futott_km,
                               :new.teherbiras,
                               :new.teljesitmeny,
                               :new.sofor_id,
                               :new.telep_id,
                               :new.last_mod,
                               :new.created,
                               :new.mod_user,
                               :new.dml_flag,
                               :new.version);
  END IF;
END;
/
