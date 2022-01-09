PROMPT Installing DB...

-- Esetleg instlall logolás

-- Install sequences
@./seq/alkalmazott_seq.sql
@./seq/telep_seq.sql
@./seq/jarmu_seq.sql
@./seq/munka_seq.sql
@./seq/szerelveny_seq.sql

-- Install tables
@./tables/alkalmazott.sql
@./tables/telep.sql
@./tables/jarmu.sql
@./tables/munka.sql
@./tables/szerelveny.sql

--history tables
@./tables/alkalmazott_h.sql
@./tables/telep_h.sql
@./tables/jarmu_h.sql
@./tables/munka_h.sql
@./tables/szerelveny_h.sql

-- Install types

-- Packes
@./package/pkg_exception.spc

-- Views
@./view/telep_jarmu1.sql
@./view/ures_fuvar.sql
@./view/forgalomban.sql
@./view/legkevesebb_suly.sql
@./view/legtobb_suly.sql
@./view/max_km.sql
@./view/szuletesnap.sql
@./view/ossztomeg_kamion.sql
@./view/kamion_munka_count.sql

-- Triggers
@./triggers/alkalmazott_trg.trg
@./triggers/telep_trg.trg
@./triggers/jarmu_trg.trg
@./triggers/munka_trg.trg
@./triggers/szerelveny_trg.trg

@./triggers/alkalmazott_h_trg.trg
@./triggers/telep_h_trg.trg
@./triggers/jarmu_h_trg.trg
@./triggers/munka_h_trg.trg
@./triggers/szerelveny_h_trg.trg

@./triggers/suly_valtoztatas.trg
-- Recompile schema
BEGIN
  dbms_utility.compile_schema(schema => 'LKW_MANAGER');
END;
/

-- FK
@./alter/alkalmazott_alter.sql
@./alter/jarmu_alter.sql
@./alter/munka_alter.sql
-- Tabla data
@./tables_data/telep_data.sql
@./tables_data/alkalmazott_data.sql
@./tables_data/jarmu_data.sql
@./tables_data/szerelveny_data.sql
@./tables_data/munka_data.sql

--function
@./function/table_count.fnc
@./function/sofor_kamion_tipus.fnc
--procedure
@./procedure/telep_proc.prc
@./procedure/fuvar_dij.prc

commit;

PROMPT Done.
