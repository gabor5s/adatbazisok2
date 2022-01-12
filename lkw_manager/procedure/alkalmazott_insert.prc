create or replace procedure alkalmazott_insert(p_id               number,
                                               p_vezeteknev       varchar2,
                                               p_keresztnev       varchar2,
                                               p_szuletesi_datum  date,
                                               p_lakhely          varchar2,
                                               p_beosztas         varchar2,
                                               p_telep_id         number) is

begin
  insert into alkalmazott(id,
                          vezeteknev,
                          keresztnev,
                          szuletesi_datum,
                          lakhely,
                          beosztas,
                          telep_id)
                          values(p_id, p_vezeteknev, p_keresztnev, p_szuletesi_datum, p_lakhely, p_beosztas, p_telep_id);
end;
/
