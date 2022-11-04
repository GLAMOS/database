

CREATE TABLE flow_velocity.flow_velocity_point (
    pk                                uuid          NOT NULL CONSTRAINT flow_velocity_point_pk PRIMARY KEY,
    fk_glacier                        uuid          NOT NULL REFERENCES base_data.glacier,
    name							  varchar(25)
	name_site						  varchar(25)
	date_from                         date          NOT NULL,
	time_from						time without timezone
	date_to							  date
	time_to							time without timezone
	latitude_from 					  deciumal(9,2) 		--[m – lv95]
	longitude_from 					  deciumal(9,2)		--[m – lv95]
	altitude_from 					  deciumal(6,2)      --[m – ln02]
	d_x 							  deciumal(5,2)	--[m]	
	d_y 							  deciumal(5,2)  --[m]
	d_z 							deciumal(5,2) --[m]
	d_xy 							deciumal(5,2) --[m]
	velocity_xy 					deciumal(5,2) --[m/a] 
	velocity_z 						deciumal(5,2) --[m/a]
	fk_measurement_type				smallint
	source							varchar(50)
	investigator					varchar(50)
	
	
	
	
	
    date_from_quality                 smallint      NOT NULL,
    date_to                           date          NOT NULL,
    date_to_quality                   smallint      NOT NULL,
    fk_measurement_type               varchar(1)    NOT NULL REFERENCES length_change.measurement_type,
    variation_quantitative            decimal(10,2) NOT NULL,
    variation_quantitative_accuracy   decimal(10,2),
    elevation_min                     decimal(10,2),
    observer                          varchar(50),
    remarks                           text
) TABLESPACE vector;



ALTER TABLE length_change.length_change_data ADD CONSTRAINT fk_length_change_date_from_quality
	FOREIGN KEY (date_from_quality) REFERENCES administration.date_quality_type (pk) ON DELETE No Action ON UPDATE No Action;
	
ALTER TABLE length_change.length_change_data ADD CONSTRAINT fk_length_change_date_to_quality
	FOREIGN KEY (date_to_quality) REFERENCES administration.date_quality_type (pk) ON DELETE No Action ON UPDATE No Action;