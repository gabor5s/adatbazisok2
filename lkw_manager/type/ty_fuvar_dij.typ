create or replace type ty_fuvar_dij as object
(
       jarmu_tipus varchar2(50),
       rendszam    varchar2(6),
       indulasi_hely  varchar2(30),
       erkezesi_hely  varchar2(30),
       rakomany       varchar2(50),
       fuvar_dija     number,
       constructor function ty_fuvar_dij
       return self as result
)
/
create or replace type body ty_fuvar_dij is
  
  -- Member procedures and functions
  constructor function ty_fuvar_dij
  return self as result is
  
  begin
    return;
  end;
  
end;
/
