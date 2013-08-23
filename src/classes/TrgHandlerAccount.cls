public with sharing class TrgHandlerAccount extends TrgHandler {
    private static Boolean InProcess = false;
    
    
    public TrgHandlerAccount(boolean pIsExecuting, Integer pSize){
    	super(pIsExecuting, pSize);
    	
    }
    
    
    /**
     * Event Action: Before Insert
     */
    public void OnBeforeInsert(Account[] newAccounts){
    	for(TrgHandler.ObserverTrgBeforeInsert observer : beforeInsertObservers){
    		newAccounts = (List<Account>)observer.onBeforeInsert(newAccounts);
    	}
    }
    
    
    /**
     * Event Action: After Insert
     */
    public void OnAfterInsert(Account[] newAccounts){
    	for(TrgHandler.ObserverTrgAfterInsert observer : afterInsertObservers){
    		observer.onAfterInsert(newAccounts);
    	}
        
    }
    
    
    /**
     * Event Action : Before Update
     */
    public void OnBeforeUpdate(Account[] oldAccounts, Account[] updAccounts, Map<Id, Account> oldAccountMap, Map<Id, Account> updAccountMap){
    	
    	if(InProcess){
        	return;
        }
        
    	for(TrgHandler.ObserverTrgBeforeUpdate observer : beforeUpdateObservers){
    		updAccounts = (List<Account>)observer.onBeforeUpdate(oldAccounts, updAccounts, oldAccountMap, updAccountMap);
    	}
    	
    }
    
    
    /**
     * Event Action: After Update
     */
    public void OnAfterUpdate(Account[] oldAccounts, Account[] updAccounts, Map<Id, Account> oldAccountMap, Map<Id, Account> updAccountMap){
    	
    	if(InProcess){
        	return;
        }
        
        InProcess = true;
        
    	for(TrgHandler.ObserverTrgAfterUpdate observer : afterUpdateObservers){
    		observer.onAfterUpdate(oldAccounts, updAccounts, oldAccountMap, updAccountMap);
    	}
        
        InProcess = false;
    }
    
    
    /**
     * Event Action: After Delete
     */
    public void OnAfterDelete(Account[] delAccounts){
    	for(TrgHandler.ObserverTrgAfterDelete observer : afterDeleteObservers){
    		observer.onAfterDelete(delAccounts);
    	}
    	
    }
    
}