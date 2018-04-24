#Class configuring Cit\rix lic\ense serve\r
class xd7licenseserver::config inherits xd7licenseserver {
  #Ensure Citrix licensing service is running
  service{'CitrixWebServicesforLicensing':
    ensure => 'running',
    enable => true
  }

  #Import and install Citrix license file in Citix licensing store and notify citrix licensing service to restart it
  dsc_file{ 'CitrixLicenseFile':
    dsc_sourcepath      => $xd7licenseserver::licensefilepath,
    dsc_destinationpath => 'c:\\Program Files (x86)\\Citrix\\Licensing\\MyFiles\\citrixlicense.lic',
    dsc_type            => 'File',
    notify              => Service['CitrixWebServicesforLicensing']
  }

}
