defmodule WorkwizorWeb.WorkerView do
  use WorkwizorWeb, :view
  alias WorkwizorWeb.WorkerView

  def render("index.json", %{workers: workers}) do
    %{data: render_many(workers, WorkerView, "worker.json")}
  end

  def render("show.json", %{worker: worker}) do
    %{data: render_one(worker, WorkerView, "worker.json")}
  end

  def render("worker.json", %{worker: worker}) do
    %{id: worker.id,
      first_name: worker.first_name,
      last_name: worker.last_name,
      avatar_url: worker.avatar_url}
  end
end
