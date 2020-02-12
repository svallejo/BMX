({
    init: function (cmp, event) {
        cmp.set('v.columns', [
            {label: 'Item #', fieldName: 'Product_Item_Number__c', type: 'text'},
            {label: 'Description', fieldName: 'Product_Item_Description__c', type: 'text'},
        ]);
        cmp.set("v.HideSpinner", false);
        var action = cmp.get("c.retrieveSapProductInformation");
        action.setParams({'recordId' : cmp.get("v.recordId")});
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                console.log('response: ' + response.getReturnValue())
                console.log(JSON.stringify(response.getReturnValue()))
                cmp.set("v.data", result);
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
                // helper.handleErrors("Error", errors, "error");
            }
            cmp.set("v.HideSpinner", false);
        });

        // Send action off to be executed
        $A.enqueueAction(action);

        var ccAction = cmp.get("c.areMultipleProductsImpacted");
        ccAction.setParams({'recordId' : cmp.get("v.recordId")});
        ccAction.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                // console.log('response: ' + response.getReturnValue())
                // console.log(JSON.stringify(response.getReturnValue()))
                cmp.set("v.areMultipleProductsImpacted", result);
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
                // helper.handleErrors("Error", errors, "error");
            }
            cmp.set("v.HideSpinner", false);
        });
        // Send action off to be executed
        $A.enqueueAction(ccAction);
    },
     refresh:function(cmp, event, helper){
        var ccAction = cmp.get("c.areMultipleProductsImpacted");
        var action = cmp.get("c.retrieveSapProductInformation");
        action.setParams({'recordId' : cmp.get("v.recordId")});
        ccAction.setParams({'recordId' : cmp.get("v.recordId")});
        ccAction.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                // console.log('response: ' + response.getReturnValue())
                // console.log(JSON.stringify(response.getReturnValue()))
                cmp.set("v.areMultipleProductsImpacted", result);
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
                // helper.handleErrors("Error", errors, "error");
            }
            cmp.set("v.HideSpinner", false);
        });

        // Send action off to be executed
        $A.enqueueAction(ccAction);

        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                console.log('response: ' + response.getReturnValue())
                console.log(JSON.stringify(response.getReturnValue()))
                cmp.set("v.data", result);
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
                // helper.handleErrors("Error", errors, "error");
            }
            cmp.set("v.HideSpinner", false);
        });

        // Send action off to be executed
        $A.enqueueAction(action);
     }
})