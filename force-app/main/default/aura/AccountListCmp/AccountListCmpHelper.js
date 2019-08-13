({
    //Fetch the accounts from the Apex controller
    getAccounts: function(component) {
     	var action = component.get("c.getAccounts");
     	//Set up the callback
     	action.setCallback(this, function(actionResult) {
            component.set("v.accounts", actionResult.getReturnValue());
        	component.set("v.accountsLength", actionResult.getReturnValue().length); 
      	});	
        $A.enqueueAction(action);  
    }
    
    
})

findByName: function(component,event) {  
    var searchKey = event.getParam("searchKey");
    var accList = component.get("v.accounts");
    var action = component.get("c.findByName");
    action.setParams({
      "searchKey": searchKey,
      "accList" : accList
    }); 
    action.setCallback(this, function(a) {
        component.set("v.accounts", a.getReturnValue());
        component.set("v.accountsLength", a.getReturnValue().length); 
    });
    $A.enqueueAction(action);  
}