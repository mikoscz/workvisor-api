defmodule Workwizor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application


  def start(_type, _args) do
    workers = Enum.map(1..15, fn n ->
      %{
        id: String.to_atom("worker_#{n}"),
        start: {Workwizor.Events.EmployeeSimulator, :start_link, ["#{n}"]}
      }
    end)

    children = [
      # Start the Ecto repository
      Workwizor.Repo,
      # Start the Telemetry supervisor
      WorkwizorWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Workwizor.PubSub},
      # Start the Endpoint (http/https)
      WorkwizorWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Workwizor.Supervisor]
    Supervisor.start_link(Enum.concat(children, workers), opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WorkwizorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
