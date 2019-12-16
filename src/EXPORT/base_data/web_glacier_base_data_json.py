# Python 3.7

import psycopg2

CONNECTION_STRING_TEMPLATE = "host='{0}' dbname='{1}' user='{2}' password='{3}' connect_timeout={4}"

statement = "SELECT jsonb_build_object::text FROM base_data.web_glacier_base_data_json;"

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

#TODO: Getter a better way to check the amount of rows.
counter = 0
for recordReturned in cursor:
    counter += 1

if counter == 1:

    cursor.execute(statement)

    for recordReturned in cursor:

        filename = "./inventory/web_glacier_base_data.geojson"

        with open(filename, 'w', encoding='utf-8') as the_file:
            the_file.write(str(recordReturned[0]))

    print("The file web_glacier_base_data.geojson successfully written.")
    
else:

    print("Incorrect amount of rows. No file written. Check the view.")
