public with sharing class TrgHandlerAccount_Validation implements TrgHandler.ObserverTrgBeforeInsert, TrgHandler.ObserverTrgBeforeUpdate {


	public TrgHandlerAccount_Validation(){
		
	}
	
	
	/**
	 * Action : Before Insert
	 */
	public List<SObject> onBeforeInsert(List<SObject> newAccounts){
		for(Account acc : (List<Account>)newAccounts){
			
			// Some Validation Process...etc
			
		}
		
		return newAccounts;
	}
	
	/**
	 * Action : Before Update
	 */
	public List<SObject> onBeforeUpdate(List<SObject> oldAccounts, List<SObject> updAccounts,
			Map<Id, SObject> oldAccountMap, Map<Id, SObject> updAccountMap){
		
		for(Account acc : (List<Account>)updAccounts){
			
			// Some Validation Process...etc
		}
		
		return updAccounts;
	}
}