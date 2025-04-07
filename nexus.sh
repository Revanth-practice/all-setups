#create amazonlinux ec2 with t2.micro and 30 gb of ebs with port 8081 

yum install java-17-amazon-corretto -y
mkdir /app
cd /app
wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxvf nexus.tar.gz
mv nexus-* nexus
useradd nexus
chown -R nexus:nexus *
vim /app/nexus/bin/nexus.rc
sed -i '1s/.*/run_as_user="nexus"/' /app/nexus/bin/nexus.rc
./nexus/bin/nexus start
./nexus/bin/nexus status

