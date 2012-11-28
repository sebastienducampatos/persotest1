trigger TR06_Account_afterUpdate on Account (after update) {
	AP01_Account.updateContactsEmails(trigger.new, trigger.old); 
}