

#!/bin/bash
sudo yum update -y

echo "Install Maven"
sudo yum install -y maven 

echo "Install git"
sudo yum install -y git

echo "Install Docker engine"
sudo yum sudo
sudo yum install docker -y
sudo chkconfig docker on

echo "Install Jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins
sudo usermod -a -G docker jenkins
sudo chkconfig --add jenkins
sudo systemctl start docker
sudo systemctl start jenkins
# sudo service jenkins start

echo "Install SonarQube"
sudo docker pull sonarqube:latest
sudo docker run --name sonarqube -h sonarqube -p 9000:9000 -d sonarqube
#NOTE: Be sure port 9000 is open on your ec2 instance