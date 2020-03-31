/**
 * @File Name          : ContentDocumentLinkSelector.cls
 * @Description        : 
 * @Author             : Jon Astemborski
 * @Group              : 
 * @Last Modified By   : Jon Astemborski
 * @Last Modified On   : 3/30/2020, 6:41:45 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/27/2020   Jon Astemborski     Initial Version
**/
public class ContentDocumentLinkSelector extends fflib_SObjectSelector{
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            ContentDocumentLink.Id, 
            ContentDocumentLink.ContentDocumentId,
            ContentDocumentLink.LinkedEntityId};
    }
    public Schema.SObjectType getSObjectType() {
        return ContentDocumentLink.sObjectType;
    }

    public List<ContentDocumentLink> selectByParentRecord(Set<Id> parentRecordSet) {   
        return (List<ContentDocumentLink>) Database.query(
        newQueryFactory().
        setCondition('ContentDocumentId in :parentRecordSet').
        toSOQL());
    }
}