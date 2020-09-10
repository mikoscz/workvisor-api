defmodule WorkwizorWeb.EventsChannel do
  use Phoenix.Channel

  def join("events:monitoring", _message, socket) do
    {:ok, socket}
  end
end
