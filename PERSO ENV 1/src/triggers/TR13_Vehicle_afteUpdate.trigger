trigger TR13_Vehicle_afteUpdate on Vehicle__c (after update) {
	AP10_Vehicle.updateHistory(trigger.new, trigger.old);
}