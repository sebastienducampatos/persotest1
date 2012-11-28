trigger TR02_Opportunity_Update on Opportunity (before update) {
	//trigger.new : etat apres modification
	//trigger.old : etat avant modification
	//sur mise à jour simple : on utilise trigger.new[0] 
	AP02_Opportunity.updateDescription(trigger.new, trigger.old); 
	
	/*
	MAIS MOINS PROPRE : PREFERER 1 TRIGGER PAR TYPE D'OPERATION !!!!!!
	On peut faire aussi : trigger toto on Opportunity (before insert, before update) {
		if Trigger.isInsert
			AP02_Opportunity.insertDescription(trigger.new[0]);
		if Trigger.isUpdate
			AP02_Opportunity.updateDescription(trigger.new[0], trigger.old[0]); 
	}
	*/
}