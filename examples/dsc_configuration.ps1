Configuration Default {

    Import-DscResource -ModuleName PackageManagementProviderResource
    Node localhost {
        PackageManagementSource PSGallery #This fails
        {
            Ensure      = 'Present'
            Name        = 'PSGallery'
            ProviderName= 'PowerShellGet'
            SourceUri   = 'https://www.powershellgallery.com/api/v2/'
            InstallationPolicy = 'Trusted'
        }
    }
}