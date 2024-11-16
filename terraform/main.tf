resource "azurerm_resource_group" "res-0" {
  location = "polandcentral"
  name     = "japan-real-estate"
}
resource "azurerm_data_factory" "res-1" {
  location            = "polandcentral"
  name                = "japan-datafactory"
  resource_group_name = "japan-real-estate"
  identity {
    type = "SystemAssigned"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_data_factory_data_flow" "res-2" {
  data_factory_id = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  name            = "japanAddNewValuesToParentTable"
  script_lines    = ["parameters{", "     transactionsTableColumnName as string,", "     parentTableDataColumnName as string", "}", "source(output(", "          No as integer,", "          Type as string,", "          Region as string,", "          MunicipalityCode as integer,", "          Prefecture as string,", "          Municipality as string,", "          DistrictName as string,", "          NearestStation as string,", "          TimeToNearestStation as string,", "          MinTimeToNearestStation as integer,", "          MaxTimeToNearestStation as integer,", "          TradePrice as integer,", "          FloorPlan as string,", "          Area as integer,", "          AreaIsGreaterFlag as integer,", "          UnitPrice as integer,", "          PricePerTsubo as integer,", "          LandShape as string,", "          Frontage as double,", "          FrontageIsGreaterFlag as boolean,", "          TotalFloorArea as integer,", "          TotalFloorAreaIsGreaterFlag as integer,", "          BuildingYear as integer,", "          PrewarBuilding as integer,", "          Structure as string,", "          Use as string,", "          Purpose as string,", "          Direction as string,", "          Classification as string,", "          Breadth as double,", "          CityPlanning as string,", "          CoverageRatio as integer,", "          FloorAreaRatio as integer,", "          Period as string,", "          Year as integer,", "          Quarter as integer,", "          Renovation as string,", "          Remarks as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     ignoreNoFilesFound: false,", "     documentForm: 'arrayOfDocuments') ~> getToyamaPrefecture", "source(output(", "          ID as integer,", "          Type as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     isolationLevel: 'READ_UNCOMMITTED',", "     format: 'table') ~> getExistingRealEstateTypes", "getToyamaPrefecture select(mapColumn(", "          No,", "          RealEstateType = Type,", "          Region,", "          Prefecture,", "          City = Municipality,", "          District = DistrictName,", "          NearestStation,", "          FloorPlan,", "          FrontageRoadType = Classification,", "          FrontageRoadDirection = Direction,", "          LandShape,", "          Structure,", "          CurrentUsage = Use,", "          PostTransactionUsage = Purpose,", "          PlanningType = CityPlanning", "     ),", "     skipDuplicateMapInputs: true,", "     skipDuplicateMapOutputs: true) ~> filterColumns", "filterColumns, getExistingRealEstateTypes lookup($transactionsTableColumnName == $parentTableDataColumnName,", "     multiple: true,", "     broadcast: 'right')~> joinExisting", "joinExisting filter(isNull(ID)) ~> filterNulls", "filterNulls aggregate(groupBy(dataName = $transactionsTableColumnName),", "     helper = count($transactionsTableColumnName)) ~> aggregateResults", "aggregateResults sink(allowSchemaDrift: true,", "     validateSchema: false,", "     input(", "          ID as integer,", "          Type as string", "     ),", "     deletable:false,", "     insertable:true,", "     updateable:false,", "     upsertable:false,", "     format: 'table',", "     skipDuplicateMapInputs: true,", "     skipDuplicateMapOutputs: true,", "     mapColumn(", "          each(patternMatch(`dataName`),", "               $parentTableDataColumnName = $$)", "     )) ~> load"]
  sink {
    name = "load"
    dataset {
      name = "RealEstateTypesTable"
    }
  }
  source {
    name = "getToyamaPrefecture"
    dataset {
      name = "toyama_blob"
    }
  }
  source {
    name = "getExistingRealEstateTypes"
    dataset {
      name = "RealEstateTypesTable"
    }
  }
  transformation {
    name = "filterColumns"
  }
  transformation {
    name = "joinExisting"
  }
  transformation {
    name = "filterNulls"
  }
  transformation {
    name = "aggregateResults"
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_data_flow" "res-3" {
  data_factory_id = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  name            = "japanDataflow"
  script_lines    = ["source(output(", "          No as integer,", "          Type as string,", "          Region as string,", "          MunicipalityCode as integer,", "          Prefecture as string,", "          Municipality as string,", "          DistrictName as string,", "          NearestStation as string,", "          TimeToNearestStation as string,", "          MinTimeToNearestStation as integer,", "          MaxTimeToNearestStation as integer,", "          TradePrice as integer,", "          FloorPlan as string,", "          Area as integer,", "          AreaIsGreaterFlag as integer,", "          UnitPrice as integer,", "          PricePerTsubo as integer,", "          LandShape as string,", "          Frontage as double,", "          FrontageIsGreaterFlag as boolean,", "          TotalFloorArea as integer,", "          TotalFloorAreaIsGreaterFlag as integer,", "          BuildingYear as integer,", "          PrewarBuilding as integer,", "          Structure as string,", "          Use as string,", "          Purpose as string,", "          Direction as string,", "          Classification as string,", "          Breadth as double,", "          CityPlanning as string,", "          CoverageRatio as integer,", "          FloorAreaRatio as integer,", "          Period as string,", "          Year as integer,", "          Quarter as integer,", "          Renovation as string,", "          Remarks as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     ignoreNoFilesFound: false,", "     documentForm: 'arrayOfDocuments') ~> getToyamaPrefecture", "source(output(", "          ID as integer,", "          Type as string", "     ),", "     allowSchemaDrift: true,", "     validateSchema: false,", "     isolationLevel: 'READ_UNCOMMITTED',", "     format: 'table') ~> getExistingRealEstateTypes", "getToyamaPrefecture select(mapColumn(", "          No,", "          RealEstateType = Type,", "          Region,", "          Prefecture,", "          City = Municipality,", "          District = DistrictName,", "          NearestStation,", "          TimeToNearestStation,", "          MinTimeToNearestStation,", "          MaxTimeToNearestStation,", "          Price = TradePrice,", "          UnitPrice,", "          FloorPlan,", "          Area,", "          GreatArea = AreaIsGreaterFlag,", "          FloorArea = TotalFloorArea,", "          GreatFloorArea = TotalFloorAreaIsGreaterFlag,", "          Frontage,", "          GreatFrontage = FrontageIsGreaterFlag,", "          FrontRoadBreadth = Classification,", "          FrontageRoadDirection = Direction,", "          FrontageRoadBreadth = Breadth,", "          LandShape,", "          BuildingYear,", "          PrewarBuilding,", "          Structure,", "          CurrentUsage = Use,", "          PostTransactionUsage = Purpose,", "          PlanningType = CityPlanning,", "          MaximumBuildingCoverageRatio = CoverageRatio,", "          TransactionYear = Year,", "          TransactionQuarter = Quarter", "     ),", "     skipDuplicateMapInputs: true,", "     skipDuplicateMapOutputs: true) ~> filterColumns", "filterColumns, getExistingRealEstateTypes lookup(RealEstateType == Type,", "     multiple: true,", "     broadcast: 'auto')~> lookup1", "lookup1 sink(allowSchemaDrift: true,", "     validateSchema: false,", "     input(", "          Id as integer,", "          StateId as string,", "          CityId as string,", "          TypeId as string,", "          Address as string,", "          ZipCode as string,", "          LivingArea as double,", "          Bedrooms as integer,", "          Bathrooms as integer,", "          ZillowEstimate as decimal(19,4),", "          TaxBase as decimal(19,4),", "          LandValuation as decimal(19,4),", "          Price as decimal(19,4)", "     ),", "     deletable:false,", "     insertable:true,", "     updateable:false,", "     upsertable:false,", "     format: 'table',", "     skipDuplicateMapInputs: true,", "     skipDuplicateMapOutputs: true) ~> load"]
  sink {
    name = "load"
    dataset {
      name = "SQLPropertiesTable"
    }
  }
  source {
    name = "getToyamaPrefecture"
    dataset {
      name = "toyama_blob"
    }
  }
  source {
    name = "getExistingRealEstateTypes"
    dataset {
      name = "RealEstateTypesTable"
    }
  }
  transformation {
    name = "filterColumns"
  }
  transformation {
    name = "lookup1"
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_sql_server_table" "res-4" {
  data_factory_id     = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  linked_service_name = "SqlServer1"
  name                = "RealEstateTypesTable"
  parameters = {
    TableName = ""
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_sql_server_table" "res-5" {
  data_factory_id     = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  linked_service_name = "SqlServer1"
  name                = "SQLPropertiesTable"
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_dataset_json" "res-6" {
  data_factory_id     = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  linked_service_name = "AzureBlobStorage"
  name                = "toyama_blob"
  azure_blob_storage_location {
    container = "japan-toyama-prefecture"
    filename  = ""
    path      = ""
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_linked_service_azure_blob_storage" "res-7" {
  connection_string_insecure = "DefaultEndpointsProtocol=https;AccountName=japandatastorage;EndpointSuffix=core.windows.net;"
  data_factory_id            = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  name                       = "AzureBlobStorage"
  use_managed_identity       = true
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_linked_service_sql_server" "res-8" {
  data_factory_id = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  name            = "SqlServer1"
  user_name       = "japanadmin"
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_data_factory_pipeline" "res-9" {
  activities_json = jsonencode([{
    dependsOn = []
    name      = "forEachParentTable"
    type      = "ForEach"
    typeProperties = {
      activities = [{
        dependsOn = [{
          activity             = "switchSetCurrentTableName"
          dependencyConditions = ["Succeeded"]
        }]
        name = "japanAddNewValuesToParentTable"
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
              getExistingRealEstateTypes = {
                TableName = {
                  type  = "Expression"
                  value = "@variables('currentTableName')"
                }
              }
              getToyamaPrefecture = {}
              load = {
                TableName = {
                  type  = "Expression"
                  value = "@variables('currentTableName')"
                }
              }
            }
            parameters = {
              parentTableDataColumnName = {
                type  = "Expression"
                value = "'@{variables('currentParentTableDataColumnName')}'"
              }
              transactionsTableColumnName = {
                type  = "Expression"
                value = "'@{item()}'"
              }
            }
            referenceName = "japanAddNewValuesToParentTable"
            type          = "DataFlowReference"
          }
          staging    = {}
          traceLevel = "Fine"
        }
        userProperties = []
        }, {
        dependsOn = []
        name      = "switchSetCurrentTableName"
        type      = "Switch"
        typeProperties = {
          cases = [{
            activities = [{
              dependsOn = []
              name      = "setTableName1"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Cities\""
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName1"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName1"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "City"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName2"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "'Directions'"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName2"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName2"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "FrontageRoadDirection"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName3"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "'Districts'"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName3"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName3"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "District"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName4"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "'FloorPlans'"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName4"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName4"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Type\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "FloorPlan"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName5"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"FrontageRoadTypes\""
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName5"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName5"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Type\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "FrontageRoadType"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName6"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"LandShapes\""
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName6"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName6"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "LandShape"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName7"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "PlanningTypes"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName7"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName7"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Type\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "PlannigType"
            }, {
            activities = [{
              dependsOn   = []
              description = "\"Prefectures\""
              name        = "setTableName8"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Prefectures\""
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName8"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName8"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "Prefecture"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName9"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "RealEstateTypes"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName9"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName9"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Type\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "RealEstateType"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName10"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "Regions"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName10"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnaName10"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "Region"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName11"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "Stations"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName11"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName11"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "NearestStation"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName12"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "Structures"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName12"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName12"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Name\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "Structure"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName13"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"UsageTypes\""
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName13"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnName13"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Type\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "CurrentUsage"
            }, {
            activities = [{
              dependsOn = []
              name      = "setTableName14"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "UsageTypes"
                variableName = "currentTableName"
              }
              userProperties = []
              }, {
              dependsOn = [{
                activity             = "setTableName14"
                dependencyConditions = ["Succeeded"]
              }]
              name = "setColumnaName14"
              policy = {
                secureInput  = false
                secureOutput = false
              }
              type = "SetVariable"
              typeProperties = {
                value        = "\"Type\""
                variableName = "currentParentTableDataColumnName"
              }
              userProperties = []
            }]
            value = "PostTransactionUsage"
          }]
          on = {
            type  = "Expression"
            value = "@item()"
          }
        }
        userProperties = []
      }]
      items = {
        type  = "Expression"
        value = "@variables('columnsNames')"
      }
    }
    userProperties = []
  }])
  data_factory_id = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.DataFactory/factories/japan-datafactory"
  name            = "pipeline2"
  variables = {
    columnsNames                     = ""
    currentParentTableDataColumnName = "\"\""
    currentTableName                 = "\"\""
  }
  depends_on = [
    azurerm_data_factory.res-1,
  ]
}
resource "azurerm_mssql_server" "res-10" {
  administrator_login = "japanadmin"
  location            = "polandcentral"
  name                = "japandbserver"
  resource_group_name = "japan-real-estate"
  version             = "12.0"
  azuread_administrator {
    login_username = "Mikolaj.Stryczek@microsoft.wsei.edu.pl"
    object_id      = "b0ea4723-8626-4d44-8987-fbdbefc0ee71"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_sql_active_directory_administrator" "res-11" {
  login               = "Mikolaj.Stryczek@microsoft.wsei.edu.pl"
  object_id           = "b0ea4723-8626-4d44-8987-fbdbefc0ee71"
  resource_group_name = "japan-real-estate"
  server_name         = "japandbserver"
  tenant_id           = "b7ed644a-d1b3-4946-85f9-30a3380c2618"
  depends_on = [
    azurerm_mssql_server.res-10,
  ]
}
resource "azurerm_mssql_database" "res-22" {
  name                 = "japan"
  server_id            = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver"
  storage_account_type = "Local"
  depends_on = [
    azurerm_mssql_server.res-10,
  ]
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-33" {
  database_id            = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver/databases/japan"
  enabled                = false
  log_monitoring_enabled = false
  depends_on = [
    azurerm_mssql_database.res-22,
  ]
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-42" {
  database_id            = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver/databases/master"
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_server_microsoft_support_auditing_policy" "res-48" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver"
  depends_on = [
    azurerm_mssql_server.res-10,
  ]
}
resource "azurerm_mssql_server_transparent_data_encryption" "res-49" {
  server_id = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver"
  depends_on = [
    azurerm_mssql_server.res-10,
  ]
}
resource "azurerm_mssql_server_extended_auditing_policy" "res-50" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver"
  depends_on = [
    azurerm_mssql_server.res-10,
  ]
}
resource "azurerm_mssql_firewall_rule" "res-51" {
  end_ip_address   = "0.0.0.0"
  name             = "AllowAllWindowsAzureIps"
  server_id        = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver"
  start_ip_address = "0.0.0.0"
  depends_on = [
    azurerm_mssql_server.res-10,
  ]
}
resource "azurerm_mssql_server_security_alert_policy" "res-53" {
  resource_group_name = "japan-real-estate"
  server_name         = "japandbserver"
  state               = "Disabled"
  depends_on = [
    azurerm_mssql_server.res-10,
  ]
}
resource "azurerm_mssql_server_vulnerability_assessment" "res-55" {
  server_security_alert_policy_id = "/subscriptions/57f08f70-aba5-4349-b051-84b24560fd89/resourceGroups/japan-real-estate/providers/Microsoft.Sql/servers/japandbserver/securityAlertPolicies/Default"
  storage_container_path          = ""
  depends_on = [
    azurerm_mssql_server_security_alert_policy.res-53,
  ]
}
resource "azurerm_storage_account" "res-56" {
  account_replication_type         = "LRS"
  account_tier                     = "Standard"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  is_hns_enabled                   = true
  location                         = "polandcentral"
  name                             = "japandatastorage"
  resource_group_name              = "japan-real-estate"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
