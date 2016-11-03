use Mix.Config
import System, only: [get_env: 1]

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.
config :classlab, Classlab.Endpoint,
  http: [port: get_env("PORT") || 80],
  url: [host: get_env("CLASSLAB_URL_HOST") || "example.com",
        port: get_env("CLASSLAB_URL_PORT") || get_env("PORT") || 80],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: get_env("SECRET_KEY_BASE"),
  server: true

# Do not print debug messages in production
config :logger, level: :info

# JWT secret for signing session token
config :classlab, :jwt_secret, get_env("SECRET_KEY_BASE")

# Configure your database
config :classlab, Classlab.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: get_env("DATABASE_POSTGRESQL_USERNAME") || "postgres",
  password: get_env("DATABASE_POSTGRESQL_PASSWORD") || "",
  database: get_env("DATABASE_POSTGRESQL_DATABASE") || "classlab_prod",
  hostname: get_env("DATABASE_POSTGRESQL_HOSTNAME") || "localhost",
  pool_size: get_env("DATABASE_POSTGRESQL_POOLSIZE") || 20
