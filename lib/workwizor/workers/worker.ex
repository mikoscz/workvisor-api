defmodule Workwizor.Workers.Worker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workers" do
    field :avatar_url, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(worker, attrs) do
    worker
    |> cast(attrs, [:first_name, :last_name, :avatar_url])
    |> validate_required([:first_name, :last_name, :avatar_url])
  end
end
