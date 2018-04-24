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
  $setup_svc_username,
  $setup_svc_password,
  $sourcepath,
  $licensefilepath,
  $rdslicensing                = 'install', #Can be 'existing', 'install', 'none'
  $https                       = false,
  $sslcertificatesourcepath    = '',
  $sslcertificatekeysourcepath = '',
)  {

  contain xd7licenseserver::install
  contain xd7licenseserver::config
  contain xd7licenseserver::sslconfig
  contain xd7licenseserver::rdslicensing

  Class['::xd7licenseserver::install']
->Class['::xd7licenseserver::config']
->Class['::xd7licenseserver::sslconfig']

}
