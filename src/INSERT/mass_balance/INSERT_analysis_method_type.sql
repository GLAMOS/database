INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (0, 'NotDefinedUnknown', 'Not defined or unknown');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (1, 'SeasonalStakeObservations', 'Analysis of seasonal stake observations (b_w & b_a)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (2, 'AnnualStakeObservationsNotCloseEndPeriod', 'Analysis of annual stake observations but not close to the end of the period (b_w)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (3, 'AnnualStakeObservations', 'Analysis of annual stake observations (b_a)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (4, 'CombinedSeasonalStakeObservationsVolumeChange', 'Combined analysis of seasonal stake observations with volume change (b_w & b_a & dV)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (5, 'CombinedAnnualStakeObservationsVolumeChangeWithinPeriod', 'Combined analysis of annual stake observations within the period with volume change (b_w & dV)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (6, 'CombinedAnnualStakeObservationsVolumeChange', 'Combined analysis of annual stake observations with volume change (b_a & dV)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (7, 'ReconstructionVolumeChange', 'Reconstruction from volume change analysis (dV)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (8, 'ReconstructionVolumeChangeHelpStake', 'Reconstruction from volume change with help of stake data (dV & b_a/b_w)');
INSERT INTO mass_balance.analysis_method_type (pk, short_name, description) 
   VALUES (9, 'NoMeasurementOnlyModelResults', 'No measurement, only model results');