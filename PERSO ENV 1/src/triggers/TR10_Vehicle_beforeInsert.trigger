trigger TR10_Vehicle_beforeInsert on Vehicle__c (before insert) {
	AP10_Vehicle.createVehicleInformation(trigger.new);
	AP10_Vehicle.computePrices(trigger.new);
}