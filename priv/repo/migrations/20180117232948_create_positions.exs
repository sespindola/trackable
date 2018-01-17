defmodule Trackable.Repo.Migrations.CreatePositions do
  use Ecto.Migration

  def change do
    create table(:positions) do
      add :user_id, references(:users, on_delete: :nothing)
      add :geom, :geometry
      timestamps()
    end

    create index(:positions, [:user_id])
  end
end
