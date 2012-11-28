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
private class TEST10_Vehicle {

    static testMethod void myUnitTest() {
        // => should exist in production
        Discount__c lDisc = new Discount__c();
        lDisc.Name = 'Discount Name';
        lDisc.DiscountType__c = 'Mandataire';
        lDisc.Discount_Pct__c = 28;
        insert lDisc;
        
        Owner__c o = new Owner__c();
        o.Name = 'toto';
        insert o;
        
        Vehicle__c v = new Vehicle__c();
        v.Name = 'vehicule de toto';
        v.Immatriculation__c = 'IMMAT';
        v.VIN__c = 'VIN';
        v.Owner__c = o.Id;
        v.First_Registration_Date__c = Date.today();
        v.Price_HT__c = 2000;
        insert v;
        
        v.Price_HT__c = 1000;
        update v;
        o.OwnerStatus__c = 'Mandataire';
        update o;
        v.Status__c = 'Panne';
        update v;
        v.Immatriculation__c = 'IMMAT_NEW';
        update v;
        
        //changement de owner;
        Owner__c o2 = new Owner__c();
        o2.Name = 'toto 2';
        insert o2;
        v.Owner__c = o2.Id;
        update v;
    }
}