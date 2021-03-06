# Jenkins-Configuration-as-Code

Pre-requisites:
- IAM user with AmazonEC2FullAccess role.
- [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed on your local machine (preferaly, version awscli v2
- aws cli configured with IAM user.
- [packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli) installed on your local machine.

N\B: I used us-west-2 as my region. Feel free to change it to what suits you.

Step 1: Clone this repository
```
git clone https://github.com/Wach-E/Jenkins-Configuration-as-Code.git
```

Step 2: Navigate to the cloned repository
```
cd Jenkins-Configuration-as-Code
```

Step 3: Build Docker baked image with Packer
```
packer build template.json
```

Step 4: On completion of packer build, create an EC2 instance with the docker ami and upload the `start.sh` script as a user data
N\B: port 8080 must be opened on your security group for access to Jenkins

Step 5: After the instance has been created, wait for 30 - 60 secs and then Navigate to `http:server_ip:8080` to access your Jenkins server

`I will really love to learn about a better approach as opposed to the waitime for the Jenkins server. A pull request on this will be awesome :)`

## TODO:
- Add a branch with the latest syntax for Packer with HCL. [This article should help](https://devopscube.com/packer-tutorial-for-beginners/)
