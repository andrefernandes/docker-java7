ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
#echo "ENVBASH=$ENVBASH"
docker run --rm -t -i andrefernandes/docker-java7:latest $ENVBASH ${@:2}

