({
    init: function (cmp, event) {
        console.log('init');
        cmp.set('v.columns', [
            {label: 'Item #', fieldName: 'Product_Item_Number__c', type: 'text'},
            {label: 'Description', fieldName: 'Product_Item_Description__c', type: 'text'},
        ]);
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
            });
        // Send action off to be executed
        $A.enqueueAction(ccAction);
    },
     recordUpdated:function(cmp, event, helper){
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
            });

        // Send action off to be executed
        $A.enqueueAction(action);
     },
     deleteRecord:function(component, event, helper){
        var action = component.get("c.removeRecords");
        var selectedRows = component.get('v.selectedRows');
        console.log('Deleting selected rows: ' + selectedRows);
        action.setParams({'sapRecords' : selectedRows});
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                console.log(JSON.stringify(response.getReturnValue()))
                component.set('v.selectedRows', []);

                $A.get('e.force:refreshView').fire();  
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
                helper.handleErrors("Error", errors, "error");
            }
        });

        // Send action off to be executed
        $A.enqueueAction(action);
     },
     setSelectedProduct:function(component, event, helper){
        let lines = [];
        lines = component.find('prodTable').getSelectedRows();
        var showDelete = lines.length >= 1 ? true : false;

        component.set("v.showDelete", showDelete);
        component.set("v.selectedRows", lines);
    }

})