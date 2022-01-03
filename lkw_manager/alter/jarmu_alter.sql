ALTER TABLE jarmu
  ADD CONSTRAINT sofor_id_fk FOREIGN KEY (sofor_id) REFERENCES alkalmazott(id);
  
ALTER TABLE jarmu
  ADD CONSTRAINT jarmu_telep_id_fk FOREIGN KEY (telep_id) REFERENCES telep(id);
