CREATE TABLE flow_velocity.flow_velocity_point (
    pk                              uuid          NOT NULL CONSTRAINT flow_velocity_point_pk PRIMARY KEY,
    fk_glacier                      uuid          NOT NULL REFERENCES base_data.glacier,
    name							varchar(25),
	date_from                       date          NOT NULL,
	time_from						time without time zone,
	date_to							date,
	time_to							time without time zone,
	latitude_from 					decimal(9,2), --[m – lv03]
	longitude_from 					decimal(9,2),	--[m – lv03]
	altitude_from 					decimal(6,2), --[m – ln02]
	d_t								decimal(6,2),
	d_x 							decimal(5,2),	--[m]	
	d_y 							decimal(5,2), --[m]
	d_z 							decimal(5,2),  --[m]
	d_h 							decimal(5,2),  --[m]
	velocity_xy 					decimal(5,2),  --[m/a] 
	velocity_z 						decimal(5,2),  --[m/a]
	fk_marker_type					smallint,
	fk_position_method_type     	smallint,
	source							varchar(100),
	investigator					varchar(50),
    remarks                         text
) TABLESPACE vector;

ALTER TABLE flow_velocity.marker_type ADD CONSTRAINT fk_marker_type
	FOREIGN KEY (pk) REFERENCES flow_velocity.marker_type (pk) ON DELETE No Action ON UPDATE No Action;
	
ALTER TABLE flow_velocity.position_capture_method ADD CONSTRAINT fk_position_capture_method
	FOREIGN KEY (pk) REFERENCES flow_velocity.position_capture_method (pk) ON DELETE No Action ON UPDATE No Action;