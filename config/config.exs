# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :trackable,
  ecto_repos: [Trackable.Repo]

# Configures the endpoint
config :trackable, TrackableWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9ZuFS5IbDrnU9PQ6ESQg+EjEY+2Sd180QDGALEI9QP18QR7fwJ9ZDWIwFHQz9X3B",
  render_errors: [view: TrackableWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Trackable.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
