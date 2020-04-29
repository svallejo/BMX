({
    init: function(component, event, helper) {
        var action = component.get("c.doesUserHaveAccess");
        var userId = $A.get( "$SObjectType.CurrentUser.Id" );

                console.log("test value:")
                console.log("user Id:  " + userId);
        console.log("record id: " + component.get("v.recordId"));
        action.setParams({"userId" : userId, "recordId": component.get("v.recordId")});
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                console.log("return value:" + JSON.stringify(response.getReturnValue()))
                component.set("v.visible", result);
            }
            else {
                let errors = response.getError();
                let message = 'Unknown error'; // Default error message
                // Retrieve the error message sent by the server
                if (errors && Array.isArray(errors) && errors.length > 0) {
                    message = errors[0].message;
                }
                // Display the message
                console.error(message)
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
	handleClick : function(component, event, helper) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
          "url": "https://customerlist-ab54cfe76.dispatcher.hana.ondemand.com/index.html"   
        });
        urlEvent.fire();
        setTimeout(function(){
           $A.get("e.force:closeQuickAction").fire();
        },500);
    },
    refresh : function(component, event, helper) {
        var action = component.get("c.doesUserHaveAccess");
        var userId = $A.get( "$SObjectType.CurrentUser.Id" );

                console.log("test value:")
                console.log("user Id:  " + userId);
        console.log("record id: " + component.get("v.recordId"));
        action.setParams({"userId" : userId, "recordId": component.get("v.recordId")});
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                console.log("return value:" + JSON.stringify(response.getReturnValue()))
                component.set("v.visible", result);
            }
            else {
                let errors = response.getError();
                let message = 'Unknown error'; // Default error message
                // Retrieve the error message sent by the server
                if (errors && Array.isArray(errors) && errors.length > 0) {
                    message = errors[0].message;
                }
                // Display the message
                console.error(message)
            }
        });
        
        // Send action off to be executed
        $A.enqueueAction(action);
	}
})