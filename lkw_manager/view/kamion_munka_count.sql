create or replace view kamion_munka_count as
       select j.jarmu_tipus,
              j.rendszam,
              (select count(*) from munka m where m.kamion_id = j.id
                                           and m.rakomany <> '-') as munkak_szama
              from jarmu j;
                               
                               select * from kamion_munka_count;
