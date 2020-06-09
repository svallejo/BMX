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
        var reportAction = component.get("c.getReportUrl");
        reportAction.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let reportUrl = response.getReturnValue();
                console.log(reportUrl)
                 urlEvent.setParams({
                  "url": reportUrl   
                });
                urlEvent.fire();
                setTimeout(function(){
                   $A.get("e.force:closeQuickAction").fire();
                },500);
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
        $A.enqueueAction(reportAction);
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