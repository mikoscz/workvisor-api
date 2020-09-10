defmodule Workwizor.Events.RoomTransition do
  defstruct [:uid, :person_id, :origin_room_id, :destination_room_id]

  def new(id, from, to) do
    %__MODULE__{
      uid: UUID.uuid4(),
      person_id: id,
      origin_room_id: from,
      destination_room_id: to,
    }
  end
end
