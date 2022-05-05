public with sharing class BoatDataService {
    
    // public BoatDataService() {

    // }

    @AuraEnabled(cacheable=true) 
    public static List<Boat__c> getBoats(String boatTypeId) {
        List<Boat__c> boats = new List<Boat__c>();
        if (String.isEmpty(boatTypeId)) {
            boats = [select Id,Name,Picture__c,Contact__r.name from Boat__c];
        } else{
            boats = [select Id,Name,Picture__c,Contact__r.name from Boat__c where BoatType__c = :boatTypeId ];
        }
        
        return boats;
    }

    @AuraEnabled(cacheable=true) 
    public static List<Boat__c> getSimilarBoats(Id boatId, String similarBy) {
        List<Boat__c> boats = new List<Boat__c>();
        boats = [select Id,Name,Picture__c,Contact__r.name from Boat__c 
        where Id= :boatId or BoatType__c = :similarBy ];
        
        return boats;
    }

    @AuraEnabled(cacheable=true) 
    public static List<BoatType__c> getBoatTypes() {
        List<BoatType__c> boatTypes = new List<BoatType__c>();
        boatTypes = [select Id,Name from BoatType__c ];
        return boatTypes;
    }

    @AuraEnabled(cacheable=false) 
    public static List<BoatReview__c> getAllReviews(Id boatId) {
        List<BoatReview__c> boatReviews = new List<BoatReview__c>();

        return boatReviews;
    }

    @AuraEnabled(cacheable=true) 
    public static String getBoatsByLocation(Decimal latitude, Decimal longitude, String boatTypeId) {
        String boatLocation = '';
        
        return boatLocation;
    }

    @AuraEnabled
    public static String updateBoatList(Object data){
        List<Boat__c> boatsForUpdate =(List<Boat__c>) JSON.deserialize(
            JSON.serialize(data),
            List<Boat__c>.class
        );

        update boatsForUpdate;
        return 'Success: Boats updated successfully';
    }
}