resource "null_resource" "ansible_provisioner" {

  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/hosts ../ansible/n01610736-playbook.yml"
  }

  depends_on = [ 
    module.rgroup-N01610736,
    module.datadisk-N01610736,
    module.vmlinux-N01610736
     ]

}