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
        the_file.write(dataLineTemplate.format("glacier name", "glacier id", "start date of observation",
                                               "end date of winter observation", "end date of observation",
                                               "winter mass balance", "summer mass balance", "annual mass balance",
                                               "area of elevation bin", "lower elevation of bin",
                                               "upper elevation of bin", "observer"))
        the_file.write(
            dataLineTemplate.format("", "(according to Swiss Glacier Inventory)", "date_start", "date_end_winter",
                                    "date_end", "Bw", "Bs", "Ba", "area", "h_min", "h_max", ""))
        the_file.write(
            dataLineTemplate.format("", "", "yyyy-mm-dd (ISO 8601)", "yyyy-mm-dd (ISO 8601)", "yyyy-mm-dd (ISO 8601)",
                                    "mm w.e.", "mm w.e.", "mm w.e.", "km2", "m asl.", "m asl.", ""))

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

        print(the_file)


if __name__ == "__main__":
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
    title = parser.get('massbalance_fixedate_elevationbins', 'title')
    citation = parser.get('massbalance_fixedate_elevationbins', 'citation')

    filename = parser.get('massbalance_fixedate_elevationbins', 'filename')
    statement = parser.get('massbalance_fixedate_elevationbins', 'statement')

    write()


