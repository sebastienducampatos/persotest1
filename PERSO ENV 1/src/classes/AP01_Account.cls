public with sharing class AP01_Account {
	
	//mettre à jour le nom de l'opportunite
	//avec for de for
    public static void updateNames(List<Opportunity> iOppNew, List<Opportunity> iOppOld) {
		Set<String> lNames = new Set<String>();
		for (Integer i = 0; i < iOppOld.size(); ++i){
			if (iOppNew[i].Name != iOppOld[i].Name) {
				lNames.add(iOppOld[i].Name);
			}
		}
		List<Account> lAccounts= [SELECT Id, Name from Account WHERE Name IN :lNames];
		for (Integer i = 0; i < lAccounts.size(); ++i) {
			for (Integer j = 0; j < iOppOld.size(); ++j) {
				if (lAccounts[i].Name == iOppOld[j].Name) {
					System.debug(lAccounts[i].Name);
					lAccounts[i].Name = iOppNew[j].Name;
				}
			}
		}
		update lAccounts;
    }
    
    //avec map
    //yo toto
    //aïe papaye
    public static void updateNames2(List<Opportunity> iOppNew, List<Opportunity> iOppOld) {
		Map<String, Integer> lNamesIdxMap = new Map<String, Integer>();
		//on ne garde que les éléments pour lesquels le nom a changé
		for (Integer i = 0; i < iOppOld.size(); ++i){
			if (iOppNew[i].Name != iOppOld[i].Name) {
				lNamesIdxMap.put(iOppOld[i].Name, i);
			}
		}
		List<Account> lAccounts= [SELECT Id, Name from Account WHERE Name IN :lNamesIdxMap.keySet()];
		for (Integer i = 0; i < lAccounts.size(); ++i) {
			if (lNamesIdxMap.containsKey(iOppOld[i].Name)) {
				Integer lIdx = lNamesIdxMap.get(iOppOld[i].Name);
				lAccounts[i].Name = iOppNew[lIdx].Name;
			}
		}
		update lAccounts;
    }
    
    //on met à jour l'email de chaque contact avec l'email de l'entreprise.
    public static void updateContactsEmails(List<Account> iAccNew, List<Account> iAccOld) {
    	Set<Account> lAccountsSet = new Set<Account>();
    	for(Integer i = 0; i < iAccOld.size(); ++i) {
    		if (iAccOld[i].Email_de_son_entreprise__c != iAccNew[i].Email_de_son_entreprise__c ) {
    			lAccountsSet.add(iAccOld[i]);
    		}
    	}
    	List<Contact> lListContacts = [SELECT Id, Account.Email_de_son_entreprise__c FROM Contact WHERE AccountId IN :lAccountsSet];
    	for ( Integer i = 0; i < lListContacts.size(); ++i) {
    		lListContacts[i].Email_de_son_entreprise__c = lListContacts[i].Account.Email_de_son_entreprise__c;
    	}
    	update lListContacts;
    }
}