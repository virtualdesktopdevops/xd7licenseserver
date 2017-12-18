# xd7licenseserver #

This xd7licenseserver module installs and configures the Ctrix licensing server and the Microsoft RDS license server required for server based applications publishing (XenApp).

The license file provided to this module is automatically installed on the Citrix Licensing server. Citrix XenApp/XenDesktop Product Edition is configured in xd7mastercontroller class during XenDesktop 7.x site creation.

The Microsoft RDS license server has to be manually activated with the method of your choice (automatic, phone, ...). t is automatically registered in the "Terminal Server License Servers" group in Active Directory.

The following options are available for a production-grade installation :
- Security : IIS SSL configuration to secure communications between Director and the client device.

## Usage
### xd7licenseserver
This class will install and configure the Citrix and Microsoft RDS licensing features
- **sourcePath** : (string) Path of a folder containing the Xendesktop 7.x installer (unarchive the ISO image in this folder).
- **licenseFilePath** : (string) Path of a Citrix XenApp/XenDesktop license file.
- **rdslicensing** : (String) (mandatory) Specify RDS licensing configuration option 'install' to install RDS licensing on the same server than Citrix Licensing server, 'existing' to use an existing RDS licensing or RDS licensing in other domains, 'none' to skip RDS licensing installation
- **https** : (boolean) : true or false. Deploy SSL certificate on IIS and activate SSL access to Storefront ? Default : false
- **sslCertificateSourcePath** : (string) Location of the SSL public certificate file(.PEM or .CRT file WITHOUT private key). Can be local folder, UNC path, HTTP URL)
- **sslCertificateKeySourcePath** : (string) Location of the SSL certificate private key file (.KEY file. Can be local folder, UNC path, HTTP URL)
- **caCertificateSourcePath** : (string) Location of the SSL Certification Autority root certificate (PEM or CER format). Can be local folder, UNC path, HTTP URL)
- **caCertificateThumbprint** : (string) Thumbprint of the SSL Certification Autority root certificate (available in the SSL certificate).

~~~puppet

~~~

