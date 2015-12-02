use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :nerves_lab, NervesLab.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :nerves_lab, NervesLab.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "keyvan",
  password: "",
  database: "nerves_lab_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
