create or replace package pkg_exception is
       cargo_too_heavy_exception exception;
       gc_cargo_too_heavy_exc_code constant number := -20000;
       pragma exception_init(cargo_too_heavy_exception, -20000);
       
       no_data_found_exception exception;
       gc_no_data_found_exc_code constant number := -20100;
       pragma exception_init(no_data_found_exception, -20100);
       
       no_person_found_exception exception;
       gc_no_person_found_exc_code constant number := -20200;
       pragma exception_init(no_person_found_exception, -20200);
       
       no_telep_found_exception exception;
       gc_no_telep_found_exc_code constant number := -20300;
       pragma exception_init(no_telep_found_exception, -20300);
       
       mileage_not_valid_exception exception;
       gc_mileage_not_valid_exc_code constant number := -20400;
       pragma exception_init(mileage_not_valid_exception, -20400);
       
       no_capacity_exception exception;
       gc_no_capacity_exc_code constant number := -20500;
       pragma exception_init(no_capacity_exception, -20500);
       
       no_jarmu_found_exception exception;
       gc_no_jarmu_found_exc_code constant number := -20600;
       pragma exception_init(no_jarmu_found_exception, -20600);
       
       date_invalid_exception exception;
       gc_date_invalid_exc_code constant number := -20700;
       pragma exception_init(date_invalid_exception, -20700);
       
       no_munka_found_exception exception;
       gc_no_munka_found_exc_code constant number := -20800;
       pragma exception_init(no_munka_found_exception, -20800);
       
       no_szerelveny_found_exception exception;
       gc_no_szerelveny_exc_code constant number := -20900;
       pragma exception_init(no_szerelveny_found_exception, -20900);
end pkg_exception;
/
