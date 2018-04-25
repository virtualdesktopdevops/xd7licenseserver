# Class: xd7licenseserver
#
# This module manages xd7licenseserver
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class xd7licenseserver (
  String $setup_svc_username,
  String $setup_svc_password,
  String $sourcepath,
  String $licensefilepath,
  Enum['install', 'existing', 'none'] $rdslicensing = 'install',
  Optional[String] $existingrdslicenseserver        = '',
  Optional[Boolean] $https                          = false,
  Optional[String] $sslcertificatesourcepath        = '',
  Optional[String] $sslcertificatekeysourcepath     = '',
)  {

  contain xd7licenseserver::install
  contain xd7licenseserver::config
  contain xd7licenseserver::sslconfig
  contain xd7licenseserver::rdslicensing

  Class['::xd7licenseserver::install']
->Class['::xd7licenseserver::config']
->Class['::xd7licenseserver::sslconfig']

}
