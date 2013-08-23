trigger AccountTrigger on Account (before insert, before update) {


    TrgHandlerAccount handler = new TrgHandlerAccount(Trigger.isExecuting, Trigger.size);
    
    // トリガハンドラの拡張
    //  -> カスタム設定などに、Apexクラス名を追加しておいて動的に設定できるようにするのもアリ...
    //    Type t = Type.forName('ApexClass Name');
    //    handler.addObserver('before insert, before update', (ObserverTrg)t.newInstance());
    handler.addObserver('before insert,before update', new TrgHandlerAccount_Validation());
    
    
    // トリガの実行
    if(Trigger.isInsert && Trigger.isBefore){
    	handler.OnBeforeInsert(Trigger.new);
    	
    } else if(Trigger.isUpdate && Trigger.isBefore){
        handler.OnBeforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        
    }
}