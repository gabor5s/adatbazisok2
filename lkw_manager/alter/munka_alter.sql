ALTER TABLE munka
  ADD CONSTRAINT kamion_id_fk FOREIGN KEY (kamion_id) REFERENCES jarmu(id);
  
ALTER TABLE munka
  ADD CONSTRAINT szerelveny_id_fk FOREIGN KEY (szerelveny_id) REFERENCES szerelveny(id);
  
ALTER TABLE munka
  ADD CONSTRAINT fuvarsz_id_fk FOREIGN KEY (fuvarszervezo_id) REFERENCES alkalmazott(id);
