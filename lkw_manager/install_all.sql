PROMPT Installing DB...

-- Esetleg instlall logolás

-- Install sequences
@./seq/alkalmazott_seq.sql
@./seq/telep_seq.sql
@./seq/jarmu_seq.sql
@./seq/munka_seq.sql
@./seq/szerelveny_seq.sql
@./seq/param_seq.sql

-- Install tables
@./tables/alkalmazott.sql
@./tables/telep.sql
@./tables/jarmu.sql
@./tables/munka.sql
@./tables/szerelveny.sql
@./tables/parameter_tabla.sql

--history tables
@./tables/alkalmazott_h.sql
@./tables/telep_h.sql
@./tables/jarmu_h.sql
@./tables/munka_h.sql
@./tables/szerelveny_h.sql
@./tables/parameter_tabla_h.sql

-- Install types
@./type/ty_fuvar_dij.typ
@./type/ty_telep_proc.typ
@./type/ty_telep_proc_list.tps

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
@./triggers/parameter_trg.trg

@./triggers/alkalmazott_h_trg.trg
@./triggers/telep_h_trg.trg
@./triggers/jarmu_h_trg.trg
@./triggers/munka_h_trg.trg
@./triggers/szerelveny_h_trg.trg
@./triggers/parameter_h_trg.trg

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
@./tables_data/parameter_tabla_data.sql

--function
@./function/table_count.fnc
@./function/sofor_kamion_tipus.fnc
@./function/fuvar_dij1.fnc
@./function/telep_proc1.fnc

--procedure

   --alkalmazott
@./procedure/alkalmazott_insert.prc
@./procedure/alkalmazott_delete.prc
@./procedure/alkalmazott_update.prc

   --telep
@./procedure/telep_insert.prc
@./procedure/telep_delete.prc
@./procedure/telep_update.prc

   --jarmu
@./procedure/jarmu_telep_change.prc
@./procedure/jarmu_insert.prc
@./procedure/jarmu_delete.prc
@./procedure/jarmu_update.prc

   --munka
@./procedure/munka_insert.prc
@./procedure/munka_delete.prc
@./procedure/munka_update.prc

   --szerelveny
@./procedure/szerelveny_insert.prc
@./procedure/szerelveny_delete.prc
@./procedure/szerelveny_update.prc

commit;

PROMPT Done.
