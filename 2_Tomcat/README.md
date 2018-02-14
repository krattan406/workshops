# Usage

Assumption: You have a virtualbox with centOs7 and ChefDk 2.4.17

1) Login your virtualbox as super user from terminal.
2) Copy the cookbook directory to a base directory
3) Change working directory to  <base dir>/cookbooks
4) Run the tomcat installation cookbook:
        sudo chef-client --local-mode --runlist 'recipe[tomcat-chef]'
 
 Result - 
       [2018-02-14T17:11:39-05:00] WARN: No config file found or specified on command line, using command line options.
       Starting Chef Client, version 13.6.4
       resolving cookbooks for run list: ["tomcat-chef"]
       Synchronizing Cookbooks:
      - tomcat-chef (0.1.0)
       Installing Cookbook Gems:
       Compiling Cookbooks...
      Converging 13 resources
           Recipe: tomcat-chef::default
                 * yum_package[java-1.7.0-open 
  -- etc - Truncated


## Test

root@osboxes cookbooks]# curl localhost/

Result:
If tomcat has been sucessfully installed and started using the cookbook then output of above curl is :
 
 <html>
  <body>
    <h1>hello world</h1>
  </body>
</html>

## References
* https://docs.chef.io/resource_template.html
* https://docs.chef.io/resource_chef_client.html
* https://docs.chef.io/resource_remote_file.html
* https://docs.chef.io/resource_rpm_package.html
* https://docs.chef.io/resource_cookbook_file.html
* https://docs.chef.io/resource_service.html
* https://docs.chef.io/resource_chef_client.html
* https://www.youtube.com/watch?v=FOYc_SGWE-0
* https://learn.chef.io/modules/learn-the-basics/rhel/virtualbox/make-your-recipe-more-manageable#/
* https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-centos-7
* https://files.fosswire.com/2007/08/fwunixref.pdf
* https://linux.die.net



