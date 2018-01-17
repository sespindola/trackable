defmodule Trackable.Accounts.Position do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trackable.Accounts.Position


  schema "positions" do
    field :user_id, :id
    field :geom, Geo.Geometry
    timestamps()
  end

  @doc false
  def changeset(%Position{} = position, attrs) do
    position
    |> cast(attrs, [])
    |> validate_required([])
  end
end
