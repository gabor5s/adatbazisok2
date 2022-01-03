create or replace function table_count(p_table_code number)
return number is

v_count number;
begin
  case p_table_code
  when 1 then
  select count(*) as darab into v_count from alkalmazott a;
  when 2 then
  select count(*) as darab into v_count from telep t;
  when 3 then
  select count(*) as darab into v_count from jarmu j;
  when 4 then
  select count(*) as darab into v_count from munka m;
  when 5 then
  select count(*) as darab into v_count from szerelveny sz;
  else
    v_count := -1;
    
  end case;
  
  return v_count;
end;
/
