#Class installing and configuring Microsoft RDS license server required for Citrix XenApp deployment
class xd7licenseserver::rdslicensing inherits xd7licenseserver {
  #Needed for ActiveDirectory remote management using Powershell
  dsc_windowsfeature{ 'RSAT-AD-Powershell':
    dsc_ensure => 'Present',
    dsc_name   => 'RSAT-AD-Powershell'
  }

  if (($xd7licenseserver::rdslicensing != '') and ($xd7licenseserver::rdslicensing == 'install')) {
    #Install RDS licensing features (required for server based applications publication)
    dsc_windowsfeature{'RDSLicensing':
      dsc_ensure => 'Present',
      dsc_name   => 'RDS-Licensing'
    }

  ->dsc_windowsfeature{'RDSLicensingUI':
      dsc_ensure => 'Present',
      dsc_name   => 'RDS-Licensing-UI'
    }

    #Add computer in Terminal Server License Servers group in Active Directory
  ->dsc_xadgroup{ 'TerminalServerLicenseServers':
      dsc_groupname            => 'Terminal Server License Servers',
      dsc_groupscope           => 'DomainLocal',
      dsc_memberstoinclude     => "${facts['hostname']}\$",
      dsc_ensure               => 'present',
      dsc_psdscrunascredential => {'user' => $xd7licenseserver::setup_svc_username, 'password' => $xd7licenseserver::setup_svc_password}
    }
  }

  if (($xd7licenseserver::rdslicensing != '') and
  ($xd7licenseserver::rdslicensing == 'existing') and
  ($xd7licenseserver::existingrdslicenseserver != '')) {
    #Add computer in Terminal Server License Servers group in Active Directory
    dsc_xadgroup{ 'TerminalServerLicenseServers':
      dsc_groupname            => 'Terminal Server License Servers',
      dsc_groupscope          => 'DomainLocal',
      dsc_memberstoinclude     => "${xd7licenseserver::existingrdslicenseserver}\$",
      dsc_ensure               => 'present',
      dsc_psdscrunascredential => {'user' => $xd7licenseserver::setup_svc_username, 'password' => $xd7licenseserver::setup_svc_password}
    }
  }

}
