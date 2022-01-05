create or replace view ossztomeg_kamion as
SELECT j.jarmu_tipus
                     ,j.rendszam
                     ,a.vezeteknev || ' ' || a.keresztnev AS nev
                     ,s.ossztomeg
                 FROM jarmu j
                INNER JOIN alkalmazott a
                   ON j.sofor_id = a.id
                INNER JOIN (SELECT m.kamion_id
                                 ,SUM(m.rakomany_suly) AS ossztomeg
                             FROM munka m
                            INNER JOIN jarmu j
                               ON m.kamion_id = j.id
                            GROUP BY m.kamion_id) s
                   ON j.id = s.kamion_id
                   order by s.ossztomeg;
