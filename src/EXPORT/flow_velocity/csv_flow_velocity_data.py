import psycopg2
from configparser import ConfigParser

CONNECTION_STRING_TEMPLATE = "host='{0}' dbname='{1}' user='{2}' password='{3}' connect_timeout={4}"

dataLineTemplate = "{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11};{12};{13};{14};{15};{16};{17};{18};{19};{20};{21}\n"

# DB connection and statement
host = None
dbName = None
dbUser = None
dbPassword = None
timeout = None

statement = None
connectionString = None

# Header text
introduction_data = None
introduction_citation = None
citation = None
title = None

# File
filename = None

def write():
    connection = psycopg2.connect(connectionString)
    cursor = connection.cursor()

    cursor.execute(statement)

    with open(filename, 'w', encoding='utf-8') as the_file:

        # Write the general header information.
        the_file.write(introduction_data)
        the_file.write("\n")
        the_file.write(introduction_citation)
        the_file.write("\n")

        the_file.write(citation)
        the_file.write("\n")
        
        the_file.write("\n")
        the_file.write(title)
        the_file.write("\n")
        the_file.write("\n")

        # Write the column header information.
        the_file.write(dataLineTemplate.format("stake name", "glacier_name","SGI-ID","WGMS-ID","date_from","time_from","date_to","time_to","latitude_from","longitude_from","altitude_from","d_t","d_x","d_y","d_z","velocity_xy","velocity_z","marker_type","position_method_type","source","investigator","remarks"))
        the_file.write(dataLineTemplate.format("","","","","date","time","date","time","EPSG:21781","EPSG:21781","LN02", "decimal days", "m","m","m","m","m/a","m/a","","","","",""))

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
                recordReturned[8],
                recordReturned[9],
                recordReturned[10],
                recordReturned[11],
                recordReturned[12],
                recordReturned[13],
                recordReturned[14],
                recordReturned[15],
                recordReturned[16],
                recordReturned[17],
                recordReturned[18],
                recordReturned[19],
                recordReturned[20],
                recordReturned[21],
                recordReturned[22])

            print(lineToWrite)

            the_file.write(lineToWrite)


if  __name__ == "__main__":
    parser = ConfigParser()
    parser.read('../glamos_export.config')

    parserPrivate = ConfigParser()
    parserPrivate.read('../glamos_export.private.config')

    host = parserPrivate.get('db_access', 'host')
    dbName = parserPrivate.get('db_access', 'dbName')
    dbUser = parserPrivate.get('db_access', 'dbUser')
    dbPassword = parserPrivate.get('db_access', 'dbPassword')
    timeout = parserPrivate.get('db_access', 'timeout')

    connectionString = CONNECTION_STRING_TEMPLATE.format(host, dbName, dbUser, dbPassword, timeout)

    introduction_data = parser.get('general', 'introduction_data')
    introduction_citation = parser.get('general', 'introduction_citation')
    title = parser.get('flowvelocity', 'title')
    citation = parser.get('flowvelocity', 'citation')

    filename = parser.get('flowvelocity', 'filename')
    statement = parser.get('flowvelocity', 'statement')

    write()
