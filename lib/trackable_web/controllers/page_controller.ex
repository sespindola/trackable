defmodule TrackableWeb.PageController do
  use TrackableWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
