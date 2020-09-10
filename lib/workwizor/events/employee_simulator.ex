defmodule Workwizor.Events.EmployeeSimulator do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end

  @impl true
  def init(id) do
    employee = %Workwizor.Events.Employee{id: id, current_room: "1"}

    Process.send_after(self(), :move, get_time())

    {:ok, employee}
  end

  @impl true
  def handle_info(:move, employee) do
    moved_employee = Workwizor.Events.Employee.move(employee)

    logger(employee.id, employee.current_room, moved_employee.current_room)
    Process.send_after(self(), :move, get_time())

    {:noreply, moved_employee}
  end

  defp get_time() do
    Enum.random(5000..20000)
  end

  defp logger(id, origin, destination) do
    WorkwizorWeb.Endpoint.broadcast!("events:monitoring", "room_transition", %{user_id: id, origin_room: origin, destination_room: destination})
    random_violation(id)
  end

  defp random_violation(id) do
    case Enum.random(1..10) do
      1 ->
        WorkwizorWeb.Endpoint.broadcast!("events:monitoring", "rule_violation", %{user_id: id, rule: "no_glasses"})

      2 ->
        WorkwizorWeb.Endpoint.broadcast!("events:monitoring", "rule_violation", %{user_id: id, rule: "no_helmet"})

      3 ->
        WorkwizorWeb.Endpoint.broadcast!("events:monitoring", "rule_violation", %{user_id: id, rule: "no_temperature_to_high"})

      _ -> nil
    end
  end
end
