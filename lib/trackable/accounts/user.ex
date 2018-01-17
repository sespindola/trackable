defmodule Trackable.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trackable.Accounts.User


  schema "users" do
    field :disabled, :boolean, default: false
    field :email, :string
    field :fullname, :string
    field :role, :string
    field :status, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :username, :fullname, :role, :status, :disabled])
    |> validate_required([:email, :username, :fullname, :role, :status, :disabled])
  end
end
