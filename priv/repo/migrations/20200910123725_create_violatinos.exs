defmodule Workwizor.Repo.Migrations.CreateViolations do
  use Ecto.Migration

  def change do
    create table(:violations) do
      add :type, :string
      add :user_id, :string
      add :face_frame_url, :string
      add :video_url, :string

      timestamps()
    end

  end
end
