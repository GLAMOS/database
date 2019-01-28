import psycopg2
from configparser import ConfigParser

CONNECTION_STRING_TEMPLATE = "host='{0}' dbname='{1}' user='{2}' password='{3}' connect_timeout={4}"

dataLineTemplate = "{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11}\n"

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
        the_file.write(dataLineTemplate.format("glacier name", "glacier id", "start date of observation", "quality of start date", "end date of observation", "quality of start date", "glacier area at start date", "glacier area at end date", "volume change", "mean thickness change", "annual geodetic mass balance", "observer"))
        the_file.write(dataLineTemplate.format("", "(according to Swiss Glacier Inventory)", "date_start", "x = date not exactly known", "date_end", "x = date not exactly known", "area_start", "area_end", "dV", "dh_mean", "Bgeod", ""))
        the_file.write(dataLineTemplate.format("", "", "yyyy-mm-dd (ISO 8601)", "", "yyyy-mm-dd (ISO 8601)", "", "km2", "km2", "km3", "m", "mm w.e. a-1", ""))

        # Write the individual measurements.
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
    title = parser.get('volumechange', 'title')
    citation = parser.get('volumechange', 'citation')

    filename = parser.get('volumechange', 'filename')
    statement = parser.get('volumechange', 'statement')

    write()
