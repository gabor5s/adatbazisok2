create or replace type ty_telep_proc as object
(
       id number,
       jarmu_tipus varchar2(50),
       rendszam varchar2(6),
       futott_km number,
       teljesitmeny number,
       
       constructor function ty_telep_proc
       return self as result
)
/
create or replace type body ty_telep_proc is
  
  -- Member procedures and functions
  constructor function ty_telep_proc
  return self as result is
  
  begin
    return;
  end;
  
end;
/
