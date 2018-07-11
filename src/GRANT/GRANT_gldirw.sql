GRANT USAGE ON SCHEMA base_data TO gldirw;

GRANT USAGE ON SCHEMA length_change TO gldirw;

GRANT USAGE ON SCHEMA mass_balance TO gldirw;

GRANT USAGE ON SCHEMA volume_change TO gldirw;
GRANT INSERT, SELECT, UPDATE, DELETE ON volume_change.volume_change TO gldirw;