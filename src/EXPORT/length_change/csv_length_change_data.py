import psycopg2

CONNECTION_STRING_TEMPLATE = "host='{0}' dbname='{1}' user='{2}' password='{3}' connect_timeout={4}"

statement = "SELECT * FROM length_change.csv_length_change_data;"

dataLineTemplate = "{0};{1};{2};{3};{4};{5};{6};{7};{8}\n"

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

filename = "length_change.csv"

with open(filename, 'w', encoding='utf-8') as the_file:

    # Write the general header information.
    the_file.write("The data of the Swiss Glacier Monitoring Network (GLAMOS) are freely available and may be used with indication of the source for scientific and non-commercial use.\n")
    the_file.write("When using these data, please cite as:\n")
    the_file.write("Glaciological reports (1881 - 2017). \"The Swiss Glaciers\", Yearbooks of the Cryospheric Commission of the Swiss Academy of Sciences (SCNAT), published since 1964 by the Laboratory of Hydraulics, Hydrology and Glaciology (VAW) of ETH Zurich. No. 1–136, doi:10.18752/glrep_135-136, http://www.glamos.ch\n")
    the_file.write("\n")
    the_file.write("LENGTH CHANGE\n")
    the_file.write("\n")

    # Write the column header information.
                   
    the_file.write(dataLineTemplate.format("glacier name", "glacier id", "start date of observation", "quality of start date", "end date of observation", "quality of end date", "length change", "elevation of glacier tongue", "observer"))
    the_file.write(dataLineTemplate.format("", "(according to Swiss Glacier Inventory)", "date_start", "x = date not exactly known", "date_end", "x = date not exactly known", "dL", "h_min", ""))
    the_file.write(dataLineTemplate.format("", "", "yyyy-mm-dd (ISO 8601)", "", "yyyy-mm-dd (ISO 8601)", "", "m", "m asl.", ""))

    # Write the individual measurements.
    for recordReturned in cursor:

        lineToWrite = dataLineTemplate.format(
            recordReturned[0],
            recordReturned[1],
            recordReturned[2],
            recordReturned[3],
            recordReturned[4],
            recordReturned[5],
            recordReturned[6],
            recordReturned[7],
            recordReturned[8])

        print(lineToWrite)

        the_file.write(lineToWrite)
 
