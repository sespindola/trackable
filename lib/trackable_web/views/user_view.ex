defmodule TrackableWeb.UserView do
  use TrackableWeb, :view
  alias TrackableWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      username: user.username,
      fullname: user.fullname,
      role: user.role,
      status: user.status,
      disabled: user.disabled}
  end
end
