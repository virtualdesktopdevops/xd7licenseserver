# xd7licenseserver #

This xd7licenseserver module installs and configures the Ctrix licensing server and the Microsoft RDS license server required for server based applications publishing (XenApp).

## Requirements ##
The minimum Windows Management Framework (PowerShell) version required is 5.0 or higher, which ships with Windows 10 or Windows Server 2016, but can also be installed on Windows 7 SP1, Windows 8.1, Windows Server 2008 R2 SP1, Windows Server 2012 and Windows Server 2012 R2.

This module requires a custom version of the puppetlabs-dsc module compiled with [XenDesktop7](https://github.com/VirtualEngine/XenDesktop7) Powershell DSC resource as a dependency. Ready to use virtualdesktopdevops/dsc v1.5.0 puppet module provided on [Puppet Forge](https://forge.puppet.com/virtualdesktopdevops/dsc).

## Change log ##
A full list of changes in each version can be found in the [change log](CHANGELOG.md).

## Integration informations ##
The license file provided to this module is automatically installed on the Citrix Licensing server. Citrix XenApp/XenDesktop Product Edition is configured in xd7deliverycontrollercontroller class during XenDesktop 7.x site creation.

The Microsoft RDS license server has to be manually activated with the method of your choice (automatic, phone, ...). t is automatically registered in the "Terminal Server License Servers" group in Active Directory.

The following options are available for a production-grade installation :
- Security : IIS SSL configuration to secure communications between Director and the client device.

## Usage ##
### xd7licenseserver parameters ###

- **`[String]` setup_svc_username** _(Required)_: Privileged account used by Puppet for installing the software.
- **`[String]` setup_svc_password** _(Required)_: Password of the privileged account. Should be encrypted with hiera-eyaml.
- **`[String]` sourcepath** : (string) Path of a folder containing the Xendesktop 7.x installer (unarchive the ISO image in this folder).
- **`[String]` licensefilepath** : (string) Path of a Citrix XenApp/XenDesktop license file.
- **`[String]` rdslicensing** _(Optional, `['install'|'existing'|'none']`. Default is 'install')_: Specify RDS licensing configuration option 'install' to install RDS licensing on the same server than Citrix Licensing server, 'existing' to use an existing RDS licensing or RDS licensing in another Active Directory domain, 'none' to skip RDS licensing installation
- **https** _(Optional, default is false)_: Deploy SSL certificate on IIS and activate SSL access to Storefront ? Default : false
- **`[String]` sslcertificatesourcepath** _(Required if https = true)_: Location of the SSL public certificate file(.PEM or .CRT file WITHOUT private key). Can be local folder, UNC path, HTTP URL)
- **`[String]` sslcertificatekeysourcepath** _(Required if https = true)_: Location of the SSL certificate private key file (.KEY file. Can be local folder, UNC path, HTTP URL)

### xd7licenseserver example code ###
~~~puppet

~~~
