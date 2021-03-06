import psycopg2

CONNECTION_STRING_TEMPLATE = "host='{0}' dbname='{1}' user='{2}' password='{3}' connect_timeout={4}"

statement = "SELECT pk_glacier, json::text FROM base_data.web_glacier_picture_json;"

host = 'vawsrv01'
dbName = 'glamos'
dbUser = 'glporo'
dbPassword = 'RmyWGsMp'
timeout = 10

connectionString = CONNECTION_STRING_TEMPLATE.format(host, dbName, dbUser, dbPassword, timeout)

print(connectionString)

results = list()

connection = psycopg2.connect(connectionString)
cursor = connection.cursor()

cursor.execute(statement)

for recordReturned in cursor:
    filename = "./glacier_pictures/{0}.json".format(recordReturned[0])

    print(str(recordReturned[1]))

    with open(filename, 'w', encoding='utf-8') as the_file:
        the_file.write(str(recordReturned[1]))

    results.append(recordReturned)
