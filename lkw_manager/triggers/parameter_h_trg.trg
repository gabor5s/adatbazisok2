CREATE OR REPLACE TRIGGER parameter_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON parameter_tabla
  FOR EACH ROW
DECLARE
  v_mod_user parameter_tabla_h.mod_user%TYPE;
  v_mod_time parameter_tabla_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO parameter_tabla_h(id,
                                  nev,
                                  ertek,
                                  last_mod,
                                  created,
                                  mod_user,
                                  dml_flag,
                                  version)
                        values(:old.id,
                               :old.nev,
                               :old.ertek,
                               v_mod_time,
                               :old.created,
                               v_mod_user,
                               'D',
                               :old.version +1);
  ELSE
    INSERT INTO parameter_tabla_h(id,
                                  nev,
                                  ertek,
                                  last_mod,
                                  created,
                                  mod_user,
                                  dml_flag,
                                  version)
                                  values(:new.id,
                                         :new.nev,
                                         :new.ertek,
                                         :new.last_mod,
                                         :new.created,
                                         :new.mod_user,
                                         :new.dml_flag,
                                         :new.version);
  END IF;
END;
/
