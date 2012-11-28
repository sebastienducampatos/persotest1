trigger TR04_Opportunity_afterUpdate on Opportunity (after update) {
	AP01_Account.updateNames2(trigger.new, trigger.old);
}