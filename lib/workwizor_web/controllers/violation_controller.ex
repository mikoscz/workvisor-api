defmodule WorkwizorWeb.ViolationController do
  use WorkwizorWeb, :controller

  alias Workwizor.Events

  action_fallback WorkwizorWeb.FallbackController

  def show(conn, %{"id" => id}) do
    violations = Events.list_violations_for_user(id)
    render(conn, "index.json", violations: violations)
  end
end
