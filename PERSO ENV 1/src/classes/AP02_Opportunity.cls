public with sharing class AP02_Opportunity {
	
	private static String getCorrespondingDesc(Opportunity iOpp) {
		if (iOpp.Amount >= 1000000) {
			return ('Gros projet');
		} else if (iOpp.Amount < 1000) {
			return ('Petit projet');
		} else {
			//manage also the null BUT COULD CAUSE A PROBLEM IN ANOTHER CASE
			//IT IS BETTER TO MANAGE EXPLICITY THE NULL CASE TO AVOID CRASH.
			return ('');
		}
	}
	
	public static void insertDescription (List<Opportunity> iOpp) {
		for (Integer i=0; i < iOpp.size(); ++i) {
			if (iOpp[i].Amount != null) {
				iOpp[i].Description = getCorrespondingDesc(iOpp[i]);
			}
		}
	}
	
	//Insert the description of the opportunity depending on the amount
	//ON EVITE LES INSERT / UDPDATE / UPSERT DANS UNE BOUCLE
	//On passe par une liste temporaire
	public static void insertAccount(List<Opportunity> iOpportunities) {
		List<Account> lAccToCreate = new List<Account>();
		for (Integer i=0; i < iOpportunities.size(); ++i) {
			//Creation of an Account linked to this new opportunity
			Account lLinkedAccount= new Account();
			lLinkedAccount.Name=iOpportunities[i].Name;
			lAccToCreate.add(lLinkedAccount);
		}
		insert lAccToCreate;
	}
	
	//Update the description of the opportunity depending on the amount
	public static void updateDescription(List<Opportunity> iOpp, List<Opportunity> iOldOpp) {
		for (Integer i = 0; i < iOpp.size(); ++i) {
			if (iOpp[i].Amount != iOldOpp[i].Amount) {
				String lValue = getCorrespondingDesc(iOpp[i]);
				iOpp[i].Description = lValue + ' (avant: )' + iOldOpp[i].Amount + '€';
			}
		}
	}	
	
	//test
	public static void linkToAccount(List<Account> iAccounts) {
		Set<String> lNames = new Set<String>();
		for (Integer i = 0; i < iAccounts.size(); ++i) {
			lNames.add(iAccounts[i].Name);			
		} 
		List<Opportunity> lOpps = new List<Opportunity>();
		lOpps = [SELECT Id, Name, AccountId FROM Opportunity WHERE Opportunity.Name IN :lNames];
		for (Integer i = 0; i < lOpps.size(); ++i) {
			for (Integer j = 0; j < iAccounts.size(); ++j) {
				if (lOpps[i].Name == iAccounts[j].Name) {
					System.debug(lOpps[i].Name);
					lOpps[i].AccountId = iAccounts[j].Id;
				}
			}
		}
		update lOpps;
	}
}