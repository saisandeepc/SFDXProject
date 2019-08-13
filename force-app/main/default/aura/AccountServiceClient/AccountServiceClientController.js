({
	doInit : function(component, event, helper) {
		var service = component.find("service");
        console.log('--service---'+JSON.stringify(service));
		service.findAll(function(error, data) {
			// TODO: Add error handling
			component.set("v.accounts", data);
		});
	}
})