source .env.db
source .env.network
source .env.volume

if [ "$(docker ps -aq -f name=$DB_CONTAINER_NAME)" ]; then
    echo "Removing the db container: $DB_CONTAINER_NAME"
    docker rm $DB_CONTAINER_NAME -f
else 
    echo "A container with the name $DB_CONTAINER_NAME does not exist, skipping container deletion"
fi

if [ "$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
    echo "Removing volume name: $VOLUME_NAME"
    docker volume rm $VOLUME_NAME
else
    echo "A volume with the name $VOLUME_NAME does not exists. Skipping volume deletion."
fi


if [ "$(docker network ls -q -f name=$NETWORK_NAME)" ]; then
    echo "Removing network name: $NETWORK_NAME"
    docker network rm $NETWORK_NAME
else
    echo "A network with the name $NETWORK_NAME does not exists. Skipping network deletion."
fi