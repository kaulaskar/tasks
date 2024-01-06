resource "null_resource" "install_and_copy" {

  # jenkins installation
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install fontconfig openjdk-17-jre -y",
      "sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key",
      "sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt-get update -y",
      "sudo apt-get install jenkins -y",
      "sudo systemctl start jenkins",
      "sudo systemctl enable jenkins",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("../root/private_key.pem")}"
      host        = var.server_ip
    }
  }

}