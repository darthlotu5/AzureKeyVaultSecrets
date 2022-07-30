param location string
param skuFamily string = 'A'
param skuName string = 'standard'

resource keyvault 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: 'Kv-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    accessPolicies: []
    sku: {
      family: skuFamily
      name: skuName
    }
    tenantId: subscription().tenantId
    enabledForDeployment: true
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: true
    enableSoftDelete: false
    softDeleteRetentionInDays: 90
    enablePurgeProtection: true
    publicNetworkAccess: 'enabled'
  }
}

output keyvaultName string = keyvault.name
