# kube-project

## Used tools

To automate deployment and testing below tools are used:

* ansible
* terraform
* terragrunt
* molecule
* testinfra

## Git repository structure in terms of reaching maximum efficiency in terms of ease of development and collaborating

1. The environment variables are in respective /live/vars/ for the roles to uses them.
2. passwords and private keys are stored in secrets since required files are pulled from setup.yml file from during environment setup.
3. Terraform is used in creation of vms/agents using create-cluster.sh 
4. Using Ansible configue-cluster.sh and upgrade-cluster.sh scripts are used to install and configure the complete application on the cluster.
5. Each component of the application is divided into various roles  and can used for the ease development and collaboration.
6. Prod under live used by all projects in production. similarly uat and staging for respective environments.
7. For each environment subdirectories for each resource, as example prod
      
     1. grafana: helps in monitoring cluster.
     2. workstation: master worker for managed master.
     3. rancher: rancher helps in managing the cluster.
     4. nfs: nfs for shared filesystem accross all nodes and cluster.

## Plan for CI/CD. As there will be tests pertaining to each microservice, plan to run them in tandem in the deployment pipeline

1. One Continuous Integration pipeline. This pipeline is connected with git triggers to packages each of our microservices. Microservice added to application, the pipeline is already there and only a new trigger is added for that microservice which is added.
2. Two Continuous Deployment pipeline for deploy each microservice.


## Deployment strategy that can be adapted for Staging, UAT and Production. Note that staging setup needs to be less in terms of operating cost.

* Deployment strategies considering operating costs - canary: release a new version to a subset of users, then proceed to a full rollout. cons with this strategy is slow rollout.

## To see logs in all the above three environments

* Promethesis DaemonSets are used to ensure that some or all of your K8S nodes run a copy of a pod, which allows you to run a daemon on every node. When a new node added to the cluster, a pod gets added to match the node and collects the logs. This logs cane be visualized on the grafana dashboards.

## Add alerts and monitoring across all of the mentioned components

* For each component the alerts are created while creation of the component using role tasks in ansible. Alerts are created and set using grafana apis and set to trigger to emails/slack channels etc.. 

## Plan which can be scaled to 100K users in a cost optimized way

* Add Pod Disruption Budget to application
* Design your CI/CD pipeline to enforce cost-saving practices
* Monitoring environment and enforce cost-optimized configurations 
* Appropriate resource requests and limits
