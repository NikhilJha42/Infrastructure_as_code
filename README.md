# Infrastructure_as_code

# Using ansible with app
Dependencies: Vagrant and Virtual Box

## Getting started

- Upload the vagrantfile
- Run `vagrant up` and check that you have three VMs running: controller, web and db.
- ssh into each separately, and update/upgrade.
- Return to controller VM, install `software-properties-common`
- `sudo apt-add-repository ppa:ansible/ansible` then `sudo apt-get install ansible`
- Check the ansible version