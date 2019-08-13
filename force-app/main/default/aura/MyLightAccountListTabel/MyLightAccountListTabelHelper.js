({
    getAccountDetails : function(component, event) {
        console.log('In Helper');
        var action =  component.get("c.getLigtAccountList");
       
        action.setCallback(this, function(response){
            var state = response.getState();
            if(component.isValid() && state === "SUCCESS") {
                console.log('---response.getReturnValue()--'+JSON.stringify(response.getReturnValue()));
                component.set("v.AccountList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})