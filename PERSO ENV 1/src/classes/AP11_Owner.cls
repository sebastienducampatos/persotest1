public with sharing class AP11_Owner {

	public static void updateOwner(List<Owner__c> iNewOwn, List<Owner__c> iOldOwn) {
		Set<Owner__c> lOwnersSet = new Set<Owner__c>();
		for (Integer i = 0; i < iNewOwn.size(); ++i) {
			if (iNewOwn[i].OwnerStatus__c != null && iNewOwn[i].OwnerStatus__c != iOldOwn[i].OwnerStatus__c) {
				//le statut a change => on doit changer la remise !
				lOwnersSet.add(iNewOwn[i]);
			}
		}
		List<Vehicle__c> lVehicles = [SELECT 
										Id, Price_HT__c, Owner__c, Discount_Pct__c,
										Discount_Amount__c, Price_TTC__c
									 FROM Vehicle__c WHERE Owner__c IN: lOwnersSet];
		AP10_Vehicle.computePrices(lVehicles);
		update lVehicles;
	}
}