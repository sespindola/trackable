defmodule TrackableWeb.PositionController do
  use TrackableWeb, :controller

  alias Trackable.Accounts
  alias Trackable.Accounts.Position

  action_fallback TrackableWeb.FallbackController

  def index(conn, _params) do
    positions = Accounts.list_positions()
    render(conn, "index.json", positions: positions)
  end

  def create(conn, %{"position" => position_params}) do
    with {:ok, %Position{} = position} <- Accounts.create_position(position_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", position_path(conn, :show, position))
      |> render("show.json", position: position)
    end
  end

  def show(conn, %{"id" => id}) do
    position = Accounts.get_position!(id)
    render(conn, "show.json", position: position)
  end

  def update(conn, %{"id" => id, "position" => position_params}) do
    position = Accounts.get_position!(id)

    with {:ok, %Position{} = position} <- Accounts.update_position(position, position_params) do
      render(conn, "show.json", position: position)
    end
  end

  def delete(conn, %{"id" => id}) do
    position = Accounts.get_position!(id)
    with {:ok, %Position{}} <- Accounts.delete_position(position) do
      send_resp(conn, :no_content, "")
    end
  end
end
