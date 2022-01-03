CREATE OR REPLACE TRIGGER szerelveny_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON szerelveny
  FOR EACH ROW
DECLARE
  v_mod_user szerelveny_h.mod_user%TYPE;
  v_mod_time szerelveny_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO szerelveny_h(id,
                             szerelveny_tipus,
                             rendszam,
                             vasarlasi_datum,
                             forgalomba_helyezes,
                             evjarat,
                             futott_km,
                             teherbiras,
                             rakomany_tipus,
                             last_mod,
                             created,
                             mod_user,
                             dml_flag,
                             version)
                             values(:old.id,
                                    :old.szerelveny_tipus,
                                    :old.rendszam,
                                    :old.vasarlasi_datum,
                                    :old.forgalomba_helyezes,
                                    :old.evjarat,
                                    :old.futott_km,
                                    :old.teherbiras,
                                    :old.rakomany_tipus,
                                    v_mod_time,
                                    :old.created,
                                    v_mod_user,
                                    'D',
                                    :old.version + 1);
  ELSE
    INSERT INTO szerelveny_h(id,
                             szerelveny_tipus,
                             rendszam,
                             vasarlasi_datum,
                             forgalomba_helyezes,
                             evjarat,
                             futott_km,
                             teherbiras,
                             rakomany_tipus,
                             last_mod,
                             created,
                             mod_user,
                             dml_flag,
                             version)
                             values(:new.id,
                                    :new.szerelveny_tipus,
                                    :new.rendszam,
                                    :new.vasarlasi_datum,
                                    :new.forgalomba_helyezes,
                                    :new.evjarat,
                                    :new.futott_km,
                                    :new.teherbiras,
                                    :new.rakomany_tipus,
                                    :new.last_mod,
                                    :new.created,
                                    :new.mod_user,
                                    :new.dml_flag,
                                    :new.version);
  END IF;
END;
/
