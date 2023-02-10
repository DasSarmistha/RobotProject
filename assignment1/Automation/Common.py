import csv
from robot.api.deco import keyword
from datetime import date
from robot.libraries.BuiltIn import BuiltIn

def test():
    return 222

def calculate_relief(salaryAmount, taxAmount, variableAmount, bonusAmount):
    tempRelief = (((salaryAmount-taxAmount)*variableAmount)+bonusAmount)

    taxRelief = round (tempRelief, 2)
    # print(taxRelief)

    if taxRelief < 50:
        taxRelief=50

    # print(taxRelief)
    return taxRelief

def calculate_age(birthdate):
    # print(birthdate)
    today = date.today()
    age = today.year - int(birthdate[4:8]) - ((today.month, today.day) < (int(birthdate[2:4]), int(birthdate[0:2])))
    # print(age)

    return age

def calculate_variable_weightage(age):
    if age >0 and age<18:
        return 1
    elif age >=18 and age<35:
        return 0.8
    elif age >=35 and age<50:
        return 0.5
    elif age >=50 and age<75:
        return 0.367
    elif age >=75:
        return 0.05

def calculate_gender_bonus(gender):
    if gender == 'F':
        return 500
    else:
        return 0

@keyword
def get_relief_details_from_csv(filePath):
    print('GetReliefDetailsFromCsv()')

    file = open(filePath, 'r')
    tempData = list(csv.DictReader(file, delimiter=","))
    file.close()

    recordList=[]

    for i in range (len(tempData)):
        #print(tempData[i])

        age = calculate_age(tempData[i]["birthday"])
        bonusAmount = calculate_gender_bonus(tempData[i]["gender"])
        variableWeightage = calculate_variable_weightage(age)
        reliefAmount = calculate_relief(int(tempData[i]["salary"]), int(tempData[i]["tax"]), variableWeightage, bonusAmount)

        recordDict= dict({'natid':tempData[i]["natid"], 'name':tempData[i]["name"], 'relief':reliefAmount})
        # print(recordDict)
        recordList.append(recordDict)

    # l1=
    # print(ListCompare(l1, l2))

    print(recordList)
    return recordList

def list_compare(encryptedList, normalList):
    BuiltIn().log_to_console("ListCompare=========> ")

    for i in range(len(normalList)):
        for j in range(len(encryptedList)):
            # print(encryptedList[i]["name"])
            # print(encryptedList[i]["natid"][0:4])
            if encryptedList[i]["name"] == normalList[j]["name"] and encryptedList[i]["natid"][0:4] == normalList[j]["natid"][0:4]:
                if encryptedList[i]["relief"] != normalList[j]["relief"]:
                    BuiltIn().log_to_console("======================")
                    BuiltIn().log_to_console(encryptedList[i]["name"])
                    BuiltIn().log_to_console(normalList[j]["name"])
                    BuiltIn().log_to_console(encryptedList[i]["natid"][0:4])
                    BuiltIn().log_to_console(normalList[i]["natid"][0:4])
                    BuiltIn().log_to_console(encryptedList[i]["relief"])
                    BuiltIn().log_to_console(normalList[i]["relief"])

                    return False

    return True

# get_relief_details_from_csv("C://mama//GovTech//oppenheimer-project-dev//Document.csv")
# calculate_relief(1000, 10, 0.7, 100)