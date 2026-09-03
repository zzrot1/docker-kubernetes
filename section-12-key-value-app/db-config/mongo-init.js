const keyValueDb = process.env.KEY_VALUE_DB;
const keyValueUser = process.env.KEY_VALUE_USER;
const keyValuePassowrd = process.env.KEY_VALUE_PASSWORD;

db = db.getSiblingDB(keyValueDb)
db.createUser({
    user: keyValueUser,
    pwd: keyValuePassowrd,
    roles: [
        { role: "readWrite", db: keyValueDb }
    ]
})