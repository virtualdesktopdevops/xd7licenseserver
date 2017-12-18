class xd7licenseserver::install inherits xd7licenseserver {
  
	reboot { 'after_run':
	 apply => immediately,
	 when => refreshed
	}
	
	#Install Citrix licensing server.
	#DSC Test function returning always false on non-english Windows Server OS
	dsc_xd7feature { 'XD7Licensing':
	 dsc_role => 'Licensing',
	 dsc_sourcepath => $sourcePath,
	 dsc_ensure => 'present',
	 #notify => Reboot['after_run']
	}
	  
}
