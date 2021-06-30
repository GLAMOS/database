UPDATE mass_balance.measurement_type SET description = 'Not defined or unknown' WHERE pk=0;
UPDATE mass_balance.measurement_type SET description = 'observation at a mass balance stake' WHERE pk=1;
UPDATE mass_balance.measurement_type SET description = 'observation based on snow probing, a snow pit or a snow core ' WHERE pk=2;
UPDATE mass_balance.measurement_type SET description = 'observation based on ground-penetrating radar' WHERE pk=3;
UPDATE mass_balance.measurement_type SET description = 'indirect mass balance observation based on the location of the snowline (b=0) ' WHERE pk=4;
UPDATE mass_balance.measurement_type SET description = 'other observation types' WHERE pk=9;
   