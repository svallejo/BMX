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
        let header = []
        var updatedProductInformation = this.rearrangeKeys(productInformation);
        updatedProductInformation.productItemNumber = "Item Number";
        updatedProductInformation.productDescription = "Description";
        updatedProductInformation.productRange = "Range";
        updatedProductInformation.productType = "Type";
        updatedProductInformation.makeOrBuy = "Make Or Buy";
        updatedProductInformation.tradeType = "Trade Type";
        updatedProductInformation.legalManufacturer = "Manufacturer";
        updatedProductInformation.siteResponsible = "Site Responsible";
        updatedProductInformation.gtin = "GTIN";
        updatedProductInformation.ceApproved = "CE Approved";
        updatedProductInformation.commercializationCoverage = "Coverage";
        updatedProductInformation.originAnimalHuman = "Origin";
        header = Object.values(updatedProductInformation);
        return header;
    }, 
    buildFileName: function(productItemNumber){
        var today = this.getTodaysDate();
        return productItemNumber + '-' + today + '.pdf';
    },
    buildJsAutoTable: function(header, body){
        var doc =  new jsPDF('l', 'pt');
        doc.autoTable({
            head: [header],
            body: body,
            bodyStyles:{fontSize:9},
            headStyles:{fontSize:9},
          })
        return doc;
    }
})