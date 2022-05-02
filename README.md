# Overview

Test Automation with Azure DevOps - Terraform - JMeter -Selenium - Postman

* To use  a variety of industry leading tools, especially Microsoft Azure, to create disposable test environments and run a variety of automated tests with the click of a button.

# Instructions

## Dependencies
| Dependency | Link |
| ------ | ------ |
| Git Bash | https://git-scm.com/downloads (If you want to run bash on window) |         
| Packer | https://www.packer.io/ |
| Terraform | https://www.terraform.io/downloads.html |
| JMeter |  https://jmeter.apache.org/download_jmeter.cgi|
| Postman | https://www.postman.com/downloads/ |
| Python | https://www.python.org/downloads/ |
| Selenium | https://sites.google.com/a/chromium.org/chromedriver/getting-started |
 
## Steps

**1. Clone this repo:**

**Type command : git clone git@github.com:phamtuan4nh/Project3-azure.git

**2. Open a Terminal in VS Code and connect to your Azure Account**<br/>
Choose tab "Terminal" -> "New terminal" -> Choose "Git bash"<br/>
![screen shot](guideImg/p1.png) <br/>
![screen shot](guideImg/p2.png) <br/>
**On terminal :** <br/>
Type command : az login -> login azure with username password -> success if see like this <br/>
![screen shot](guideImg/p3.png) <br/>

**3. Configure storage account to Store Terraform state**

**Run script storage_account.sh** :
In folder you just clone from GitHub -> select filename like : storage_account.sh -> Run script with command :  sh storage_account.sh <br/>
You can edit value or let to default <br/>
![screen shot](guideImg/p4.png) <br/>

* Copy output **STORAGE_ACCOUNT_NAME**, **CONTAINER_NAME**, **RESOURCE_GROUP_NAME** for use in the next steps

![screen shot](guideImg/p5.png) <br/>

**4. Edit file main.tf**

In folder you just clone from GitHub -> Choose filename : main.tf and terraform.tfvars -> edit value with result step above like this <br/>
![screen shot](guideImg/p6.png) <br/>
![screen shot](guideImg/p7.png) <br/>

**5. Create VM image using Packer**
> Go to the directory you just cloned files from git. You can see folder packer -> Go to folder and see two file name **key.json** and **server.json** <br/>
> Type command : az ad sp create-for-rbac --role Contributor --query "{ client_id: appId, client_secret: password, tenant_id: tenant }" <br/>
> Type command : az account show --query "{ subscription_id: id }" <br/>
> Copy all output and then replace the value labels in the **key.json**file<br/>
![screen shot](guideImg/p8.png) <br/>
![screen shot](guideImg/p9.png) <br/>
> File key.json like this <br/>
![screen shot](guideImg/p10.png) <br/>

> Type command : packer build -var-file=key.json server.json <br/>
> Go azure portal -> Search service "Images" -> Check to see if the image has been created <br/>
![screen shot](guideImg/p11.png) <br/>
![screen shot](guideImg/p12.png) <br/>

**6. Create public key use for SSH to VM.**

> Type command :  ssh-keygen -> you can see path like this : /c/Users/admin/.ssh/id_rsa.pub and copy and replace **public_key_path** in file **terraform.tfvars**<br/>
![screen shot](guideImg/p13.png) <br/>
![screen shot](guideImg/p14.png) <br/>

Tips: if you use SSH on Azure devops, remove comment "public key on pipeline" in **terraform.tfvars**

**7. Edit terraform.tfvars**<br/>
> like file **key.json** on step 5, edit file like this<br/>
![screen shot](guideImg/p15.png) <br/>

**8. Login to Azure DevOPs and create new project** 

> 8.1. Go to and login https://azure.microsoft.com/en-us/services/devops/ <br/>
> 8.2. Create new project <br/>
![screen shot](guideImg/p16.png) <br/>

**9. Configuring Azure Pipelines** 

> 9.1. Create the Service Connection  in Project Settings > Pipelines > Service Connection > Choose "Azure Resource Manager" > verified and authenticated and choose resource group > Save <br/>
 ![screen shot](guideImg/p17.png) <br/>

> 9.2. Go we have to navigate to Pipelines -> Library -> Secure Files <br/>
![screen shot](guideImg/p18.png) <br/>

> 9.3. Choose tab "Secure files" ->  "+Secure files" -> upload two file : **terraform.tfvars** and key file **id_rsa** created on step 6 <br/>
![screen shot](guideImg/p19.png) <br/>
![screen shot](guideImg/p20.png) <br/>

> type command : ssh-keyscan github.com -> Get your "Known Hosts Entry" is the displayed third value that doesn't begin with # in the GitBash results:<br/>
![screen shot](guideImg/p24.png) <br/>

> 9.4. Create groups of variables that you can share across multiple pipelines . Choose "+Variable groups" > Add name groups of variables : ssh-config > Add **knownHostsEntry**,**sshPublicKey**,**StorageAccountName (step 3)** and value this in Variables > Select type to secret > Save <br/>
![screen shot](guideImg/p25.png) <br/>

> 9.5. Install these Extensions: <br/>
* Terraform (https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks&targetId=625be685-7d04-4b91-8e92-0a3f91f6c3ac&utm_source=vstsproduct&utm_medium=ExtHubManageList) <br/>


**10. Create Azure Pipeline**

> 10.1. Tab Pipelines -> Create Pipeline -> Where is your code? Choose Github(Yaml) -> Select Repo -> Configure your pipeline
: CHoose "Existing Azure Pipelines yaml file" > Continue > Run <br/>
![screen shot](guideImg/p27.png) <br/>

> 10.2. Apcept permission for Azure Resources Create with terraform <br/>
![screen shot](guideImg/p26.png) <br/>

> 10.3. Pipeline run step like this <br/>
![screen shot](guideImg/p28.png) <br/>
![screen shot](guideImg/p29.png) <br/>

> 10.4. When step deploy virtual machine(VM) if you can see error : "no resource found ...". you must Registration VM on environment Pipeline and you only need to run it once <br/>

> 10.5. Go to Azure pipeline -> Environments -> you can see Environments name is "TEST" -> Choose and select "Add resource" -> choose "Virtual machines" > Select "Linux" and Choose icon "Copy command ..." > Close
![screen shot](guideImg/p34.png) <br/>
![screen shot](guideImg/p35.png) <br/>
![screen shot](guideImg/p36.png) <br/>
![screen shot](guideImg/p37.png) <br/>

> 10.6. SSH into VM you just created -> Enter command you just copy above step -> Run it -> Success if you see result like this 
![screen shot](guideImg/p32.png) <br/>
![screen shot](guideImg/p38.png) <br/>

> 10.7. Back to pipeline and re-run

**11. Report and testing**

> 11.1. App running <br/>
 ![screen shot](guideImg/p30.png) <br/>

