global class BachExeController {
    global BachExeController(){
    
            VFButtonBatchClass bcn = new VFButtonBatchClass() ;
            ID batchprocessid = Database.executeBatch(bcn);
            System.debug('VFButtonBatchClass bcn========='+bcn );
    }           
    public PageReference MyMethod() {       
        return null;
        }  
}