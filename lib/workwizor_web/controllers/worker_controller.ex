defmodule WorkwizorWeb.WorkerController do
  use WorkwizorWeb, :controller

  alias Workwizor.Workers

  action_fallback WorkwizorWeb.FallbackController

  def index(conn, _params) do
    workers = Workers.list_workers()
    render(conn, "index.json", workers: workers)
  end
end
