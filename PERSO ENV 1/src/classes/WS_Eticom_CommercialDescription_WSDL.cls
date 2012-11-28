public class WS_Eticom_CommercialDescription_WSDL {
	
	public class TechnicalCaracteristics {
        public String VersionVariantType;
        public String Carburant;
        public String TypeMoteur;
        private String[] VersionVariantType_type_info = new String[]{'VersionVariantType','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] Carburant_type_info = new String[]{'Carburant','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] TypeMoteur_type_info = new String[]{'TypeMoteur','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'VersionVariantType','Carburant','TypeMoteur'};
    }
    
    public class GeneralesCaracteristics {
        public String TAPV;
        public Date DateFab;
        public String LibUsine;
        private String[] TAPV_type_info = new String[]{'TAPV','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] DateFab_type_info = new String[]{'DateFab','http://www.w3.org/2001/XMLSchema','date','1','1','true'};
        private String[] LibUsine_type_info = new String[]{'LibUsine','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'TAPV','DateFab','LibUsine'};
    }
    public class TeintesSH {
        public String CodeObjet;
        public String LibelleCommercial;
        public String MnemoniqueCritere;
        private String[] CodeObjet_type_info = new String[]{'CodeObjet','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] LibelleCommercial_type_info = new String[]{'LibelleCommercial','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] MnemoniqueCritere_type_info = new String[]{'MnemoniqueCritere','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'CodeObjet','LibelleCommercial','MnemoniqueCritere'};
    }
    public class VersionMarketing {
        public String LibelleVersion;
        public String LibelleModele;
        private String[] LibelleVersion_type_info = new String[]{'LibelleVersion','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] LibelleModele_type_info = new String[]{'LibelleModele','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'LibelleVersion','LibelleModele'};
    }
    public class Livraison {
        public Date DateLivraison;
        public String LibPaysLivraison;
        private String[] DateLivraison_type_info = new String[]{'DateLivraison','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] LibPaysLivraison_type_info = new String[]{'LibPaysLivraison','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'DateLivraison','LibPaysLivraison'};
    }
    public class Equipement {
        public String LibelleClasse;
        public String LibelleEquipement;
        public String MnemoniqueCritere;
        public String Option;
        private String[] LibelleClasse_type_info = new String[]{'LibelleClasse','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] LibelleEquipement_type_info = new String[]{'LibelleEquipement','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] MnemoniqueCritere_type_info = new String[]{'MnemoniqueCritere','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] Option_type_info = new String[]{'Option','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'LibelleClasse','LibelleEquipement','MnemoniqueCritere','Option'};
    }
    public class MktGetEticomReva {
        public String endpoint_x = 'http://aoc.intra.renault.fr:80/aoc/services/MktGetEticomReva';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault', 'WS_Eticom_CommercialDescription_WSDL'};
        public WS_Eticom_CommercialDescription_WSDL.RechercheVehicule rechercher(
        	String Vin,
        	String NumeroImmatriculation,
        	String SiDemandeur,
        	String IdDemande,
        	String Langue,
        	String FormatRestitution) 
        {     
            WS_Eticom_CommercialDescription_WSDL.RechercherRequest request_x = new WS_Eticom_CommercialDescription_WSDL.RechercherRequest();
            WS_Eticom_CommercialDescription_WSDL.rechercherResponse response_x;
            request_x.Vin = Vin;
            request_x.NumeroImmatriculation = NumeroImmatriculation;
            request_x.SiDemandeur = SiDemandeur;
            request_x.IdDemande = IdDemande;
            request_x.Langue = Langue;
            request_x.FormatRestitution = FormatRestitution;

            Map<String, WS_Eticom_CommercialDescription_WSDL.rechercherResponse> response_map_x = new Map<String, WS_Eticom_CommercialDescription_WSDL.rechercherResponse>();
            response_map_x.put('response_x', response_x);
            system.debug('ETICOM, RechercheVehicule, Vin='+request_x.Vin);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[] {
	              endpoint_x,
	              '',
	              'http://revc.geteticom.mkt.bservice.renault',
	              'rechercher',
	              'http://revc.geteticom.mkt.bservice.renault',
	              'rechercherResponse',
	              'WS_Eticom_CommercialDescription_WSDL.rechercherResponse'
              }
            );
            response_x = response_map_x.get('response_x');
            return response_x.rechercherReturn;
        } 
    }
    //----- REQUEST PARAMETERS
    public class RechercherRequest {
    	public String Vin;
    	public String NumeroImmatriculation;
    	public String SiDemandeur;
    	public String IdDemande;
    	public String Langue;
    	public String FormatRestitution;
    	private String[] Vin_type_info = new String[]{'Vin','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] NumeroImmatriculation_type_info = new String[]{'NumeroImmatriculation','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] SiDemandeur_type_info = new String[]{'SiDemandeur','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] IdDemande_type_info = new String[]{'IdDemande','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] Langue_type_info = new String[]{'Langue','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] FormatRestitution_type_info = new String[]{'FormatRestitution','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'Vin','NumeroImmatriculation','SiDemandeur','IdDemande','Langue','FormatRestitution'};
    }
    //----- RESPONSE PARSING CLASSES
    public class rechercherResponse {
    	public WS_Eticom_CommercialDescription_WSDL.RechercheVehicule rechercherReturn;
    	private String[] rechercherReturn_type_info = new String[]{'rechercherReturn','http://revc.geteticom.mkt.bservice.renault','RechercheVehicule','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'rechercherReturn'};
    }
    public class ResponseRecherche {
        public String Vin;
        public String NumeroImmatriculation;
        public String Langue;
        public WS_Eticom_CommercialDescription_WSDL.VersionMarketing[] VersionMarketings;
        public WS_Eticom_CommercialDescription_WSDL.Equipement[] Equipements;
        public WS_Eticom_CommercialDescription_WSDL.TeintesSH[] TeintesSHs;
        public WS_Eticom_CommercialDescription_WSDL.GeneralesCaracteristics GeneralesCaracteristics;
        public WS_Eticom_CommercialDescription_WSDL.TechnicalCaracteristics TechnicalCaracteristics;
        public WS_Eticom_CommercialDescription_WSDL.Livraison Livraison;
        public Date DateFirstImmat;
        private String[] Vin_type_info = new String[]{'Vin','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] NumeroImmatriculation_type_info = new String[]{'NumeroImmatriculation','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] Langue_type_info = new String[]{'Langue','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] VersionMarketings_type_info = new String[]{'VersionMarketings','http://revc.geteticom.mkt.bservice.renault','VersionMarketing','1','1','true'};
        private String[] Equipements_type_info = new String[]{'Equipements','http://revc.geteticom.mkt.bservice.renault','Equipement','1','1','true'};
        private String[] TeintesSHs_type_info = new String[]{'TeintesSHs','http://revc.geteticom.mkt.bservice.renault','TeintesSH','1','1','true'};
        private String[] GeneralesCaracteristics_type_info = new String[]{'GeneralesCaracteristics','http://revc.geteticom.mkt.bservice.renault','GeneralesCaracteristics','1','1','true'};
        private String[] TechnicalCaracteristics_type_info = new String[]{'TechnicalCaracteristics','http://revc.geteticom.mkt.bservice.renault','TechnicalCaracteristics','1','1','true'};
        private String[] Livraison_type_info = new String[]{'Livraison','http://revc.geteticom.mkt.bservice.renault','Livraison','1','1','true'};
        private String[] DateFirstImmat_type_info = new String[]{'DateFirstImmat','http://revc.geteticom.mkt.bservice.renault','date','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'Vin','NumeroImmatriculation','Langue','VersionMarketings','Equipements','TeintesSHs','GeneralesCaracteristics','TechnicalCaracteristics','Livraison','DateFirstImmat'};
    }
    public class RechercheVehicule {
        public String Vin;
        public String NumeroImmatriculation;
        public String Langue;
        public String MessageErreur;
        public String CritereRecherche;
        public WS_Eticom_CommercialDescription_WSDL.ResponseRecherche ResponseRecherche;
        private String[] Vin_type_info = new String[]{'Vin','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] NumeroImmatriculation_type_info = new String[]{'NumeroImmatriculation','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] Langue_type_info = new String[]{'Langue','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] MessageErreur_type_info = new String[]{'MessageErreur','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] CritereRecherche_type_info = new String[]{'CritereRecherche','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] ResponseRecherche_type_info = new String[]{'ResponseRecherche','http://revc.geteticom.mkt.bservice.renault','ResponseRecherche','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://revc.geteticom.mkt.bservice.renault','false','false'};
        private String[] field_order_type_info = new String[]{'Vin','NumeroImmatriculation','Langue','MessageErreur','CritereRecherche','ResponseRecherche'};
    }
}