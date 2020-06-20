/**
 * Created by venkata.sabbella on 6/19/20.
 */

public with sharing class IsodeLoad {

    public static void autoFollowProducts(){
        Map <Schema.SObjectType,SObjectDataLoader.SerializeConfig> strategyBySObjectType = new Map <Schema.SObjectType,SObjectDataLoader.SerializeConfig>();
        Map<String,List<String>> childRelationshipBlackListMap = new Map<String,List<String>>();
        childRelationshipBlackListMap.put('Product2',new List<String>{
            'ContentDocumentLink',
             'ContentDocument', 'ContentVersion', 'ContentWorkspace', 'Pricebook2', 'DMAPP__AM_Solution__c',
            'Apttus_Config2__Incentive__c',
            'Apttus_Config2__IncentiveGroup__c','Apttus__APTS_Agreement__c','PricebookEntry'
        });

        Id idToSerialize = '01t1B00000704JX';
        Schema.SObjectType sObjectType = idToSerialize.getSObjectType();
        if(strategyBySObjectType.get(sObjectType)==null)
        {
            SObjectDataLoader.SerializeConfig config = new SObjectDataLoader.SerializeConfig().addToUserChildRelationShipBlackList(childRelationshipBlackListMap);
            //config.maxLookupDepth(20);
            //config.maxChildDepth(20);
            strategyBySObjectType.put(sObjectType,config.auto(idToSerialize.getSObjectType()));
        }
        String jsonString = SObjectDataLoader.serialize(new Set<Id>{idToSerialize}, strategyBySObjectType);
        System.debug(LoggingLevel.ERROR,jsonString);

    }

    public static void manualFollowProducts(){
        Map<String,List<String>> childRelationshipBlackListMap = new Map<String,List<String>>();
        childRelationshipBlackListMap.put('Product2',new List<String>{'ContentDocumentLink',
                                                                      'ContentDocument',
                                                                       'Apttus__APTS_Agreement__c'
        });
        set<Id> productIdSet = new set<Id>{'01t1B00000704JX'};
        String serializedData = SObjectDataLoader.serialize(productIdSet,
            new SObjectDataLoader.SerializeConfig()
                //.maxLookupDepth(4)
                //.maxChildDepth(4)
                //.addToUserChildRelationShipBlackList(childRelationshipBlackListMap)
                //.auto(Product2.SObjectType)
                .followChild(Apttus_Config2__PriceListItem__c.Apttus_Config2__ProductId__c)
                  .followChild(	Apttus_Config2__PriceMatrix__c.Apttus_Config2__PriceListItemId__c)
                    .followChild(Apttus_Config2__PriceMatrixEntry__c.Apttus_Config2__PriceMatrixId__c)
                      .followChild(	Apttus_Config2__RelatedLineItem__c.Apttus_Config2__PriceMatrixEntryId__c)
                  .followChild(	Apttus_Config2__PriceEscalator__c.Apttus_Config2__PriceListItemId__c)


                .followChild(Apttus_Config2__ProductGroupMember__c.Apttus_Config2__ProductId__c) // Serialize any related OpportunityLineItem's (children)
                .followChild(Apttus_Config2__ProductClassification__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__ProductOptionComponent__c.Apttus_Config2__ParentProductId__c)
                .followChild(	Apttus_Config2__ProductOptionGroup__c.Apttus_Config2__ProductId__c)
                .followChild(		Apttus_Config2__ProductOptionComponent__c.Apttus_Config2__ComponentProductId__c)

                .followChild(Apttus_Config2__ProductHierarchyView__c.Apttus_Config2__ChildProductId__c)

                .followChild(Apttus_Config2__AgreementPriceRule__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__AgreementPriceRule__c.Apttus_Config2__BundleProductId__c)
                .followChild(Apttus_Config2__ProductAttributeGroupMember__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__ProductAttributeRuleView__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__RelatedProduct__c.Apttus_Config2__RelatedProductId__c)

                .followChild(Apttus_Config2__ConstraintRuleAction__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__ConstraintRuleCondition__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__ProductConstraintEntry__c.Apttus_Config2__ExcludeProductId__c)
                .followChild(	Apttus_Config2__ProductDefaultValue__c.Apttus_Config2__IncludeProductId__c)

                .followChild(Apttus_Config2__CostItem__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__CustomerPOItem__c.Apttus_Config2__ProductId__c)

                .followChild(	Apttus_Config2__FieldExpression__c.Apttus_Config2__ProductId__c)

                .followChild(	Apttus_Config2__FrequencyConversionRate__c.Apttus_Config2__ProductId__c)


                .followChild(	Apttus_Config2__PriceBreakup__c.Apttus_Config2__RelatedProductId__c)
                .followChild(	Apttus_Config2__ProductAttributeMatrixView__c.Apttus_Config2__ProductId__c)
                .followChild(	Apttus_Config2__ProductConstraint__c.Apttus_Config2__ProductId__c)
                .followChild(	Apttus_Config2__ProductConstraintView__c.Apttus_Config2__ProductId__c)
                .followChild(Apttus_Config2__ProductDefaultRule__c.Apttus_Config2__ProductId__c)
                .followChild(	Apttus_Config2__ProductFeature__c.Apttus_Config2__ProductId__c)
                .followChild(		Apttus_Config2__ProductFeatureValue__c.Apttus_Config2__ProductId__c)
                //.followChild(		Apttus_Config2__ProductFeatureValue__c.Apttus_Config2__ProductId__c)
                .followChild(	Apttus_Config2__ProductGroupMember__c.Apttus_Config2__ProductId__c)
                //.followChild(	Apttus_Config2__ProductHierarchyView__c.Apttus_Config2__ChildProductId__c)
                .followChild(		Apttus_Config2__ProductInformation__c.Apttus_Config2__ProductId__c)
                .followChild(	Apttus_Config2__ProductConstraintEntry__c.Apttus_Config2__RelatedProductId__c)
                .followChild(	Apttus_Config2__RelatedPriceListItem__c.Apttus_Config2__RelatedProductId__c)
                .followChild(		Apttus_Config2__RelatedProduct__c.Apttus_Config2__ProductId__c)
                .followChild(	Apttus_Config2__SearchAttributeValue__c.Apttus_Config2__BaseProductId__c)
                .followChild(	Apttus_Config2__ProductConstraintEntry__c.Apttus_Config2__SelectedProduct1Id__c)
                .followChild(	Apttus_Config2__ProductConstraintEntry__c.Apttus_Config2__SelectedProduct2Id__c)
                .followChild(	Apttus_Config2__ProductConstraintEntry__c.Apttus_Config2__SelectedProduct3Id__c)
                .followChild(	Apttus_Config2__BundleComponentView__c.Apttus_Config2__BundleProductId__c)
                .followChild(	Apttus_QPConfig__ProposalSummary__c.Apttus_QPConfig__BaseProductId__c)




                //.follow(OpportunityLineItem.PricebookEntryId).   // Serialize any related PricebookEntry's
                //follow(PricebookEntry.Product2Id).          // Serialize any related Products's
                //omit(OpportunityLineItem.UnitPrice)
            );       // Do not serialize the UnitPrice, as TotalPrice is enough and both cannot exist together


        System.debug(LoggingLevel.ERROR,serializedData);
    }
    public static void manualfollowAccount(){
        set<Id> AccountIdSet = new set<Id>{'0011b00000qxo4XAAQ'};
        String serializedData = SObjectDataLoader.serialize(AccountIdSet,
            new SObjectDataLoader.SerializeConfig()
                //.maxLookupDepth(4)
                //.maxChildDepth(4)
                .followChild(Opportunity.AccountId)
                .followChild(Contact.AccountId)
                .followChild(Apttus_Proposal__Proposal__c.Apttus_Proposal__Opportunity__c)
                .followChild(Apttus_Proposal__Proposal_Line_Item__c.Apttus_Proposal__Proposal__c)

        );       // Do not serialize the UnitPrice, as TotalPrice is enough and both cannot exist together


        System.debug(LoggingLevel.DEBUG,serializedData);
    }

    public static void loadTODev(){
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'datajson' LIMIT 1];
        String body = sr.Body.toString();

        List<String> regexStrList = new List<String>{
            jsonRegexBuilder.getRegex('"APTS_CustomBundle_Flag__c"',jsonRegexBuilder.jsontype.booleanvalue)
            ,jsonRegexBuilder.getRegex('"APTS_Quote_Identifier__c"',jsonRegexBuilder.jsontype.booleanvalue)
            ,jsonRegexBuilder.getRegex('"APTS_Scout_CustomBundle_Waiver__c"',jsonRegexBuilder.jsontype.booleanvalue)
            ,jsonRegexBuilder.getRegex('"Scout_Uplift__c"',jsonRegexBuilder.jsontype.numbervalue)
            ,jsonRegexBuilder.getRegex('"APTS_CPI_Net__c"',jsonRegexBuilder.jsontype.numbervalue)
            ,jsonRegexBuilder.getRegex('"APTS_Delta_II_Rate__c"',jsonRegexBuilder.jsontype.numbervalue)
                                                     };

        for(String regexStr:regexStrList){
            body = regexMatchandReplace(regexStr,body);
        }

        Set<Id> recordAIds =
            SObjectDataLoader.deserialize(body);
    }

    public static void clearData(){
        Delete [Select Id,name from Apttus_Proposal__Proposal_Line_Item__c];
        Delete [Select Id,name from Apttus_Proposal__Proposal__c];
        Delete [Select Id,name from Opportunity];
        Delete [Select Id,name from Account];
    }

    public static String regexMatchandReplace(String regex, String str){
        Pattern MyPattern = Pattern.compile(regex);
        Matcher mymMatcher = MyPattern.matcher(str);
        if (mymMatcher.find())
        {
            str= mymMatcher.replaceAll('');
        }
        System.debug(LoggingLevel.ERROR, str);
        return str;
    }





    //String regex1 = '"APTS_Business_Model__c": \\".+\\",+';
    //String regex2 = '"APTS_CustomBundle_Flag__c": [true|false]+,';
    //string regex3 = '"APTS_Education_New_List_ACV__c": \\d.+';






}