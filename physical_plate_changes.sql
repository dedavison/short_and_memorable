ALTER TABLE lims.physical_plate
ADD 
  (last_modified DATETIME NOT NULL,
	user_id VARCHAR(250) NOT NULL,
  lab_storage_location_id INT NOT NULL);
    
UPDATE 
  physical_plate pp,
  plate_storage_event pse
SET 
  pp.lab_storage_location_id = pse.lab_storage_location_id,
  pp.user_id = pse.user_id,
  pp.last_modified = pse.date_stored
WHERE 
  pp.physical_plate_id = pse.physical_plate_id
AND
  pse.is_latest=1;
    
    
ALTER TABLE lims.physical_plate
DROP plate_label;
