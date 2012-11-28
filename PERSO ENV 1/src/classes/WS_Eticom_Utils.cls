public with sharing class WS_Eticom_Utils {
     
	/***
	 * ETICOM REQUEST : WSDL version, tried to force the import of the WSDL by replacing RPC/ENCODED with DOCUMENT LITERAL
	 * 
	 **/
	 /*
	public WS_Eticom_CommercialDescription_WSDL.RechercheVehicule getEticomData_vWSDL(VFC05_VehicleAttributes VehController) {
		if (VehController == null) return null;
		return getEticomData_vWSDL(VehController.getVin(), '');
	}	 
	*/
	
    public WS_Eticom_CommercialDescription_WSDL.RechercheVehicule getEticomData_vWSDL(String iVin, String iImmat) {     
        // --- PRE TREATMENT ----
		try 
		{
			String vin = iVin;
			String NumeroImmatriculation = '?';
			String SiDemandeur = '?';
			String IdDemande = '?';
			String Langue = '?';
			String FormatRestitution = '?';
			 
			//vin = 'VF1BGRG0633285766';
			vin = 'VF1JZ030642741282';
			String myData = 'awbic50:ccbic001';
			String encodedusernameandpassword = EncodingUtil.base64Encode(Blob.valueOf(myData));
			
	               
	        // ---- WEB SERVICE CALLOUT -----    
	        WS_Eticom_CommercialDescription_WSDL.MktGetEticomReva EticomWS = new WS_Eticom_CommercialDescription_WSDL.MktGetEticomReva();
	        EticomWS.endpoint_x = 'https://webservices2.renault.fr/ccb/0/MktGetEticomRevc';
	        EticomWS.inputHttpHeaders_x = new Map<String, String>();
        	EticomWS.inputHttpHeaders_x.put('Authorization','Basic ' + encodedusernameandpassword );
	        EticomWS.clientCertName_x = 'ccbisdc_01';
	        //timeout in ms  
	        EticomWS.timeout_x=30000;  
	        WS_Eticom_CommercialDescription_WSDL.RechercheVehicule Eticom_RWS = EticomWS.rechercher(
				vin, NumeroImmatriculation, SiDemandeur, IdDemande, Langue, FormatRestitution);        
	        return Eticom_RWS; 	
		} catch (CallOutException e) {
			System.debug('ETICOM, CALLOUT EXCEPTION='+e.getMessage());
			return null;
		} catch (Exception e){
			System.debug('ETICOM, EXCEPTION='+e.getMessage());
			return null;
		}
    }

    /***
	 * ETICOM REQUEST : REST version, build an HTTPRequest and parse the HTTPResponse 
	 * 
	 **/
	/*
    public WS_Eticom_CommercialDescription.Response getEticomData_vREST(VFC05_VehicleAttributes VehController) {
		if(VehController == null) return null;
		return getEticomData_vREST(VehController.getVin(), null);
    }
    */
    /*  
    public WS_Eticom_CommercialDescription.Response getEticomData_vREST(String iVin, String iImmat) {
    	WS_Eticom_CommercialDescription WSEticom = new WS_Eticom_CommercialDescription();
		WS_Eticom_CommercialDescription.Request WSRequest = new WS_Eticom_CommercialDescription.Request(iVin, iImmat);
		WS_Eticom_CommercialDescription.Response response = WSEticom.invokeEticomReva(WSRequest);
		return response;
    }
    */
}