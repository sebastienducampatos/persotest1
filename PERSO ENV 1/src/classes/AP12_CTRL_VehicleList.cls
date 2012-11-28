public with sharing class AP12_CTRL_VehicleList {
	
	 public ApexPages.StandardSetController stdCntrlr {get; set;}
	 public Id VehicleId {get; set;}
	 public String VehicleStr {get; set;}
	 public Vehicle__c NewVehicule {get; set;}
	
	//Une extension requiere une référence au standard controller
	public AP12_CTRL_VehicleList(ApexPages.StandardSetController controller) {
		stdCntrlr = controller;
		NewVehicule = new Vehicle__c();
	}
	
	public PageReference updateVehicle(){
		system.debug(VehicleStr);
		List<Vehicle__c> lVeh = [SELECT Id FROM Vehicle__c WHERE Id = :VehicleStr];
		if (lVeh.size() > 0) {
			if (lVeh[0] != null) {
				return (new ApexPages.StandardController(lVeh[0])).edit();
			}
		}
		return ApexPages.currentPage();
	}
	
	public PageReference deleteVehicle() {
		PageReference page = ApexPages.currentPage();
		page.setRedirect(true);
		List<Vehicle__c> lVeh = [SELECT Id FROM Vehicle__c WHERE Id = :VehicleStr];
		if (lVeh.size() > 0) {
			if (lVeh[0] != null) {
				delete lVeh[0];
			}
		}
		return page;
	}
	
	public PageReference save() {
		insert NewVehicule;
		PageReference page = ApexPages.currentPage();
		page.setRedirect(true);
		return page;
	}
}