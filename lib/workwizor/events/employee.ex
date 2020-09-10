defmodule Workwizor.Events.Employee do
  defstruct [:id, :current_room]

  def move(%__MODULE__{current_room: "1"} = employee) do
    new_room = Enum.random(["2", "3", "4"])
    %{employee | current_room: new_room}
  end

  def move(%__MODULE__{current_room: "2"} = employee) do
    new_room = Enum.random(["1", "3", "4"])
    %{employee | current_room: new_room}
  end

  def move(%__MODULE__{current_room: "3"} = employee) do
    new_room = Enum.random(["1", "2", "4"])
    %{employee | current_room: new_room}
  end

  def move(%__MODULE__{current_room: "4"} = employee) do
    new_room = Enum.random(["1", "2", "3"])
    %{employee | current_room: new_room}
  end
end
