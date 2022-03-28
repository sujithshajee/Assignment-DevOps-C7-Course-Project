resource "local_file" "deployscript" {
  filename = "./scripts/deployImage.sh"
  content  = <<EOF
#!/bin/bash
ssh -i /tmp/${var.KEY_NAME}.pem ubuntu@${aws_instance.app-instance.*.private_ip[0]} docker stop app-server && docker rm app-server
ssh -i /tmp/${var.KEY_NAME}.pem ubuntu@${aws_instance.app-instance.*.private_ip[0]} docker run -p 8080:8081 --name app-server ${aws_ecr_repository.assignment.repository_url}/app:latest 
    EOF

  provisioner "file" {
    source      = "./scripts/deployImage.sh"
    destination = "/tmp/scripts/deployImage.sh"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${var.KEY_NAME}.pem")
    host        =  aws_instance.bastion-instance.public_ip
    agent       = false
    timeout     = "1m"
  }
}