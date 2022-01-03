create or replace view legtobb_suly as
SELECT j.jarmu_tipus
       ,j.rendszam
       ,a.vezeteknev || ' ' || a.keresztnev AS nev
       ,ossztomeg
   FROM (SELECT m.kamion_id
               ,SUM(m.rakomany_suly) AS ossztomeg
           FROM munka m
          INNER JOIN jarmu j
             ON m.kamion_id = j.id
          GROUP BY m.kamion_id) s
  INNER JOIN jarmu j
     ON s.kamion_id = j.id
  INNER JOIN alkalmazott a
     ON j.sofor_id = a.id
 
  WHERE ossztomeg = (SELECT MAX(SUM(m.rakomany_suly)) AS ossztomeg
                       FROM munka m
                      GROUP BY m.kamion_id);
