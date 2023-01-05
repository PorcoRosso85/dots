# stating
git status --ignored
git rm -r [files]

git reset HEAD^

# committing

git reset --soft __

source ~/.bashrc

python3.11 -m pip

docker image rm
docker container ls -a
docker container rm
docker system purge
docker exec

docker run -it --rm --name="draw" -p 8080:8080 -p 8443:8443 jgraph/drawio
docker run -ti --rm -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $(pwd):/apps -w /apps alpine/ansible ansible
docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/usr/src/app -w /usr/src/app django django-admin.py startproject 
docker start
docker exec -it
docker run -ti --rm -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $(pwd):/apps -w /apps alpine/ansible ansible-playbook
python3 -m venv venv
source venv/bin/activate
source /root/.zshrc
apt clean && apt update
nvim /root/.profile_common
ansible-playbook -i inventory.yml playbook.yml -vvvv
aws cloudformation create-stack --stack-name
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
exercism submit 
python -m pytest 
fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
aws cloudformation delete-stack --stack-name ${STACK_NAME}
aws cloudformation create-stack --stack-name $STACK_NAME --template-body $VPC_TEMPLATE_PATH
aws cloudformation validate-template --template-body $VPC_TEMPLATE_PATH
docker container commit
