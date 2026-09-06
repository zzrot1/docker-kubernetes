const nodeBookDbUser = process.env.NOTEBOOKS_DB_USERNAME;
const nodeBookDbPassword = process.env.NOTEBOOKS_DB_PASSWORD;
const nodeBookDbName = process.env.NOTEBOOKS_DB_NAME;

console.log("initializing mongo database User): " + nodeBookDbUser);

db = db.getSiblingDB(nodeBookDbName);
db.createUser({
  user: nodeBookDbUser,
  pwd: nodeBookDbPassword,
  roles: [{ role: "readWrite", db: nodeBookDbName }],
});
