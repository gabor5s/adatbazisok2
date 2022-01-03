create or replace view szuletesnap as
       select (EXTRACT(year from sysdate)-EXTRACT(year from a.szuletesi_datum))  as hany_eves_lesz
       from alkalmazott a;
