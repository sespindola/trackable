defmodule Trackable.AccountsTest do
  use Trackable.DataCase

  alias Trackable.Accounts

  describe "users" do
    alias Trackable.Accounts.User

    @valid_attrs %{disabled: true, email: "some email", fullname: "some fullname", role: "some role", status: "some status", username: "some username"}
    @update_attrs %{disabled: false, email: "some updated email", fullname: "some updated fullname", role: "some updated role", status: "some updated status", username: "some updated username"}
    @invalid_attrs %{disabled: nil, email: nil, fullname: nil, role: nil, status: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.disabled == true
      assert user.email == "some email"
      assert user.fullname == "some fullname"
      assert user.role == "some role"
      assert user.status == "some status"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.disabled == false
      assert user.email == "some updated email"
      assert user.fullname == "some updated fullname"
      assert user.role == "some updated role"
      assert user.status == "some updated status"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "positions" do
    alias Trackable.Accounts.Position

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def position_fixture(attrs \\ %{}) do
      {:ok, position} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_position()

      position
    end

    test "list_positions/0 returns all positions" do
      position = position_fixture()
      assert Accounts.list_positions() == [position]
    end

    test "get_position!/1 returns the position with given id" do
      position = position_fixture()
      assert Accounts.get_position!(position.id) == position
    end

    test "create_position/1 with valid data creates a position" do
      assert {:ok, %Position{} = position} = Accounts.create_position(@valid_attrs)
    end

    test "create_position/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_position(@invalid_attrs)
    end

    test "update_position/2 with valid data updates the position" do
      position = position_fixture()
      assert {:ok, position} = Accounts.update_position(position, @update_attrs)
      assert %Position{} = position
    end

    test "update_position/2 with invalid data returns error changeset" do
      position = position_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_position(position, @invalid_attrs)
      assert position == Accounts.get_position!(position.id)
    end

    test "delete_position/1 deletes the position" do
      position = position_fixture()
      assert {:ok, %Position{}} = Accounts.delete_position(position)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_position!(position.id) end
    end

    test "change_position/1 returns a position changeset" do
      position = position_fixture()
      assert %Ecto.Changeset{} = Accounts.change_position(position)
    end
  end
end
