output "sp_client_secret" {
  value     = azuread_service_principal_password.sp_client_secret.value
  sensitive = true
}
