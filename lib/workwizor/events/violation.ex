defmodule Workwizor.Events.Violation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "violations" do
    field :face_frame_url, :string
    field :type, :string
    field :user_id, :string
    field :video_url, :string

    timestamps()
  end

  @doc false
  def changeset(violation, attrs) do
    violation
    |> cast(attrs, [:type, :user_id, :face_frame_url, :video_url])
    |> validate_required([:type, :user_id, :face_frame_url, :video_url])
  end
end
