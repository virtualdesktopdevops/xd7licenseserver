#Class installing and configuring Microsoft RDS license server required for Citrix XenApp deployment
class xd7licenseserver::rdslicensing inherits xd7licenseserver {
  if (($xd7licenseserver::rdslicensing != '') and ($xd7licenseserver::rdslicensing == 'install')) {
    #Needed for ActiveDirectory remote management using Powershell
    dsc_windowsfeature{ 'RSAT-AD-Powershell':
      dsc_ensure => 'Present',
      dsc_name   => 'RSAT-AD-Powershell'
    }

    #Install RDS licensing features (required for server based applications publication)
    dsc_windowsfeature{'RDSLicensing':
      dsc_ensure => 'Present',
      dsc_name   => 'RDS-Licensing',
    }

  ->dsc_windowsfeature{'RDSLicensingUI':
      dsc_ensure => 'Present',
      dsc_name   => 'RDS-Licensing-UI',
    }

    #Add computer in Terminal Server License Servers group in Active Directory
  ->dsc_xadgroup{ 'TerminalServerLicenseServers':
      dsc_groupname            => 'Terminal Server License Servers',
      dsc_path                 => 'CN=Builtin,DC=domain-test,DC=com',
      dsc_groupscope           => 'DomainLocal',
      dsc_memberstoinclude     => "${facts['hostname']}\$",
      dsc_ensure               => 'present',
      dsc_psdscrunascredential => {'user' => $xd7licenseserver::setup_svc_username, 'password' => $xd7licenseserver::setup_svc_password}
    }
  }

  #if (($xd7licenseserver::rdslicensing != '') and
  #($xd7licenseserver::rdslicensing == 'existing') and
  #($xd7licenseserver::rdslicenseserverorgroup != '')) {
    #Add computer in Terminal Server License Servers group in Active Directory
    #dsc_xadgroup{ 'TerminalServerLicenseServers':
    # dsc_groupname => 'Terminal Server License Servers',
    # dsc_path => "CN=Builtin,DC=domain-test,DC=com",
    # dsc_groupscope => 'DomainLocal',
    # dsc_memberstoinclude => $hostname,
    # dsc_ensure => 'present',
    # dsc_psdscrunascredential => {'user' => $setup_svc_username, 'password' => $setup_svc_password}
    #}
  #}

}
