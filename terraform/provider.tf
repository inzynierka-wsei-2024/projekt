provider "azurerm" {
  features {
  }
  subscription_id            = "b8f28090-9e18-4ad7-b2f1-18585dd7fc5b"
  environment                = "public"
  use_msi                    = false
  use_cli                    = true
  use_oidc                   = false
  skip_provider_registration = true
}
