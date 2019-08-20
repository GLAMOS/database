UPDATE mass_balance.observation_type SET description = 'Not defined or unknown' WHERE pk=0;
UPDATE mass_balance.observation_type SET description = 'seasonal mass balance observations at mass balance stakes (late winter and fall survey)' WHERE pk=1;
UPDATE mass_balance.observation_type SET description = 'intermediate readings at mass balance stakes over arbitrary time periods in between the principal two surveys' WHERE pk=2;
UPDATE mass_balance.observation_type SET description = 'complete sample of winter snow accumulation measurements, both at mass balance stakes and elsewhere' WHERE pk=3;
   