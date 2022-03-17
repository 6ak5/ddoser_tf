# ddoser_tf

https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean

# install terraform 
curl -o ~/terraform.zip https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_amd64.zip 
mkdir -p ~/opt/terraform
sudo apt install unzip
unzip ~/terraform.zip -d ~/opt/terraform
nano ~/.bashrc

# add line
export PATH=$PATH:~/opt/terraform

# load new edited .bashrc
. ~/.bashrc

# create api key in do and export them
export DO_PAT="your_personal_access_token"

# clone repo 
git clone git@github.com:6ak5/ddoser_tf.git
cd ddoser_tf

# init and start ddos
terraform init
terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
terraform apply -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"

#####


vim ddoser-1.tf

sed 's/ddoser-1/ddoser-2/g' ddoser-1.tf > ddoser-2.tf
sed 's/ddoser-1/ddoser-3/g' ddoser-1.tf > ddoser-3.tf
sed 's/ddoser-1/ddoser-4/g' ddoser-1.tf > ddoser-4.tf
sed 's/ddoser-1/ddoser-5/g' ddoser-1.tf > ddoser-5.tf
terraform plan -destroy -out=terraform.tfplan  -var "do_token=${DO_PAT}"   -var "pvt_key=$HOME/.ssh/id_rsa"
terraform apply terraform.tfplan
terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
terraform apply -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
terraform show terraform.tfstate


