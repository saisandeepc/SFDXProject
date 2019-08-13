({
  dispatchAction : function(component, action, params) {
    action.setCallback(this, (response) => {
        alert('----getState--'+response.getState());
      if (response.getState() === "SUCCESS") {
        params.callback(null, response.getReturnValue());
      } else {
        params.callback(response.getError());
      }
    });
    $A.enqueueAction(action);
  }
})