CREATE OR REPLACE FUNCTION telep_proc1(p_telep_id NUMBER)
  RETURN ty_telep_proc_list IS
  res ty_telep_proc_list;

BEGIN
  res := ty_telep_proc_list();
  FOR i IN (SELECT t.id,
                   j.jarmu_tipus,
                   j.rendszam,
                   j.futott_km,
                   j.teljesitmeny
              FROM telep t
             INNER JOIN jarmu j
                ON t.id = j.telep_id
             WHERE t.id = p_telep_id)
  LOOP
    res.extend(1);
    res(res.count) := ty_telep_proc(id           => i.id,
                                    jarmu_tipus  => i.jarmu_tipus,
                                    rendszam     => i.rendszam,
                                    futott_km    => i.futott_km,
                                    teljesitmeny => i.teljesitmeny);
  END LOOP;
  RETURN res;
END;
/
