
# Usage
Assumption: You have a virtualbox with centOs7 and ChefDk 2.4.17
1) Copy the cookook to your virtualBox running CentOs 7 and ChefDk kit ver 2.4.17.
2) Login as super user on terminal. 
3) Change working directory to <base dir where you copied the cookbook>/cookbooks/mongodb.
4) Run mongo install cookbook :
	sudo chef-client --local-mode recipes/default.rb 

# Test
 From terminal, login mongo shell:

 	> mongo
 
 Result: 
 	You are now logged in:
	root@osboxes mongodb]# mongo
	MongoDB shell version v3.6.2
	connecting to: mongodb://127.0.0.1:27017
	MongoDB server version: 3.6.2
	-etc.(truncated)----


#  Setup & Environment 
Note : This setup was done one time to set the environment of my virtualBox using centOS7 
and ChefDk kit ver 2.4.17

1) Downloaded and install VirtualBox running CentOs 7 - Linux 64 bit
2) Install chef in the virtual machine using the command: 
> $ sudo rpm -Uvh https://packages.chef.io/files/stable/chefdk/2.4.17/el/7/chefdk-2.4.17-1.el7.x86_64.rpm

Result: 
Retrieving https://packages.chef.io/files/stable/chefdk/2.4.17/el/7/chefdk-2.4.17-1.el7.x86_64.rpm
----etc [Truncated]
Thank you for installing Chef Development Kit!

3) Now set the Ruby version to be used as the Chefdk version:
	Ruby Version set to chef sdk ver:
	echo 'export PATH="/opt/chefdk/embedded/bin:$PATH"' >> ~/.configuration_file && source ~/.configuration_file
	echo 'export PATH="/opt/chefdk/embedded/bin:$PATH"' >> ~/.bash_profile && source ~/.bash_profile

# MongoDB-install Chef Recipe creation instructions: 

1) Create a directory called mongo-chef.  We will use this directory to store the recipe to install mongo Db
We have already downloaded chef Sdk in the previous step 
2) Rebooted my Virtual box and logged in as root
3) create a dir for chef repository, here we will generate and store all our cookbooks.
4) [root@osboxes /]# mkdir mongo-chef
5) mkdir cookbook
	RESULT:
    		[root@osboxes mongo-chef]# ls
		cookbooks

6) Next, generate a cookbook for all mongoldb installation instructions:
	[root@osboxes mongo-chef]# chef generate cookbook cookbooks/mongodb
	RESULT:
	Generating cookbook mongodb
	- [Truncated] ..
	Your cookbook is ready. Type `cd cookbooks/mongodb` to enter it.

7) Check the directory structure. I have already installed the tree package to view directories as tree 
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
	│   	├── spec_helper.rb
	│   └── unit
	│	└── recipes
	│           └── default_spec.rb
	└── test
   	 └── smoke
      	  └── default
            └── default_test.rb
7 directories, 9 files

8)  Create a recipe file where I will enter the resources and actions to perform on each resource to install mongoldb. 

9) Now run the Cookbook:
[root@osboxes recipes]# chef-client --local-mode default.rb 
 RESULT - 5X unsuccessful runs with errors - please see unsucessful_runs.txt, with possible issues and solutions.

 6 th time sucess!



