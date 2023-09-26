# aws-mongo-access

Nullstone capability to grant access for a mongo database to an app.

### Secrets

- `MONGO_PASSWORD`
- `MONGO_URL`

### Env Vars

- `MONGO_USER`
- `MONGO_DB`

### Security Group Rules

- `tcp:27015-27017` <=> `mongo atlas private link` connection
