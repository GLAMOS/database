import psycopg2

CONNECTION_STRING_TEMPLATE = "host='{0}' dbname='{1}' user='{2}' password='{3}' connect_timeout={4}"

statement = "SELECT * FROM mass_balance.csv_mass_balance_observation_elevation_bins_data;"

dataLineTemplate = "{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11}\n"

host = 'vawsrv01'
dbName = 'glamos'
dbUser = 'glporo'
dbPassword = 'RmyWGsMp'
timeout = 10
        
connectionString = CONNECTION_STRING_TEMPLATE.format(host, dbName, dbUser, dbPassword, timeout)

print(connectionString)
            
connection = psycopg2.connect(connectionString)
cursor = connection.cursor()

cursor.execute(statement)

filename = "mass_balance_observation_elevation_bins.txt"

with open(filename, 'w', encoding='utf-8') as the_file:

    # Write the general header information.
    the_file.write("The data of the Swiss Glacier Monitoring Network (GLAMOS) are freely available and may be used with indication of the source for scientific and non-commercial use.\n")
    the_file.write("When using these data, please cite as:\n")
    the_file.write("Glaciological reports (1881 - 2017). \"The Swiss Glaciers\", Yearbooks of the Cryospheric Commission of the Swiss Academy of Sciences (SCNAT), published since 1964 by the Laboratory of Hydraulics, Hydrology and Glaciology (VAW) of ETH Zurich. No. 1–136, doi:10.18752/glrep_135-136, http://www.glamos.ch\n")
    the_file.write("\n")
    the_file.write("GLACIOLOGICAL MASS BALANCE, ELEVATION BINS (OBSERVATION PERIOD)\n")
    the_file.write("\n")

    # Write the column header information.
    the_file.write(dataLineTemplate.format("glacier name", "glacier id", "start date of observation", "end date of winter observation", "end date of observation", "winter mass balance", "summer mass balance", "annual mass balance", "area of elevation bin", "lower elevation of bin", "upper elevation of bin", "observer"))
    the_file.write(dataLineTemplate.format("", "(according to Swiss Glacier Inventory)", "date_start", "date_end_winter", "date_end", "Bw", "Bs", "Ba", "area", "h_min", "h_max", ""))
    the_file.write(dataLineTemplate.format("", "", "yyyy-mm-dd (ISO 8601)", "yyyy-mm-dd (ISO 8601)", "yyyy-mm-dd (ISO 8601)", "mm w.e.", "mm w.e.", "mm w.e.", "km2", "m asl.", "m asl.", ""))

    # Write the individual measurements of all elevation bins.
    for recordReturned in cursor:

        reference = recordReturned[11].replace(";", ",")

        lineToWrite = dataLineTemplate.format(
            recordReturned[0],
            recordReturned[1],
            recordReturned[2],
            recordReturned[3],
            recordReturned[4],
            recordReturned[5],
            recordReturned[6],
            recordReturned[7],
            recordReturned[8],
            recordReturned[9],
            recordReturned[10],
            reference)

        print(lineToWrite)

        the_file.write(lineToWrite)
 
