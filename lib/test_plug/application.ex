defmodule TestPlug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Plug.Cowboy, scheme: :http, plug: TestPlug.Router, options: [port: 8080]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestPlug.Supervisor]
    start = Supervisor.start_link(children, opts)
    Logger.info("TestPlug started")
    start
  end
end
