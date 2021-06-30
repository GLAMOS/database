INSERT INTO mass_balance.measurement_quality (pk, name, description) 
   VALUES (0, 'NotDefinedUnknown', '"Not defined or unknown: no information available to assess the quality of the measurement point');
INSERT INTO mass_balance.measurement_quality (pk, name, description) 
   VALUES (1, 'typical reading uncertainty', 'Typical reading uncertainty of mass balance at a stake in the case of good conditions, assumed as about \pm 5cm');
INSERT INTO mass_balance.measurement_quality (pk, name, description) 
   VALUES (2, 'high reading uncertainty', 'High reading uncertainty in case of difficult conditions (e.g. stake is bent or broken, melt-in of the stake is suspected, etc.), assumed as bigger than about \pm 15cm');
INSERT INTO mass_balance.measurement_quality (pk, name, description) 
   VALUES (3, 'reconstructed value (stake completely melted-out)', 'No actual measurement was possible as the stake completely melted out, value inferred from indirect evidence (minimal melt, nearby stakes, etc.)');
INSERT INTO mass_balance.measurement_quality (pk, name, description) 
   VALUES (4, 'reconstructed value (stake buried by snow)', 'No actual measurement was possible as the stake was buried by snow, value inferred from indirect evidence (maximal melt, minimal accumulation, nearby stakes, etc.)');
INSERT INTO mass_balance.measurement_quality (pk, name, description) 
   VALUES (5, 'reconstructed value (other reason)', 'No actual measurement was possible for alternative reasons, value inferred from indirect evidence ');
