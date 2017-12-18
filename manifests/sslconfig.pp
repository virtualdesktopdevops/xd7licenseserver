class xd7licenseserver::sslconfig inherits xd7licenseserver {
  if $https {
    #Download the certificate in citrix licensing repository
    dsc_file{ 'SSLCert':
      dsc_sourcepath => $sslCertificateSourcePath,
      dsc_destinationpath => '${env:ProgramFiles(x86)}\Citrix\Licensing\WebServicesForLicensing\Apache\conf\server.crt',
      dsc_type => 'File',
      notify => Service['CitrixWebServicesforLicensing']
    }
    
    #Download the certificate private key in citrix licensing repository
    dsc_file{ 'SSLkey':
      dsc_sourcepath => $sslCertificateKeySourcePath,
      dsc_destinationpath => '${env:ProgramFiles(x86)}\Citrix\Licensing\WebServicesForLicensing\Apache\conf\server.key',
      dsc_type => 'File',
      notify => Service['CitrixWebServicesforLicensing']
    }
    
  }   
}
