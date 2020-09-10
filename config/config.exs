# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :workwizor,
  ecto_repos: [Workwizor.Repo]

# Configures the endpoint
config :workwizor, WorkwizorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pH4obnJSjAxw7G3YD63G6c+AH6sNMBByBwrOMgg+t6XbO4laDUWDzmLlVnKDPTkQ",
  render_errors: [view: WorkwizorWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Workwizor.PubSub,
  live_view: [signing_salt: "fl3mvchY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
