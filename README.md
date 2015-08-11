# Purpose

Ultimate Chef all inclusive wrapper infrastructure.  Provides a great infrastructure foundation starting point. Provides wrappers for many common services. Aided an eliminating the need for writing dozens of wrapper cookbooks.

# Design
The design idea came to me one day after a couple years of repeatably writing wrapper cookbooks for several different developement teams. I found the layout that was given to use was an inferior design that had numerous faults.

So, I decided to make a project that directly addressed these issues aims at simplifying stack setup and management.

I hope to help others by giving a Chef foundation that is solid, extensible and drives to dry up code.

I'm a long way from being finished. I hope that others will help me grow the project and continually improve it.

The idea is to not have to write tons of wrapper cookbooks, work with all major flavors of operating systems and to setup a stack for a developement team is as simple as filling out a few JSON "configuration" files (Environment and Data Bags).

# Supported Platforms
* Linux
* Windows

# Setup DevOps Workstation
Do all of the following from a chef workstation that has admin permissions to the Chef Server.

1. Install Chef Development Kit
    1. [Download](https://downloads.chef.io/chef-dk/)
2. Download This Project
    1. ```git clone https://github.com/LevonBecker/chef_core.git ~/chef_core```

# Upload to Chef Server
After you are happy with all the pieces and made any adjustments needed you can upload to your Chef Server.

1. Upload Cookbooks
    1. ```berks upload```
2. Upload Chef Core roles to Chef Server
    1. Change directories to roles
    2. ```ls *.json | xargs -n1 knife role from file```
3. Create and upload your own Environment files using the core examples in the environments directory.

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

## Environments
Specific configurations per environment are set here.

### Example

```java
{
    "name": "bonusbits_web_dev",
    "description": "Bonus Bits Dev Web Environment",
    "cookbook_versions": {},
    "json_class": "Chef::Environment",
    "chef_type": "environment",
    "default_attributes": {
    },
    "override_attributes": {
    }
}
```

## Data Bags
Secure and non-secure data for a solution.

### Example
```java
{
    "name": "bonusbits_web_dev",
    "description": "Bonus Bits Dev Web Environment",
    "cookbook_versions": {},
    "json_class": "Chef::Environment",
    "chef_type": "environment",
    "default_attributes": {
    },
    "override_attributes": {
    }
}
```

# TESTING (Kitchen)

# Supported Host Platforms
* Linux
* Windows
* Mac

# Test Setup
1. Install latest Virtualbox
    1. [Download](https://www.virtualbox.org/wiki/Downloads)
2. Install latest Vagrant
    1. [Download](https://www.vagrantup.com/downloads.html)
3. Install Chef Development Kit
    1. [Download](https://downloads.chef.io/chef-dk/)
4. Install kitchen-ec2 gem to ChefDK (Optional if using EC2)
    1. ```chef gem install kitchen-ec2```
5. Download This Project
    1. ```git clone https://github.com/LevonBecker/chef_core.git ~/chef_core```

## Vagrant Local VM (Option 1)
This is the default setup and doesn't require an special setup.

## AWS EC2 Instance (Option 2)
Edit the .kitchen-ec2.yml and add your unique Amazon settings

1. Select a CentOS 6.5 AMI in your account or set one up based on Public AMI (Create Either pick your own CenOS 6.5 AMI or accept terms for one I used
    1. [http://aws.amazon.com/marketplace/pp?sku=eggbgx9svw4xhzs1omttdv29q](http://aws.amazon.com/marketplace/pp?sku=eggbgx9svw4xhzs1omttdv29q)
    2. [http://wiki.centos.org/Cloud/AWS](http://wiki.centos.org/Cloud/AWS)
    3. Be sure your ssh key pair is setup for the AMI
    4. Create [ec2-user](https://awsmp-usageinstructions.s3.amazonaws.com/CentOS_User_Add_Instructions.pdf) etc.
2. Include appropriate security group/s that allow SSH from your computer WAN address and HTTP from anywhere

Note: The .kitchen.local.yml file overrides the .kitchen.yml file so you can leave .kitchen.yml as is and write your own as .kitchen.local.yml without dorking up the git status.

# Create Linux VM Locally with Kitchen
From a command shell in the project directory execute the following.

* Local Vagrant: ```kitchen converge core-web-apache-centos```
* EC2 Instance: ```KITCHEN_YAML=.kitchen-ec2.yml kitchen converge core-web-apache-amazon```

# Run Integration Tests with Kitchen
From a command shell in the project directory execute the following. (WIP)

* Local Vagrant: ```kitchen verify core-web-apache-centos```
* EC2 Instance: ```KITCHEN_YAML=.kitchen-ec2.yml kitchen verify core-web-apache-amazon```

# Delete VM
From a command shell in the project directory execute the following.

* ```kitchen destroy```

# Troubleshooting
* I found I needed to do a kitchen create, then wait for the instance to finish it's checks and then do a kitchen converge.

# Completed

1. core_web::apache