defmodule InventoryApiWeb.StorageControllerTest do
  use InventoryApiWeb.ConnCase

  import InventoryApi.StoreFixtures

  alias InventoryApi.Store.Storage

  @create_attrs %{
    name: "some name",
    quantity: 42
  }
  @update_attrs %{
    name: "some updated name",
    quantity: 43
  }
  @invalid_attrs %{name: nil, quantity: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all storages", %{conn: conn} do
      conn = get(conn, Routes.storage_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create storage" do
    test "renders storage when data is valid", %{conn: conn} do
      conn = post(conn, Routes.storage_path(conn, :create), storage: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.storage_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name",
               "quantity" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.storage_path(conn, :create), storage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update storage" do
    setup [:create_storage]

    test "renders storage when data is valid", %{conn: conn, storage: %Storage{id: id} = storage} do
      conn = put(conn, Routes.storage_path(conn, :update, storage), storage: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.storage_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "quantity" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, storage: storage} do
      conn = put(conn, Routes.storage_path(conn, :update, storage), storage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete storage" do
    setup [:create_storage]

    test "deletes chosen storage", %{conn: conn, storage: storage} do
      conn = delete(conn, Routes.storage_path(conn, :delete, storage))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.storage_path(conn, :show, storage))
      end
    end
  end

  defp create_storage(_) do
    storage = storage_fixture()
    %{storage: storage}
  end
end
