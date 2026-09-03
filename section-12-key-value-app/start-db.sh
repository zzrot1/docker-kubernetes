source .env.db
source setup.sh

MONGODB_IMAGE="mongodb/mongodb-community-server"
MONGODB_TAG="8.3-ubi8-slim"

# Root credentials
ROOT_USER="root-user"
ROOT_PASSWORD="root-password"

# Connectivity
LOCALHOST_PORT=27017
CONTAINER_PORT=27017

# Storage
VOLUME_CONTAINER_PATH="/data/db"


if [ "$(docker ps -aq -f name=$DB_CONTAINER_NAME)" ]; then
    echo "A container with the name $DB_CONTAINER_NAME already exists"
    echo "The container will be removed when stopped."
    echo "To remove the container run: docker kill $DB_CONTAINER_NAME"
    exit 1
fi

docker run --rm -d --name mongodb \
    -e MONGODB_INITDB_ROOT_USERNAME=$ROOT_USER \
    -e MONGODB_INITDB_ROOT_PASSWORD=$ROOT_PASSWORD \
    -e KEY_VALUE_DB=$KEY_VALUE_DB \
    -e KEY_VALUE_USER=$KEY_VALUE_USER \
    -e KEY_VALUE_PASSWORD=$KEY_VALUE_PASSWORD \
    -p $LOCALHOST_PORT:$CONTAINER_PORT \
    -v $VOLUME_NAME:$VOLUME_CONTAINER_PATH \
    -v ./db-config/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js:ro \
    --network $NETWORK_NAME \
    $MONGODB_IMAGE:$MONGODB_TAG

#docker run --rm --name mongosh -it --network key-value-net mongodb/mongodb-community-server:8.3-ubi8-slim mongosh mongodb://key-value-user:key-value-password@mongodb/key-value-db