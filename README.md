A set of manifests for deploying a docker-machine autoscaling vm gitlab-runner instance in a production environment.

Deployable software:
- vm instance in Yandex Cloud (Ubuntu 20)
- Packages and libraries docker, ansible, gitlab-runner
- Security groups for VMs in Yandex Cloud

Deployment algorithm:
1) Create a separate branch under vm
2) Override the below variables in variables.yaml
3) Run the pipeline




 | Variable name            | Variable example                    |  Variable info                                                           |
 | -------------------------|-------------------------------------|--------------------------------------------------------------------------|
 |GITLAB_URL                |  "https://gitlab.com"               | gitlab url                                                               |  
 |RUNNER_TOKEN              |  "ASDsDAASDvasdfsadfas"             | token for runner                                                         |
 |RUNNER_NAME               |  "docker-machine-autoscaling-yc"    | runner name without spaces                                               |
 |RUNNER_TAG                |  "docker_yc_vm"                     | primary tag                                                              |
 |VM_CORES                  |  4                                  | num of cpu for docker-machine vm                                         |
 |VM_RAM                    |  4                                  | num of ram (gb) for docker-machine vm                                    |
 |VM_STORAGE                |  30                                 | vm root storage size (gb) for docker-machine vm                          |
 |RUNNER_IP                 |  10.0.0.100                         | ip in internal network for docker-machine vm                             |
 |DEFAULT_IMAGE             |  "alpine"                           | default image for runnner proc                                           |
 |CONCURRENT                |  10                                 | Limits how many jobs globally can be run concurrently                    |
 |IDLETIME                  |  1800                               | how much runner vm will be in idle before being deleted                  |
 |MAXBUILDS                 |  100                                | max builds for runner(will be deleted after this limit)                  |
 |IDLECOUNT                 |  1                                  | runner in idle                                                           |
 |LIMIT                     |  3                                  | Limits how many jobs can be handled concurrently by this specific token  |
 |YANDEX_SA_KEY_FILE        |  "/home/gitlab-runner/key.json"     | path to key.json for access to a yc                                      |
 |YANDEX_CLOUD_ID           |  "asdfsadfasdfasdfasdf"             | cloud id                                                                 |
 |YANDEX_CORES              |  4                                  | cores allowed for created runners                                        |
 |YANDEX_MEMORY             |  4                                  | ram gb allowed for created runners                                       |
 |YANDEX_DISK_SIZE:         |  "120"                              | cores allowed for created runners                                        |
 |YANDEX_CORE_FRACTION      |  "100"                              | cores fraction allowed to created runners                                |
 |YANDEX_DISK_TYPE          |  "network-ssd"                      | disk type allowed for created runners YC type of disk                    |
 |YANDEX_FOLDER_ID          |  "basdffasdfasdfasdau5"             | YC folder id                                                             |
 |YANDEX_IMAGE_ID           |  "fasdfsdafasdfvasdasi"             | YC image id for created runners                                          |
 |YANDEX_SECURITY_GROUPS    |  "blank"                            | will use autogen value                                                   |
 |YANDEX_SUBNET_ID          |  "asdfsadfsadfdsafdsfa"             | YC subnet id                                                             |
 |YANDEX_ZONE               |  "ru-central1-a"                    | YC zone                                                                  |



 Deployment steps:
- Decryption of files with secret information
- Creating a VM
- Deployment via ansible playbooks, docker-machine, yc driver, gitlab-runner, node-exporter
- Destruction of VM and software (disabled by default

  Directories and files:
  - creds (Encrypted files with information on access to the cloud environment and storage of the terraform state file)
    - backend.conf.enc (s3 bucket)
    - key.json.enc (the main file for accessing the cloud environment)
  - files (Files required for deployment, customization is allowed)
    - authorized_keys (Keys for accessing cli vm via ssh)
  - ansible directory with roles for software deployment
    - play.yml (Manifest playbook for deploying gitlab-runner and node-exporter)
    - hosts list of hosts to deploy
    - directory with roles
  - terraform (Complex of manifests for recreating vm)
    - main.tf (Defines cloud connection values)
    - output.tf (Defines external and internal ip values ​​after deployment)
    - security_group.tf (Security groups for the created vm)
    - variables.tf (Changable variable values ​​for deployment)
    - vm.tf (Vm Instance Manifest)
    - terraform.tfvars (Human Readable Variables)
    - localproviders (Directory with provider binary)
    - .terraformrc (Override installation and use of the provider)
  - .gitlab-ci.yml (Internal gitlab compatible file for pipeline)
