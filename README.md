# Purpose

Ultimate Chef all inclusive wrapper infrastructure.  Provides a great infrastructure foundation starting point. Provides wrappers for many common services. Aided an eliminating the need for writing dozens of wrapper cookbooks.

# Design
The design idea came to me one day after a couple years of repeatably writing wrapper cookbooks for several different development teams. I found the layout that was given to use was an inferior design that had numerous faults.

So, I decided to make a project that directly addressed these issues aims at simplifying stack setup and management.

I hope to help others by giving a Chef foundation that is solid, extensible and drives to dry up code.

I'm a long way from being finished. I hope that others will help me grow the project and continually improve it.

The idea is to not have to write tons of wrapper cookbooks, work with all major flavors of operating systems and to setup a stack for a development team is as simple as filling out a few JSON "configuration" files (Environment and Data Bags).

# Supported Platforms
* Linux
* Windows (WIP)

# Structure

## Roles
Roles specify the generic service of the system. This is where the run list is setup.

| Name | Packages |
| -------- | -------- |
| app | Mediawiki, Wordpress, WAR Deploy, Teamspeak3 |
| ci | Go, Jenkins, Gitlab Ci |
| database | MySQL, MsSQL, Postgres, MongoDB, Redis |
| logs  | Splunk |
| media  | Plex Server |
| monitoring  | Nagios, Sensu |
| search  | Solr, Sphinx, Elastic Search |
| security  | firewall, antivirus, Nessus |
| version_control  | Subversion, Git, Gitlab |
| web  | Apache, Nginx, Unicorn, Tomcat, IIS |

## Environments, Roles and Data Bags
Use the examples provided to model your custom configurations.


# TESTING (Kitchen)

## Supported Host Platforms
* Linux
* Windows
* Mac

## Setup DevOps Workstation
Do all of the following from a chef workstation that has admin permissions to the Chef Server.

1. Install latest Virtualbox
    1. [Virtualbox Download](https://www.virtualbox.org/wiki/Downloads)
    2. Enable VT in BIOS
2. Install latest Vagrant
    1. [Vagrant Download](https://www.vagrantup.com/downloads.html)
3. Install Chef Development Kit
    1. [ChefDK Download](https://downloads.chef.io/chef-dk/)
4. Download This Project
    1. Create repo directory
        1. ```mkdir -p ~/Development/chef/cookbooks/```
    1. ```git clone https://github.com/chefcore/config_examples.git ~/Development/chef/cookbooks/```
5. **(Optional)** Create **.kitchen.local.yml** file and add proxy or other custom settings like resources.

### Windows Specific

***PowerShell Setup***

[ChefDK on Windows](https://www.chef.io/blog/2014/11/04/the-chefdk-on-windows-survival-guide/)

1. Create **C:\Dev** Folder (Shortens path as a workaround to 260 character limitation)
    1. ```mkdir C:\Dev```
2. Create **C:\Dev\github** Folder
    1. ```mkdir C:\Dev\chef```
3. Create **C:\Dev\github\ATM** Folder
    1. ```mkdir C:\Dev\chef\cookbooks```
4. Install git client
    1. [Git Client Download](https://git-scm.com/download/win)
    2. Select to allow it to run from dos prompt
5. Download This Project
    1. ```git clone https://github.com/bonusbits/bonusbits_linux_base.git C:\Dev\chef\cookbooks```
6. Set User Profile Environment Variables ***Some of these settings deals with Home folders on Shares***
    1. ```HTTP_PROXY=http://username:password@proxy.domain.com:8000```
    2. ```HTTPS_PROXY=https://username:password@proxy.domain.com:8000```
    3. ```CHEFDK_PATH=C:\Dev\.chefdk```
    4. ```PATH=%PATH%;C:\Dev\.chefdk\gem\ruby\2.1.0\bin;C:\opscode\chefdk\embedded\bin"```
    5. ```VBOX_USER_HOME=C:\Dev\.VirtualBox```
    6. ```VAGRANT_HOME=C:\Dev\.vagrant.d```
    7. ```BERKSHELF_PATH=C:\Dev\.berkshelf```
    8. ```GEM_ROOT=C:\opscode\chefdk\embedded\lib\ruby\gems\2.1.0```
    9. ```GEM_HOME=C:\Dev\.chefdk\gem\ruby\2.1.0```
    10. ```GEM_PATH=C:\Dev\.chefdk\gem\ruby\2.1.0;C:\opscode\chefdk\embedded\lib\ruby\gem```
7. Set PowerShell execution policy
    1. ```Set-ExecutionPolicy unrestricted```
8. Create WindowsPowerShell user directory
    1. ```mkdir %USERPROFILE%\Documents\WindowsPowerShell```
9. Added ChefDK init to PowerShell user profile
    1. ```"chef shell-init powershell | Invoke-Expression" >> $PROFILE```

## Vagrant Local VirtualBox VM
First change to the root directory of config_examples in a shell.

### List all Test Suites
There are many OS flavors and more coming. So, first list whats available and pick which one you'd like to test out. 
If you don't specify a test suite it will try to set them all up and most likely run your system out of storage, memory or both.

```kitchen list```

### Create Local VM and Run Chef Client 
***Also used to run Chef Client again after making local cookbook changes***

```kitchen core-base-el-centos-66 converge```

### Run Integration Tests with Kitchen

```kitchen core-base-el-centos-66 verify```

### Delete VM

```kitchen core-base-el-centos-66 destroy```

# Completed

1. core_base
2. core_web::apache
