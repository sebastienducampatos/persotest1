trigger TR12_Owner_afterUpdate on Owner__c (after update) {
	AP11_Owner.updateOwner(trigger.new, trigger.old); 
}