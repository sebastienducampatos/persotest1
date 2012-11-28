trigger TR03_Opportunity_afterInsert on Opportunity (after insert) {
	AP02_Opportunity.insertAccount(trigger.new);
}