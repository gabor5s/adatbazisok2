create or replace procedure alkalmazott_delete(p_alkalmazott_id number) is

begin
  delete from alkalmazott a where a.id = p_alkalmazott_id;
end;
/
