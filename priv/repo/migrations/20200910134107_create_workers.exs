defmodule Workwizor.Repo.Migrations.CreateWorkers do
  use Ecto.Migration

  def change do
    create table(:workers) do
      add :first_name, :string
      add :last_name, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
