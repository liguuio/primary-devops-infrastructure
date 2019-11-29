#!/bin/sh

# deploy new one $1=new

DEPLOY_TYPE=$1

STACK_NAME="jenkins"

DIR_NEED_CREATE=/var/jenkins-data

function giveUpOldStack() {
  while (( "$(docker stack ls | grep $STACK_NAME | wc -l)" > "0" )); do
    docker stack rm $STACK_NAME
    echo "Waiting for stack [ $STACK_NAME ] being removed..."
    sleep 20s
  done
}

function deployToSwarm() {
  echo "$STACK_NAME will deploy after 5s..."
  mkdir $DIR_NEED_CREATE
  sleep 5s
  docker stack deploy --compose-file swarm-app.yml $STACK_NAME
}

function deployLocal() {
  giveUpOldStack;
  deployToSwarm;
}

case $DEPLOY_TYPE in 
  local)
		deployLocal
		;;          
  h)
      usage
      exit 0
      ;;
  \?)
      usage
      exit 1
      ;;
  *)
      echo "缺少必要参数"
      exit 1
      ;;    
esac



