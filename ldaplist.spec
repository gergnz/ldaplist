Summary: Uses ldap configuration to list ldap databases
Name: ldaplist
Version: 0.7
Release: 1
Group: Application/System
License: GPL
Source0: ldaplist-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
BuildArch: noarch
Prefix: %{_prefix}
Requires: /usr/bin/env python-ldap python
%description
ldaplist is similar to ldaplist on Solaris or ypmatch/ypcat.
It is written in python and utilities the ldap configuration
of the local system to connect to your ldap server and list
certain databases, like passwd, group, netgroup, etc.
%prep
%setup -q

%install
%makeinstall

%files
%defattr(-,root,root)
%doc README LICENSE
%{_bindir}/*
%{_mandir}/*/*

%changelog
* Thu Feb 10 2011 Greg Cockburn <greg@performancemagic.com>
- initial support for RHEL6 and nslcd.conf, sssd.conf
* Thu Jan 20 2011 Greg Cockburn <greg@performancemagic.com>
- moved conf file parsing to a function with extra checking.                                                                                                                                                                          
- added tls support                                                                                                                                                                                                                   
- simplified function arguments
* Mon Jan 17 2011 Greg Cockburn <greg@performancemagic.com>
- many fixes
* Thu Dec 16 2010 Greg Cockburn <greg@performancemagic.com>
- Initial release
