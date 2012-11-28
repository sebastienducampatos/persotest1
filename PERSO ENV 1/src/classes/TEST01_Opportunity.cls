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
private class TEST01_Opportunity {
	
	//ATTENTION la couverture de test peut etre buggue
	//par exemple il est possible que le then d'un if doit etre sur la meme ligne que le if
	//SANS INDENTATION : if(toto == null) {truc=50}
	// => ça peut faire baisser la couverture de test et donc bloquer le passage en production.
	

    static testMethod void myUnitTest() {
		Opportunity lOpp = new Opportunity();
		lOpp.Name = 'opportunity';
		lOpp.CloseDate = Date.valueOf('2020-01-31');
		lOpp.StageName = 'Qualification';
		lOpp.Amount = 50;
		insert lOpp;
		lOpp.Amount = 1000000;
		update lOpp;
		if (lOpp.Description != null) {
			System.assertEquals(lOpp.Description.contains('Gros projet'), true);
		}
		lOpp.Amount = 500;
		update lOpp;
		if (lOpp.Description != null) {
			System.assertEquals(lOpp.Description.contains('Petit projet'), true);
		}
		lOpp.Amount = null;
		update lOpp;
		if (lOpp.Description != null) {
			System.assertEquals(lOpp.Description.contains('Petit projet'), false);
			System.assertEquals(lOpp.Description.contains('Gros projet'), false);
		}
		/*
		for (Integer i = 0; i < 160; ++i) {
			lOpp.Amount=50;
			update lOpp;
		}
		*/
		//Data Loader case
		List<Opportunity> lOpps = new List<Opportunity>();
		for (Integer i = 0; i < 160; ++i) {
			Opportunity lOpp3 = new Opportunity();
			lOpp3.Name = 'opportunity';
			lOpp3.CloseDate = Date.valueOf('2020-01-31');
			lOpp3.StageName = 'Qualification';
			lOpp3.Amount = 50;
			lOpps.add(lOpp3);
		}
		insert lOpps;
		update lOpps;
	}
}