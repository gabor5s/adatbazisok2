create or replace package pkg_exception is
       cargo_too_heavy_exception exception;
       gc_cargo_too_heavy_exc_code constant number := -20000;
       pragma exception_init(cargo_too_heavy_exception, -20000);
end pkg_exception;
/
