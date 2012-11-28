trigger TR14_Vehicle_beforeUpdate on Vehicle__c (before update) {
	AP10_Vehicle.computePrices(trigger.new);
}