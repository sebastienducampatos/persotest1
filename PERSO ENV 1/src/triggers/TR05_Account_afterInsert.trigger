trigger TR05_Account_afterInsert on Account (after insert) {
	//juste pour l'exercise :
	// 1. il est aberrant de mofifier le nom de l'Account en fonction du nom de l'opprtunity
	// car l'account peut avoir plusieurs opportunities
	// 2. on peut se passer des Maps, Sets pour cet exercise car il suffit d'attaquer direct
	// l'account associé à l'opportunity
	AP02_Opportunity.linkToAccount(trigger.new);
}