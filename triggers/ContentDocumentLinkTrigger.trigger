/**
 * @File Name          : ContentDocumentLinkTrigger.trigger
 * @Description        : 
 * @Author             : Jon Astemborski
 * @Group              : 
 * @Last Modified By   : Jon Astemborski
 * @Last Modified On   : 3/30/2020, 10:06:59 PM
 * @Modification Log   : 
 * Ver       Date            Author                 Modification
 * 1.0    3/30/2020   Jon Astemborski     Initial Version
**/
trigger ContentDocumentLinkTrigger on ContentDocumentLink (
    after delete, after insert, after update, after undelete, before delete, before insert, before update) {
     // Creates Domain class instance and calls appropriate methods
     fflib_SObjectDomain.triggerHandler(ContentDocumentLinkValidator.class);
  }