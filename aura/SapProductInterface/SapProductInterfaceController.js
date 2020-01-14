({
    init: function (cmp, event) {
        cmp.set('v.columns', [
            {label: 'Item #', fieldName: 'productItemNumber', type: 'text'},
            {label: 'Description', fieldName: 'productDescription', type: 'text'},
            {label: 'Product Range', fieldName: 'productRange', type: 'text'},
            {label: 'Product Type', fieldName: 'productType', type: 'text'},
            {label: 'Make or Buy', fieldName: 'makeOrBuy', type: 'text'},
            {label: 'Trade Type', fieldName: 'tradeType', type: 'text'},
            {label: 'Legal Manufacturer', fieldName: 'legalManufacturer', type: 'text'},
            {label: 'Site Responsible', fieldName: 'siteResponsible', type: 'text'},
            {label: 'GTIN', fieldName: 'gtin', type: 'text'},
            {label: 'CE Approved', fieldName: 'ceApproved', type: 'text'},
            {label: 'Commercialization Coverage', fieldName: 'commercializationCoverage', type: 'text'},
            {label: 'Origin Animal/Human', fieldName: 'originAnimalHuman', type: 'text'}
        ]);
        cmp.set("v.HideSpinner", false);

    },
    closeModal: function(component, event, helper){  
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();    
    },
    
    saveRecord:function(component, event, helper){
        component.set("v.HideSpinner", true);
        var action = component.get("c.updateChangeControlWithProductInformation");
        var test =  JSON.stringify(component.get('v.selectedProduct')).replace('[','').replace(']','');
        var test2 =  JSON.parse(test);
        if (component.get("v.selectedProduct") != null) {
            action.setParams({'selectedProduct' : test2, 'recordId': component.get("v.recordId")});
            // Add callback behavior for when response is received
                action.setCallback(this, function(response) {
                    let state = response.getState();
                    if (state === "SUCCESS") {
                        let result = response.getReturnValue();
                        console.log(JSON.stringify(response.getReturnValue()))
                         $A.get("e.force:closeQuickAction").fire();  
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
                    component.set("v.HideSpinner", false);
                });
    
                // Send action off to be executed
                $A.enqueueAction(action);
        }
        else {
            let errors = [];
            let error = {};
            error.message = "Please select a SAP Product prior to submitting.\n";
            errors[0] = error;
            console.log(errors);
            helper.handleErrors("Warning", errors, "warning");
            component.set("v.HideSpinner", false);

        }
     },
    setSelectedProduct:function(component, event, helper){
        let lines = {};
        lines = component.find('prodTable').getSelectedRows();
        component.set("v.selectedProduct", lines);
        console.log('set product: ' + JSON.stringify(lines));

    },
    search: function(component, event, helper){
 		 component.set("v.HideSpinner", true);
        var action = component.get("c.retrieveSapProductInformation");
        action.setParams({'productItemNumber' : component.get('v.productItemNumber')});
        console.log(component.get('v.productItemNumber'))
        // Add callback behavior for when response is received
        if ( component.get('v.productItemNumber')) {
            action.setCallback(this, function(response) {
                let state = response.getState();
                if (state === "SUCCESS") {
                    let result = response.getReturnValue();
                    console.log('response: ' + response.getReturnValue())
                    console.log(JSON.stringify(response.getReturnValue()))
                    component.set("v.data", result);
                    if (response.getReturnValue() == "") {
                        let errors = [];
                        let error = {};
                        error.message = "No records retrieved from SAP.\n";
                        errors[0] = error;
                        console.log(errors);
                        
                        helper.handleErrors("Info", errors, "info");
                    }
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
                  component.set("v.HideSpinner", false);

            });

            // Send action off to be executed
            $A.enqueueAction(action);
        }
        else {
            let errors = [];
            let error = {};
            error.message = "Please enter a Product Item Number.\n";
            errors[0] = error;
            console.log(errors);
            
            helper.handleErrors("Warning", errors, "warning");
  			component.set("v.HideSpinner", false);
        }
    }
});