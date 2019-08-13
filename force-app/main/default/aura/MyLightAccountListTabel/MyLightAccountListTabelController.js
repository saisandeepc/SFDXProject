({
	doInit : function(component, event, helper) {
        console.log('--In--');
        helper.getAccountDetails(component, event, helper);
    }
})