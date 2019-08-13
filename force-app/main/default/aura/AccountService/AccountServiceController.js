({
	findAll : function(component, event, helper) {
        var params = event.getParam("arguments");
        
        var action = component.get("c.getAccounts");
        
    	action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                console.log('--response.getReturnValue()---'+response.getReturnValue());
                params.callback(null, response.getReturnValue());
            } else {
                console.log('--error---'+response.getReturnValue());
				params.callback('response.getError()');
            }
    	});
    	$A.enqueueAction(action);
	}
})