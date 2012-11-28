/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TEST02_Account {

    static testMethod void myUnitTest() {
        Account a = new Account();
        a.Name = 'test Account';
    	insert a;
    	Contact c1 = new Contact();
    	c1.LastName = 'test contact 1';
    	insert c1;
    	Contact c2 = new Contact();
    	c2.LastName = 'test contact 2';
    	insert c2;
    	a.Email_de_son_entreprise__c = 'test@renault.fr';
    	update a;
    	a.Email_de_son_entreprise__c = 'test@test.fr';
    	update a;
    }
}