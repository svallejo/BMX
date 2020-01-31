({
    parseData : function(productInformationList) {
        let productInformationRows = [];
        for ( var row in productInformationList){
            var productInformationCell = [];
            var updatedProductInformation = this.rearrangeKeys(productInformationList[row]);
            productInformationCell = Object.values(updatedProductInformation);
            productInformationRows.push(productInformationCell);
        }
        return productInformationRows;
    }, 
    rearrangeKeys: function(productInformation){
        var updateProductInformation = {}
        updateProductInformation.productItemNumber = productInformation.productItemNumber;
        updateProductInformation.productDescription = productInformation.productDescription;
        updateProductInformation.productRange = productInformation.productRange;
        updateProductInformation.productType = productInformation.productType;
        updateProductInformation.makeOrBuy = productInformation.makeOrBuy;
        updateProductInformation.tradeType = productInformation.tradeType;
        updateProductInformation.legalManufacturer = productInformation.legalManufacturer;
        updateProductInformation.siteResponsible = productInformation.siteResponsible;
        updateProductInformation.gtin = productInformation.gtin;
        updateProductInformation.ceApproved = productInformation.ceApproved;
        updateProductInformation.commercializationCoverage = productInformation.commercializationCoverage;
        updateProductInformation.originAnimalHuman = productInformation.originAnimalHuman;
        return updateProductInformation;
    },
    getTodaysDate: function(){
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0');
        var yyyy = today.getFullYear();
        today = mm + '/' + dd + '/' + yyyy;
        return today;
    }, 
    formatHeader: function(productInformation){
        let header = ["Item Number","Description","Range","Type","Make Or Buy","Trade Type","Manufacturer","Site Responsible","GTIN","CE Approved","Coverage","Origin"];
        return header;
    }, 
    buildFileName: function(productItemNumber){
        var today = this.getTodaysDate();
        return productItemNumber + '-' + today + '.pdf';
    },
    buildJsAutoTable: function(header, body){
        var doc =  new jsPDF('l', 'in',[11,14]);
        doc.autoTable({
            head: [header],
            body: body,
            bodyStyles:{fontSize:8},
            headStyles:{fontSize:8},
          })
        return doc;
    }
})