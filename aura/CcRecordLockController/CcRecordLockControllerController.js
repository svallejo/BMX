({
	refresh:function(cmp, event, helper){
        var ccAction = cmp.get("c.queryCC");
        ccAction.setParams({'record' : cmp.get("v.cc")});
        ccAction.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
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
        $A.enqueueAction(ccAction);
    },
init:function(cmp, event, helper){
        var ccAction = cmp.get("c.queryBaseCC");
        ccAction.setParams({'recordId' : cmp.get("v.recordId")});
        ccAction.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                cmp.set("v.cc", result);
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
        $A.enqueueAction(ccAction);
    }})