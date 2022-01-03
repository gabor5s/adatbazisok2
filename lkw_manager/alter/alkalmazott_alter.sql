ALTER TABLE alkalmazott
  ADD CONSTRAINT telep_id_fk FOREIGN KEY (telep_id) REFERENCES telep(id);
