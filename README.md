# PURPOSE

This contains a playbook (site.yml) that installs Kubespray and then executes it.
The playbook will:
  - Update /etc/hosts on each host so that they can find each other via local DNS
  - Set up passwordless-SSH from the installation host to all hosts
  - Install Ansible and Kubespray on the installation host
  - Create a script to run Kubespray and log all output to a file
  - Run the installation script

# Dependencies
- Ansible Roles:
  The roles are pulled in from the following section in config.yaml of the included
  test code. That section is here:
 ```
  roles:
    - name: "ansible-role-mount-disks"
      src: "https://github.com/pwyoung/ansible-role-mount-disks.git"
      scm: "git"
      version: "master"
    - name: "create_partition"
      src: "https://github.com/mcgrof/create_partition.git"
      scm: "git"
      version: "v1.2.1"
 ```
# Testing
- From Scratch:
    - Description:
      - If you don't have a set of existing hosts
    - Install 'nomaj'
      - https://github.com/pwyoung/nomaj
    - run 'make'


# FILES
site.yml:
  Entry-point to the code.
  Master Playbook.
  Its only function is to call playbooks (not to execute tasks directly).
  This is meant to facilitate dev/test and readability.
*.yml:
  Ansible Playbooks.
  These may:
  - 1: Contain all tasks required for a function
  - 2: Invoke a local role (in ./roles/) to perform a function
  - 3: Invoke an external (ideally, very generic) role to perform a function
  Generally, Ansible code evolves from 1->2->3, from expedient to re-usable.
./roles/:
  Local Ansible Roles
./tests/run-all:
  Creates all required dependencies and builds a cluster of virtual
  machines in which K8S will run.
