provider "azurerm" {
  features {
  }
  subscription_id            = "57f08f70-aba5-4349-b051-84b24560fd89"
  environment                = "public"
  use_msi                    = false
  use_cli                    = true
  use_oidc                   = false
  skip_provider_registration = true
}
