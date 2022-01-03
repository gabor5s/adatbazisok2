create or replace view forgalomban as
       SELECT j.jarmu_tipus
             ,j.rendszam
             ,(trunc(SYSDATE) - j.forgalomba_helyezes) AS forgalomba_helyezes_nap
             ,(extract(YEAR FROM SYSDATE) -
              extract(YEAR FROM j.forgalomba_helyezes)) AS forgalomba_helyezes_ev
         FROM jarmu j;
