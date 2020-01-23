({
    export : function(component, event, helper) {
        try{
          var productInformationList = component.get("v.data");
          var fileName = helper.buildFileName(component.get("v.productItemNumber"));
          var header = helper.formatHeader(productInformationList[0]);
          var body  = helper.parseData(productInformationList);
          var doc = helper.buildJsAutoTable(header, body);
          doc.save(fileName);
        }
        catch(error){
            console.log(error)
        }
    }
})