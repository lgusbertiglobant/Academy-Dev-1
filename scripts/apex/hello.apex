// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);


//Ejercicio academy
List<Account> accList = [SELECT Id, Name, Identification_type__c, Document_number__c FROM Account WHERE NumberOfEmployees >= 0 LIMIT 50];
for(Account acc : accList){
    acc.Identification_type__c = 'NIT';
    acc.Document_number__c = EncodingUtil.base64encode(Crypto.generateAesKey(192)).substring(0, 10);
}
update accList;


// System.debug(accList);