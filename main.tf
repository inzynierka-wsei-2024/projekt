resource "azurerm_resource_group" "res-0" {
  location = "westeurope"
  name     = "p1-data-analysis"
}
resource "azurerm_data_factory" "res-1" {
  location            = "eastus"
  name                = "p1-datafactory"
  resource_group_name = "p1-data-analysis"
  identity {
    identity_ids = ["/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.ManagedIdentity/userAssignedIdentities/p1-data-analysis-mi"]
    type         = "SystemAssigned, UserAssigned"
  }
  depends_on = [
    azurerm_user_assigned_identity.res-21,
  ]
}
resource "azurerm_data_factory_data_flow" "res-2" {
  data_factory_id = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  name            = "dataFlow1"
  script_lines    = ["source(output(", "          index_id as integer,", "          result_from as string,", "          zpid as integer,", "          price as integer,", "          isFeatured as boolean,", "          longitude as double,", "          bathrooms as integer,", "          openHouse as string,", "          priceChange as string,", "          priceForHDP as integer,", "          streetAddress as string,", "          zipcode as integer,", "          lotAreaValue as double,", "          isPremierBuilder as boolean,", "          homeType as string,", "          isNonOwnerOccupied as boolean,", "          timeOnZillow as integer,", "          zestimate as integer,", "          state as string,", "          videoCount as string,", "          latitude as double,", "          livingArea as integer,", "          isShowcaseListing as boolean,", "          unit as string,", "          rentZestimate as integer,", "          isPreforeclosureAuction as boolean,", "          shouldHighlight as boolean,", "          datePriceChanged as string,", "          country as string,", "          priceReduction as string,", "          isUnmappable as boolean,", "          homeStatusForHDP as string,", "          lotAreaUnit as string,", "          taxAssessedValue as integer,", "          daysOnZillow as integer,", "          city as string,", "          homeStatus as string,", "          open_house_info as string,", "          bedrooms as integer,", "          currency as string,", "          isZillowOwned as boolean,", "          listing_sub_type as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     ignoreNoFilesFound: false,", "     enableCdc: true,", "     mode: 'read',", "     skipInitialLoad: false,", "     documentForm: 'arrayOfDocuments') ~> getNewYorkJSONs", "source(output(", "          index_id as integer,", "          result_from as string,", "          longitude as double,", "          unit as string,", "          lotAreaUnit as string,", "          priceChange as string,", "          city as string,", "          streetAddress as string,", "          homeType as string,", "          rentZestimate as integer,", "          timeOnZillow as integer,", "          isShowcaseListing as boolean,", "          bedrooms as integer,", "          zestimate as integer,", "          latitude as double,", "          isPreforeclosureAuction as boolean,", "          homeStatusForHDP as string,", "          zipcode as integer,", "          isZillowOwned as boolean,", "          daysOnZillow as integer,", "          price as integer,", "          openHouse as string,", "          country as string,", "          homeStatus as string,", "          isPremierBuilder as boolean,", "          taxAssessedValue as integer,", "          lotAreaValue as double,", "          state as string,", "          isUnmappable as boolean,", "          isNonOwnerOccupied as boolean,", "          priceForHDP as integer,", "          bathrooms as integer,", "          zpid as integer,", "          priceReduction as string,", "          isFeatured as boolean,", "          livingArea as integer,", "          listing_sub_type as string,", "          shouldHighlight as boolean,", "          open_house_info as string,", "          currency as string,", "          datePriceChanged as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     ignoreNoFilesFound: false,", "     enableCdc: true,", "     mode: 'read',", "     skipInitialLoad: false,", "     documentForm: 'arrayOfDocuments') ~> getChicagoJSONs", "source(output(", "          index_id as integer,", "          result_from as string,", "          zpid as integer,", "          price as integer,", "          isFeatured as boolean,", "          longitude as double,", "          group_type as string,", "          bathrooms as integer,", "          newConstructionType as string,", "          openHouse as string,", "          priceChange as string,", "          priceForHDP as integer,", "          streetAddress as string,", "          zipcode as integer,", "          lotAreaValue as double,", "          isPremierBuilder as boolean,", "          homeType as string,", "          isNonOwnerOccupied as boolean,", "          providerListingID as string,", "          timeOnZillow as integer,", "          zestimate as integer,", "          state as string,", "          priceSuffix as string,", "          latitude as double,", "          livingArea as integer,", "          isShowcaseListing as boolean,", "          unit as string,", "          rentZestimate as integer,", "          isPreforeclosureAuction as boolean,", "          shouldHighlight as boolean,", "          datePriceChanged as string,", "          country as string,", "          priceReduction as string,", "          isUnmappable as boolean,", "          homeStatusForHDP as string,", "          lotAreaUnit as string,", "          taxAssessedValue as integer,", "          daysOnZillow as integer,", "          city as string,", "          homeStatus as string,", "          open_house_info as string,", "          bedrooms as integer,", "          currency as string,", "          isZillowOwned as boolean,", "          listing_sub_type as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     ignoreNoFilesFound: false,", "     enableCdc: true,", "     mode: 'read',", "     skipInitialLoad: false,", "     documentForm: 'arrayOfDocuments') ~> getSanFranciscoJSONs", "source(output(", "          index_id as integer,", "          result_from as string,", "          zpid as integer,", "          price as integer,", "          isFeatured as boolean,", "          longitude as double,", "          bathrooms as integer,", "          newConstructionType as string,", "          openHouse as string,", "          priceChange as string,", "          priceForHDP as integer,", "          streetAddress as string,", "          zipcode as integer,", "          lotAreaValue as double,", "          isPremierBuilder as boolean,", "          homeType as string,", "          isNonOwnerOccupied as boolean,", "          providerListingID as string,", "          timeOnZillow as integer,", "          zestimate as integer,", "          state as string,", "          latitude as double,", "          livingArea as integer,", "          isShowcaseListing as boolean,", "          unit as string,", "          rentZestimate as integer,", "          isPreforeclosureAuction as boolean,", "          shouldHighlight as boolean,", "          datePriceChanged as string,", "          country as string,", "          priceReduction as string,", "          isUnmappable as boolean,", "          homeStatusForHDP as string,", "          lotAreaUnit as string,", "          taxAssessedValue as integer,", "          daysOnZillow as integer,", "          city as string,", "          homeStatus as string,", "          open_house_info as string,", "          bedrooms as integer,", "          currency as string,", "          isZillowOwned as boolean,", "          listing_sub_type as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     ignoreNoFilesFound: false,", "     enableCdc: true,", "     mode: 'read',", "     skipInitialLoad: false,", "     documentForm: 'arrayOfDocuments') ~> getSeattleJSONs", "mergeEverything select(mapColumn(", "          HomeTypeName = homeType,", "          CityId,", "          StateId,", "          Address = streetAddress,", "          ZipCode = zipcode,", "          LivingArea = livingArea,", "          Bedrooms = bedrooms,", "          Bathrooms = bathrooms,", "          ZillowEstimate = zestimate,", "          TaxBase = taxAssessedValue,", "          LandValuation = lotAreaValue,", "          Price = price,", "          Id = zpid", "     ),", "     skipDuplicateMapInputs: true,", "     skipDuplicateMapOutputs: true) ~> filterColumns", "filterColumns derive(TypeId = iif(HomeTypeName==\"APARTMENT\", 1, iif(HomeTypeName==\"CONDO\", 2, iif(HomeTypeName==\"MULTI_FAMILY\", 3, iif(HomeTypeName==\"SINGLE_FAMILY\", 4, iif(HomeTypeName==\"TOWNHOUSE\", 5, 6)))))) ~> setType", "getNewYorkJSONs derive(StateId = 1,", "          CityId = 1) ~> setStateAndCityForNewYork", "getChicagoJSONs derive(StateId = 3,", "          CityId = 3) ~> setStateAndCityForChicago", "setStateAndCityForNewYork, setStateAndCityForChicago, setStateAndCityForSanFrancisco, setStateAndCityForSeattle union(byName: true)~> mergeEverything", "getSanFranciscoJSONs derive(StateId = 4,", "          CityId = 4) ~> setStateAndCityForSanFrancisco", "getSeattleJSONs derive(StateId = 5,", "          CityId = 5) ~> setStateAndCityForSeattle", "setType alterRow(upsertIf(true())) ~> setUpsertRule", "setUpsertRule sink(allowSchemaDrift: true,", "     validateSchema: false,", "     input(", "          Id as integer,", "          StateId as string,", "          CityId as string,", "          TypeId as string,", "          Address as string,", "          ZipCode as string,", "          LivingArea as double,", "          Bedrooms as integer,", "          Bathrooms as integer,", "          ZillowEstimate as decimal(19,4),", "          TaxBase as decimal(19,4),", "          LandValuation as decimal(19,4),", "          Price as decimal(19,4)", "     ),", "     deletable:false,", "     insertable:false,", "     updateable:false,", "     upsertable:true,", "     keys:['Id'],", "     format: 'table',", "     skipDuplicateMapInputs: true,", "     skipDuplicateMapOutputs: true,", "     mapColumn(", "          Id,", "          StateId,", "          CityId,", "          TypeId,", "          Address,", "          ZipCode,", "          LivingArea,", "          Bedrooms,", "          Bathrooms,", "          ZillowEstimate,", "          LandValuation,", "          TaxBase,", "          Price", "     )) ~> load"]
  sink {
    name = "load"
    dataset {
      name = "SQLPropertiesTable"
    }
  }
  source {
    name = "getNewYorkJSONs"
    dataset {
      name = "newYorkJSON"
    }
  }
  source {
    name = "getChicagoJSONs"
    dataset {
      name = "chicagoJSON"
    }
  }
  source {
    name = "getSanFranciscoJSONs"
    dataset {
      name = "SanFranciscoJSON"
    }
  }
  source {
    name = "getSeattleJSONs"
    dataset {
      name = "seattleJSON"
    }
  }
  transformation {
    name = "filterColumns"
  }
  transformation {
    name = "setType"
  }
  transformation {
    name = "setStateAndCityForNewYork"
  }
  transformation {
    name = "setStateAndCityForChicago"
  }
  transformation {
    name = "mergeEverything"
  }
  transformation {
    name = "setStateAndCityForSanFrancisco"
  }
  transformation {
    name = "setStateAndCityForSeattle"
  }
  transformation {
    name = "setUpsertRule"
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_sql_server_table" "res-3" {
  data_factory_id     = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  linked_service_name = "p1datasqlserver"
  name                = "SQLPropertiesTable"
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_json" "res-4" {
  data_factory_id     = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  linked_service_name = "p1blobstorage"
  name                = "SanFranciscoJSON"
  azure_blob_storage_location {
    container = "san-francisco"
    filename  = ""
    path      = ""
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_json" "res-5" {
  data_factory_id     = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  linked_service_name = "p1blobstorage"
  name                = "chicagoJSON"
  azure_blob_storage_location {
    container = "chicago"
    filename  = ""
    path      = ""
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_json" "res-6" {
  data_factory_id     = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  linked_service_name = "p1blobstorage"
  name                = "newYorkJSON"
  azure_blob_storage_location {
    container = "new-york"
    filename  = ""
    path      = ""
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_json" "res-7" {
  data_factory_id     = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  linked_service_name = "p1blobstorage"
  name                = "seattleJSON"
  azure_blob_storage_location {
    container = "seattle"
    filename  = ""
    path      = ""
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_linked_service_azure_blob_storage" "res-8" {
  connection_string_insecure = "DefaultEndpointsProtocol=https;AccountName=p1datastore;EndpointSuffix=core.windows.net;"
  data_factory_id            = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  name                       = "p1blobstorage"
  use_managed_identity       = true
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_linked_service_sql_server" "res-9" {
  connection_string = "integrated security=False;data source=p1datasqlserver.database.windows.net;initial catalog=p1sqldatabase;user id=p1sqlserveradmin"
  data_factory_id   = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  name              = "p1datasqlserver"
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_linked_service_azure_sql_database" "res-10" {
  data_factory_id      = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  name                 = "p1sqldatabase"
  use_managed_identity = true
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_pipeline" "res-11" {
  activities_json = jsonencode([{
    dependsOn = []
    name      = "Data flow1"
    policy = {
      retry                  = 0
      retryIntervalInSeconds = 30
      secureInput            = false
      secureOutput           = false
      timeout                = "0.12:00:00"
    }
    type = "ExecuteDataFlow"
    typeProperties = {
      compute = {
        computeType = "General"
        coreCount   = 8
      }
      dataFlow = {
        datasetParameters = {
          getChicagoJSONs      = {}
          getNewYorkJSONs      = {}
          getSanFranciscoJSONs = {}
          getSeattleJSONs      = {}
          load                 = {}
        }
        parameters    = {}
        referenceName = "dataFlow1"
        type          = "DataFlowReference"
      }
      staging    = {}
      traceLevel = "Fine"
    }
    userProperties = []
  }])
  data_factory_id = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  name            = "pipeline1"
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_trigger_blob_event" "res-12" {
  blob_path_begins_with = "/chicago/blobs/"
  blob_path_ends_with   = ".json"
  data_factory_id       = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  events                = ["Microsoft.Storage.BlobCreated"]
  ignore_empty_blobs    = true
  name                  = "chicago"
  storage_account_id    = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Storage/storageAccounts/p1datastore"
  pipeline {
    name = "pipeline1"
  }
  depends_on = [
    azurerm_data_factory.res-1,
    azurerm_storage_account.res-67,
  ]
}
resource "azurerm_data_factory_trigger_blob_event" "res-13" {
  blob_path_begins_with = "/new-york/blobs/"
  blob_path_ends_with   = ".json"
  data_factory_id       = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  events                = ["Microsoft.Storage.BlobCreated", "Microsoft.Storage.BlobDeleted"]
  ignore_empty_blobs    = true
  name                  = "new-york"
  storage_account_id    = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Storage/storageAccounts/p1datastore"
  pipeline {
    name = "pipeline1"
  }
  depends_on = [
    azurerm_data_factory.res-1,
    azurerm_storage_account.res-67,
  ]
}
resource "azurerm_data_factory_trigger_blob_event" "res-14" {
  blob_path_begins_with = "/san-francisco/blobs/"
  blob_path_ends_with   = ".json"
  data_factory_id       = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  events                = ["Microsoft.Storage.BlobCreated"]
  ignore_empty_blobs    = true
  name                  = "san-fran"
  storage_account_id    = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Storage/storageAccounts/p1datastore"
  pipeline {
    name = "pipeline1"
  }
  depends_on = [
    azurerm_data_factory.res-1,
    azurerm_storage_account.res-67,
  ]
}
resource "azurerm_data_factory_trigger_blob_event" "res-15" {
  blob_path_begins_with = "/seattle/blobs/"
  blob_path_ends_with   = ".json"
  data_factory_id       = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.DataFactory/factories/p1-datafactory"
  events                = ["Microsoft.Storage.BlobCreated"]
  ignore_empty_blobs    = true
  name                  = "seattle"
  storage_account_id    = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Storage/storageAccounts/p1datastore"
  pipeline {
    name = "pipeline1"
  }
  depends_on = [
    azurerm_data_factory.res-1,
    azurerm_storage_account.res-67,
  ]
}
resource "azurerm_eventgrid_system_topic" "res-16" {
  location               = "westeurope"
  name                   = "p1datastore-14e9bbc1-b07a-4eaa-b850-e07b4f0f888c"
  resource_group_name    = "p1-data-analysis"
  source_arm_resource_id = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/microsoft.storage/storageaccounts/p1datastore"
  topic_type             = "microsoft.storage.storageaccounts"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_eventgrid_system_topic_event_subscription" "res-17" {
  name                = "1197beac-2e32-062b-3669-ba7ae2ddbf96"
  resource_group_name = "p1-data-analysis"
  system_topic        = "p1datastore-14e9bbc1-b07a-4eaa-b850-e07b4f0f888c"
  advanced_filter {
    number_greater_than {
      key   = "data.contentLength"
      value = 0
    }
    string_in {
      key    = "data.api"
      values = ["CopyBlob", "PutBlob", "PutBlockList", "FlushWithClose", "DeleteBlob", "CreateFile", "DeleteFile"]
    }
  }
  subject_filter {
    subject_begins_with = "/blobServices/default/containers/new-york/blobs/"
    subject_ends_with   = ".json"
  }
  webhook_endpoint {
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
    url                               = "https://pmeastus.svc.datafactory.azure.com:4443/triggerevent/BlobEventsTrigger/new-york?resourceName=1197beac-2e32-062b-3669-ba7ae2ddbf96&subscriptionId=b8f28090-9e18-4ad7-b2f1-18585dd7fc5b&resourceGroup=p1-data-analysis&dataFactoryName=p1-datafactory&dataFactoryId=08f79e25-33c1-4fc3-8e82-744e8ffb2da9&tenantId=b7ed644a-d1b3-4946-85f9-30a3380c2618&customerTenant=b7ed644a-d1b3-4946-85f9-30a3380c2618&dataFactoryVersion=2018-06-01"
  }
  depends_on = [
    azurerm_eventgrid_system_topic.res-16,
  ]
}
resource "azurerm_eventgrid_system_topic_event_subscription" "res-18" {
  name                = "c57959fa-629f-0f47-692b-54315ff9efa7"
  resource_group_name = "p1-data-analysis"
  system_topic        = "p1datastore-14e9bbc1-b07a-4eaa-b850-e07b4f0f888c"
  advanced_filter {
    number_greater_than {
      key   = "data.contentLength"
      value = 0
    }
    string_in {
      key    = "data.api"
      values = ["CopyBlob", "PutBlob", "PutBlockList", "FlushWithClose", "DeleteBlob", "CreateFile", "DeleteFile"]
    }
  }
  subject_filter {
    subject_begins_with = "/blobServices/default/containers/seattle/blobs/"
    subject_ends_with   = ".json"
  }
  webhook_endpoint {
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
    url                               = "https://pmeastus.svc.datafactory.azure.com:4443/triggerevent/BlobEventsTrigger/seattle?resourceName=c57959fa-629f-0f47-692b-54315ff9efa7&subscriptionId=b8f28090-9e18-4ad7-b2f1-18585dd7fc5b&resourceGroup=p1-data-analysis&dataFactoryName=p1-datafactory&dataFactoryId=08f79e25-33c1-4fc3-8e82-744e8ffb2da9&tenantId=b7ed644a-d1b3-4946-85f9-30a3380c2618&customerTenant=b7ed644a-d1b3-4946-85f9-30a3380c2618&dataFactoryVersion=2018-06-01"
  }
  depends_on = [
    azurerm_eventgrid_system_topic.res-16,
  ]
}
resource "azurerm_eventgrid_system_topic_event_subscription" "res-19" {
  name                = "d4889400-ff45-cae3-da57-d09196ad9766"
  resource_group_name = "p1-data-analysis"
  system_topic        = "p1datastore-14e9bbc1-b07a-4eaa-b850-e07b4f0f888c"
  advanced_filter {
    number_greater_than {
      key   = "data.contentLength"
      value = 0
    }
    string_in {
      key    = "data.api"
      values = ["CopyBlob", "PutBlob", "PutBlockList", "FlushWithClose", "DeleteBlob", "CreateFile", "DeleteFile"]
    }
  }
  subject_filter {
    subject_begins_with = "/blobServices/default/containers/chicago/blobs/"
    subject_ends_with   = ".json"
  }
  webhook_endpoint {
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
    url                               = "https://pmeastus.svc.datafactory.azure.com:4443/triggerevent/BlobEventsTrigger/chicago?resourceName=d4889400-ff45-cae3-da57-d09196ad9766&subscriptionId=b8f28090-9e18-4ad7-b2f1-18585dd7fc5b&resourceGroup=p1-data-analysis&dataFactoryName=p1-datafactory&dataFactoryId=08f79e25-33c1-4fc3-8e82-744e8ffb2da9&tenantId=b7ed644a-d1b3-4946-85f9-30a3380c2618&customerTenant=b7ed644a-d1b3-4946-85f9-30a3380c2618&dataFactoryVersion=2018-06-01"
  }
  depends_on = [
    azurerm_eventgrid_system_topic.res-16,
  ]
}
resource "azurerm_eventgrid_system_topic_event_subscription" "res-20" {
  name                = "f3e9ccb9-17a0-23c2-5994-0f13a8db523d"
  resource_group_name = "p1-data-analysis"
  system_topic        = "p1datastore-14e9bbc1-b07a-4eaa-b850-e07b4f0f888c"
  advanced_filter {
    number_greater_than {
      key   = "data.contentLength"
      value = 0
    }
    string_in {
      key    = "data.api"
      values = ["CopyBlob", "PutBlob", "PutBlockList", "FlushWithClose", "DeleteBlob", "CreateFile", "DeleteFile"]
    }
  }
  subject_filter {
    subject_begins_with = "/blobServices/default/containers/san-francisco/blobs/"
    subject_ends_with   = ".json"
  }
  webhook_endpoint {
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
    url                               = "https://pmeastus.svc.datafactory.azure.com:4443/triggerevent/BlobEventsTrigger/san-fran?resourceName=f3e9ccb9-17a0-23c2-5994-0f13a8db523d&subscriptionId=b8f28090-9e18-4ad7-b2f1-18585dd7fc5b&resourceGroup=p1-data-analysis&dataFactoryName=p1-datafactory&dataFactoryId=08f79e25-33c1-4fc3-8e82-744e8ffb2da9&tenantId=b7ed644a-d1b3-4946-85f9-30a3380c2618&customerTenant=b7ed644a-d1b3-4946-85f9-30a3380c2618&dataFactoryVersion=2018-06-01"
  }
  depends_on = [
    azurerm_eventgrid_system_topic.res-16,
  ]
}
resource "azurerm_user_assigned_identity" "res-21" {
  location            = "eastus"
  name                = "p1-data-analysis-mi"
  resource_group_name = "p1-data-analysis"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_mssql_server" "res-22" {
  administrator_login = "p1sqlserveradmin"
  location            = "northeurope"
  name                = "p1datasqlserver"
  resource_group_name = "p1-data-analysis"
  version             = "12.0"
  azuread_administrator {
    login_username = "p1-data-analysis-mi"
    object_id      = "fcec1e34-964a-416b-83a6-5f1a1a797f0b"
  }
  identity {
    identity_ids = ["/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.ManagedIdentity/userAssignedIdentities/p1-data-analysis-mi"]
    type         = "SystemAssigned, UserAssigned"
  }
  depends_on = [
    azurerm_user_assigned_identity.res-21,
  ]
}
resource "azurerm_sql_active_directory_administrator" "res-23" {
  login               = "p1-data-analysis-mi"
  object_id           = "fcec1e34-964a-416b-83a6-5f1a1a797f0b"
  resource_group_name = "p1-data-analysis"
  server_name         = "p1datasqlserver"
  tenant_id           = "b7ed644a-d1b3-4946-85f9-30a3380c2618"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-37" {
  database_id            = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver/databases/master"
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database" "res-43" {
  name                 = "p1sqldatabase"
  server_id            = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  storage_account_type = "Local"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-49" {
  database_id            = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver/databases/p1sqldatabase"
  enabled                = false
  log_monitoring_enabled = false
  depends_on = [
    azurerm_mssql_database.res-43,
  ]
}
resource "azurerm_mssql_server_microsoft_support_auditing_policy" "res-55" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_server_transparent_data_encryption" "res-56" {
  server_id = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_server_extended_auditing_policy" "res-57" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_firewall_rule" "res-58" {
  end_ip_address   = "0.0.0.0"
  name             = "AllowAllWindowsAzureIps"
  server_id        = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  start_ip_address = "0.0.0.0"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_firewall_rule" "res-59" {
  end_ip_address   = "83.27.47.75"
  name             = "ClientIPAddress_2024-06-18_07:47:02"
  server_id        = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  start_ip_address = "83.27.47.75"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_firewall_rule" "res-60" {
  end_ip_address   = "104.151.2.142"
  name             = "ClientIPAddress_2024-06-28_09:57:47"
  server_id        = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  start_ip_address = "104.151.2.142"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_firewall_rule" "res-61" {
  end_ip_address   = "80.49.224.213"
  name             = "ClientIPAddress_2024-07-12_04:53:34"
  server_id        = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  start_ip_address = "80.49.224.213"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_firewall_rule" "res-62" {
  end_ip_address   = "78.10.224.227"
  name             = "ClientIPAddress_2024-6-18_21-45-49"
  server_id        = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver"
  start_ip_address = "78.10.224.227"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_server_security_alert_policy" "res-64" {
  resource_group_name = "p1-data-analysis"
  server_name         = "p1datasqlserver"
  state               = "Disabled"
  depends_on = [
    azurerm_mssql_server.res-22,
  ]
}
resource "azurerm_mssql_server_vulnerability_assessment" "res-66" {
  server_security_alert_policy_id = "/subscriptions/b8f28090-9e18-4ad7-b2f1-18585dd7fc5b/resourceGroups/p1-data-analysis/providers/Microsoft.Sql/servers/p1datasqlserver/securityAlertPolicies/Default"
  storage_container_path          = ""
  depends_on = [
    azurerm_mssql_server_security_alert_policy.res-64,
  ]
}
resource "azurerm_storage_account" "res-67" {
  account_replication_type         = "LRS"
  account_tier                     = "Standard"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  location                         = "westeurope"
  name                             = "p1datastore"
  resource_group_name              = "p1-data-analysis"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_storage_container" "res-69" {
  name                 = "chicago"
  storage_account_name = "p1datastore"
}
resource "azurerm_storage_container" "res-70" {
  name                 = "inputs"
  storage_account_name = "p1datastore"
}
resource "azurerm_storage_container" "res-71" {
  name                 = "new-york"
  storage_account_name = "p1datastore"
}
resource "azurerm_storage_container" "res-72" {
  name                 = "san-francisco"
  storage_account_name = "p1datastore"
}
resource "azurerm_storage_container" "res-73" {
  name                 = "seattle"
  storage_account_name = "p1datastore"
}
