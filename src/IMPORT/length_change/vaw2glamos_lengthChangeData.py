import datetime
import uuid

def reformateDate(dateVaw):

    dateVawParts = dateVaw.split(".")

    day   = None
    month = None
    year  = None

    quality = None

    if dateVawParts[0] == "00" or dateVawParts[1] == "00":
        quality = 11
    else:
        quality = 1

    if dateVawParts[0] == "00":
        day = 1
    else:
        day = int(dateVawParts[0])
    if dateVawParts[1] == "00":
        month = 9
    else:
        month = int(dateVawParts[1])

    year = int(dateVawParts[2])

    return [datetime.date(year, month, day), quality]

def getMetadata(metadataLine):

    lineParts = metadataLine.split(";")

    pk_vaw = int(lineParts[2].strip())

    return lineParts[2]


def getData(dataLine):

    dateToReformated   = reformateDate(dataLine[:10])
    dateFromReformated = reformateDate(dataLine[16:26])
    dateTo             = dateToReformated[0]
    dateToQuality      = dateToReformated[1]
    dateFrom           = dateFromReformated[0]
    dateFromQuality    = dateFromReformated[1]

    measurementType = dataLine[12:13]

    variationQuantitative = float(dataLine[26:37].strip())

    elevationMin     = ""
    elevationMinTemp = dataLine[42:54].strip()
    if elevationMinTemp != "NaN":
        try:
            elevationMin = float(elevationMinTemp)
        except:
            elevationMin = ""

    observer = ""
    observerTemp = dataLine[54:].strip()
    if observerTemp != "-":
        observer = observerTemp

    return [dateFrom, dateFromQuality, dateTo, dateToQuality, measurementType, variationQuantitative, elevationMin, observer]

with open("dir.txt") as l, open("error.txt", "w") as errorFile:

    for lc in l:

        lc = lc.strip()
    
        with open(lc) as f:

            with open(lc + ".insert", "w") as t:

                lineCounter = 0

                pk_vaw = None

                headerLineToWrite = "pk;fk_glacier;date_from;date_from_quality;date_to;date_to_quality;fk_measurement_type;variation_quantitative;variation_quantitative_accuracy;elevation_min;observer;remarks"
                t.write(headerLineToWrite + "\n")
                print(headerLineToWrite)

                for line in f:

                    lineCounter += 1

                    try:
                        
                        if lineCounter == 1:
                            pk_vaw = getMetadata(line)

                        if lineCounter >= 4:
                            data = getData(line)

                            if data[4] == "m" or data[4] == "r" or data[4] == "o":

                                lineToWrite = "{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11}".format(
                                    uuid.uuid1(), str(pk_vaw).strip(),
                                    data[0], data[1],
                                    data[2], data[3],
                                    data[4], data[5], "",
                                    data[6], data[7],
                                    "")
                                t.write(lineToWrite + "\n")
                                print(lineToWrite)

                    except Exception as e:

                        errorMessage = "{0} @ {1}: {2}".format(lc, lineCounter, e)
                        print(errorMessage)
                        errorFile.write(errorMessage)
