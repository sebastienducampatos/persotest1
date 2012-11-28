//IT IS BETTER TO SPLIT THE DIFFERENT CASE
// THE update setting IS USED WITH trigger.old WHICH IS NOT MANAGED IN THIS CASE 
// IN THIS CASE, if we add BEFORE UPDATE, it is impossible to detect the modification
trigger TR01_Opportunity_InsertUpdate on Opportunity (before insert) {
	AP02_Opportunity.insertDescription(trigger.new);  
}