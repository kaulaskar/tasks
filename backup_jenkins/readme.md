
## stop the jenkns 

systemctl stop jenkins 

tar -zcvf jenkins-backup.tar.gz /var/lib/jenkins 

aws s3 cp jenkins-backup.tar.gz s3://saileshs3/jenkins-backup.tar.gz

===== launch new system ======
launch new server
install jenkins 
install aws cli 

=== copyfrom s3 to local ====

aws s3 cp  s3://saileshs3/jenkins-backup.tar.gz jenkins-backup.tar.gz

=== restore ==
systemctl stop  jenkins
rm -rf /var/lib/jenkins
tar -zxvf jenkins-backup.tar.gz -C /

systemctl start  jenkins 


## awscli commands 
$ aws s3 ls

aws s3 sync s3://"myBucket"/"this folder" C:\\Users\Desktop
aws s3 sync s3://saileshs3/jenkins /var/lib/jenkins

aws s3 sync /var/lib/jenkins s3://saileshs3/jenkins/ --dryrun


## thin backup ###

aws s3 cp FULL-2024-01-04_12-56 s3://saileshs3/FULL-2024-01-04_12-56

aws s3 cp  s3://saileshs3/FULL-2024-01-04_12-56 FULL-2024-01-04_12-56