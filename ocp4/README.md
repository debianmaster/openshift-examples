```sh

dnf install python3-netaddr python3-lxml python3-lxml git unzip -y

git clone https://github.com/Jooho/jhouse_openshift
cd jhouse_openshift/demos/OCP4/Libvirt



ansible-playbook  Build_CLI/go_build.yml -i localhost -e ansible_python_interpreter=/usr/bin/python3

ansible-playbook  Config_KVM/config_kvm.yml -i localhost -e ansible_python_interpreter=/usr/bin/python3


```
