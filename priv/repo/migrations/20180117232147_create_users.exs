defmodule Trackable.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :username, :string
      add :fullname, :string
      add :role, :string
      add :status, :string
      add :disabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
