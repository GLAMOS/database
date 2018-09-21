DROP TABLE IF EXISTS test.reference CASCADE;
DROP TABLE IF EXISTS test.observation CASCADE;

CREATE TABLE test.reference
(
	pk int NOT NULL,
	geom geometry(POLYGON, 4326) NOT NULL
);
ALTER TABLE test.reference ADD CONSTRAINT "PK_reference" PRIMARY KEY (pk);
CREATE INDEX "IXFK_reference_pk" ON test.reference (pk ASC);

CREATE TABLE test.observation
(
	pk int NOT NULL,
	fk_reference int not null,
	value_observation real not null,
	value_year int not null
);
ALTER TABLE test.observation ADD CONSTRAINT "PK_observation" PRIMARY KEY (pk);
CREATE INDEX "IXFK_observation_pk" ON test.observation (pk ASC);
CREATE INDEX "IXFK_observation_fk_reference" ON test.observation (fk_reference ASC);
ALTER TABLE test.observation ADD CONSTRAINT "fk_reference"
	FOREIGN KEY (fk_reference) REFERENCES test.reference (pk) ON DELETE Cascade ON UPDATE Cascade;