#  Setup & Environment 


1) Downloaded and install VirtualBox running CentOs 7 - Linux 64 bit
2) Install chef in the virtual machine using the command: 
> $ sudo rpm -Uvh https://packages.chef.io/files/stable/chefdk/2.4.17/el/7/chefdk-2.4.17-1.el7.x86_64.rpm

#### RESULT :
Retrieving https://packages.chef.io/files/stable/chefdk/2.4.17/el/7/chefdk-2.4.17-1.el7.x86_64.rpm
warning: /var/tmp/rpm-tmp.b3AyNw: Header V4 DSA/SHA1 Signature, key ID 83ef826a: NOKEY
Preparing...                ########################################### [100%]
   1:chefdk                 ########################################### [100%]
Thank you for installing Chef Development Kit!


#### Checked the Ruby version & set path to chef sdk version ############
Ruby Version set to chef sdk ver:
echo 'export PATH="/opt/chefdk/embedded/bin:$PATH"' >> ~/.configuration_file && source ~/.configuration_file

 echo 'export PATH="/opt/chefdk/embedded/bin:$PATH"' >> ~/.bash_profile && source ~/.bash_profile


# MongoDB install Chef Recipe creation instructions 

Create a directory called mongo-chef.  We will use this directory to store the recipe to install mongo Db
We have already downloaded chef Sdk in the previous step 

- Rebooted my Virtual box and logged in as root

 - create a dir for chef repository, here we will generate and store all our cookbooks.

[root@osboxes /]# mkdir mongo-chef
ls
mkdir cookbooks
ls

 #### RESULT:
[root@osboxes mongo-chef]# ls
cookbooks

# COOKBOOK :
###Next, generate a cookbook for all mongoldb installation instructions:

[root@osboxes mongo-chef]# chef generate cookbook cookbooks/mongodb

#### RESULT:

Generating cookbook mongodb
- Ensuring correct cookbook file content
- Ensuring delivery configuration
- Ensuring correct delivery build cookbook content
Your cookbook is ready. Type `cd cookbooks/mongodb` to enter it.

### Check the directory structure. I have already installed the tree package to view directories as tree 

[root@osboxes mongodb]# tree
.
├── Berksfile
├── chefignore
├── LICENSE
├── metadata.rb
├── README.md
├── recipes
│   └── default.rb
├── spec
│   ├── spec_helper.rb
│   └── unit
│       └── recipes
│           └── default_spec.rb
└── test
    └── smoke
        └── default
            └── default_test.rb

7 directories, 9 files

#### Create a recipe file where I will enter the resources and actions to perform on each resource to install mongoldb. 

#### Now run the Cookbook:
[root@osboxes recipes]# chef-client --local-mode default.rb 

#### RESULT - 5X unsuccessful runs with errors - please see unsucessful_runs.txt, with possible issues and solutions.

# MongoDb install Chef Recipe

default.rb

Cookbook:: mongodb
Recipe:: default

Copyright:: 2018, The Authors, All Rights Reserved.

yum_repository 'mongodb' do
	description "MongoDB Repository"
	baseurl "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"
	gpgcheck false
	enabled true
	action :create
end

package 'mongodb-org' do
	:install  
end

service 'mongod' do
	#supports : restart  => true
	action [:enable, :start]
end	


execute 'chkconfig' do
	#command 'mongo --host 127.0.0.1:27017'
	command 'sudo mongo' 
	action :run
	live_stream true
ignore_failure true
end

#### RESULT:

Starting Chef Client, version 13.6.4
resolving cookbooks for run list: []
Synchronizing Cookbooks:
Installing Cookbook Gems:
Compiling Cookbooks...
[2018-02-11T18:28:59-05:00] WARN: Node osboxes has an empty run list.
[2018-02-11T18:28:59-05:00] WARN: Node osboxes has an empty run list.
Converging 4 resources
Recipe: @recipe_files::/mongo-chef/cookbooks/mongodb/recipes/default.rb
  * yum_repository[mongodb] action create
    * template[/etc/yum.repos.d/mongodb.repo] action create (up to date)
    * execute[yum clean metadata mongodb] action nothing (skipped due to action :nothing)
    * execute[yum-makecache-mongodb] action nothing (skipped due to action :nothing)
    * ruby_block[yum-cache-reload-mongodb] action nothing (skipped due to action :nothing)
     (up to date)
  * yum_package[mongodb-org] action install (up to date)
  * service[mongod] action enable (up to date)
  * service[mongod] action start (up to date)
  * execute[chkconfig] action run
    [execute] MongoDB shell version v3.6.2
              connecting to: mongodb://127.0.0.1:27017
              MongoDB server version: 3.6.2
              bye
    - execute sudo mongo

Running handlers:
Running handlers complete
Chef Client finished, 1/9 resources updated in 10 seconds
[2018-02-11T18:29:05-05:00] WARN: No config file found or specified on command line, using command line options.
[2018-02-11T18:29:05-05:00] WARN: No config file found or specified on command line, using command line options.






