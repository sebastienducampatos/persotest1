public with sharing class AP10_Vehicle {
	
	//create computed information for a vehicle
	public static void createVehicleInformation (List<Vehicle__c> iVeh) {
		createMaintenanceDate(iVeh);
	}
	
	//compute the first maintenance date
	private static void createMaintenanceDate (List<Vehicle__c> iVeh) {
		for (Integer i = 0; i < iVeh.size(); ++i) {
			if (iVeh[i].First_Registration_Date__c != null) {
				//First_Maintenance_Date__c += 6 mois
				Date lDate = iVeh[i].First_Registration_Date__c;
				iVeh[i].First_Maintenance_Date__c = lDate.addMonths(6);
			}
		}
	}
	
	/**** USELESS CODE 
	//Le prix HT a été modifié => on modifie le prix
	public static void updatePrices(List<Vehicle__c> iNewVeh, List<Vehicle__c> iOldVeh) {
		List<Vehicle__c> lUpVehicles = new List<Vehicle__c>();
		for (Integer i = 0; i < iNewVeh.size(); ++i) {
			if (iNewVeh[i].Price_HT__c != null && iNewVeh[i].Price_HT__c != iOldVeh[i].Price_HT__c) {
				lUpVehicles.add(iNewVeh[i]);
			}
		}
		computePrices(lUpVehicles);
		update lUpVehicles;
	}
	*/
	
	//compute the prices
	public static void computePrices(List<Vehicle__c> iNewVeh) {
		Map<Id, Integer> lMap = new Map<Id, Integer>();
		for (Integer i = 0; i < iNewVeh.size(); ++i) {
			if (iNewVeh[i].Price_HT__c != null) {
				//on ajout l'Id de l'owner et l'indice du vehicule dans la liste
				lMap.put(iNewVeh[i].Owner__c, i);
			}
		}
		//recuperation des remises
		//TODO : on peut avoir un Singleton 	=> http://www.tgerm.com/2010/03/apex-implementing-singleton-design.html!!!
		//TODO : si beaucoup de remises : peut poser problèmes. Pour le moment 3 prévu seulement
		//       inutile de chercher une complexite superieure avec une jointure
		List<Discount__c> lDiscounts = [SELECT Id, Discount_Pct__c, DiscountType__c FROM Discount__c];
		//Nota : Percent is a Double
		Map<String, Double> lDiscountsMap = new Map<String, Double>();
		for (Integer i = 0; i < lDiscounts.size(); ++i) {
			if (lDiscounts[i].DiscountType__c != null && lDiscounts[i].Discount_Pct__c != null) {
				lDiscountsMap.put(lDiscounts[i].DiscountType__c, lDiscounts[i].Discount_Pct__c);
			}
		}
		
		//recuperation du type de Owner
		List<Owner__c> lOwners = [SELECT Id, OwnerStatus__c FROM Owner__c WHERE Id IN :lMap.keySet()];
		for (Integer i = 0; i < lOwners.size(); ++i) {
			if (lMap.containsKey(lOwners[i].Id)) {
				if (lDiscountsMap.containsKey(lOwners[i].OwnerStatus__c)) {
					Integer lIdxVeh = lMap.get(lOwners[i].Id);
					//calcul de la remise
					Double lDisc = lDiscountsMap.get(lOwners[i].OwnerStatus__c);
					iNewVeh[lIdxVeh].Discount_Pct__c = lDisc;
					iNewVeh[lIdxVeh].Discount_Amount__c = iNewVeh[lIdxVeh].Price_HT__c * lDisc / 100; 					
					//calcul du prix TTC
					iNewVeh[lIdxVeh].Price_TTC__c = (iNewVeh[lIdxVeh].Price_HT__c - iNewVeh[lIdxVeh].Discount_Amount__c) * 1.196;
				}
			}
		}
	}
	
	//sauvegarde de la plaque d'immatriculation
	public static void updateHistory(List<Vehicle__c> iNewVeh, List<Vehicle__c> iOldVeh) {
		List<Integer> lModifiedLicence = new List<Integer>();
		List<Integer> lModifiedOwner = new List<Integer>();
		List<Integer> lModifiedStatus = new List<Integer>();
		for (Integer i = 0; i < iNewVeh.size(); ++i) {
			if (iNewVeh[i].Immatriculation__c != iOldVeh[i].Immatriculation__c) {
				lModifiedLicence.add(i);
			}
			if (iNewVeh[i].Owner__c != iOldVeh[i].Owner__c) {
				lModifiedOwner.add(i);
			}
			if(iNEwVeh[i].Status__c != iOldVeh[i].Status__c) {
				lModifiedStatus.add(i);
			}
		}
		historyLicencePlate(iNewVeh, iOldVeh, lModifiedLicence);
		historyOwners(iNewVeh, iOldVeh, lModifiedOwner);
		historyStatus(iNewVeh, iOldVeh, lModifiedStatus);
	}
	
	//historisation du changement de plaque
	private static void historyLicencePlate(List<Vehicle__c> iNewVeh, List<Vehicle__c> iOldVeh, List<Integer> iIdx) {
		List<HistoryVehicle__c> lHistList = new List<HistoryVehicle__c>();
		for (Integer i = 0; i < iIdx.size(); ++i) {
			HistoryVehicle__c lObj = new HistoryVehicle__c();
			lObj.Vehicle__c = iNewVeh[iIdx[i]].Id;
			lObj.OldLicencePlate__c = iOldVeh[iIdx[i]].Immatriculation__c;
			lObj.NewLicencePlate__c = iNewVeh[iIdx[i]].Immatriculation__c;
			lObj.ModificationDate__c = Date.today();
			lHistList.add(lObj);
		}
		insert lHistList;
	}
	
	//historisation du changement de propriétaire
	private static void historyOwners(List<Vehicle__c> iNewVeh, List<Vehicle__c> iOldVeh, List<Integer> iIdx) {
		List<HistoryVehicle__c> lHistList = new List<HistoryVehicle__c>();
		for (Integer i = 0; i < iIdx.size(); ++i) {
			HistoryVehicle__c lObj = new HistoryVehicle__c();
			lObj.Vehicle__c = iNewVeh[iIdx[i]].Id;
			lObj.NewOwner__c = iNewVeh[iIdx[i]].Owner__c;
			lObj.OldOwner__c = iOldVeh[iIdx[i]].Owner__c;
			lObj.ModificationDate__c = Date.today();
			lHistList.add(lObj);
		}
		insert lHistList;
	}	
	
	private static void historyStatus(List<Vehicle__c> iNewVeh, List<Vehicle__c> iOldVeh, List<Integer> iIdx) {
		List<HistoryVehicle__c> lHistList = new List<HistoryVehicle__c>();
		for (Integer i = 0; i < iIdx.size(); ++i) {
			HistoryVehicle__c lObj = new HistoryVehicle__c();
			lObj.Vehicle__c = iNewVeh[iIdx[i]].Id;
			lObj.NewStatus__c = iNewVeh[iIdx[i]].Status__c;
			lObj.OldStatus__c = iOldVeh[iIdx[i]].Status__c;
			lObj.ModificationDate__c = Date.today();
			lHistList.add(lObj);
		}
		insert lHistList;
	}
}