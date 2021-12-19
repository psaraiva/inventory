defmodule InventoryApiWeb.StorageController do
  use InventoryApiWeb, :controller

  alias InventoryApi.Store
  alias InventoryApi.Store.Storage

  action_fallback InventoryApiWeb.FallbackController

  def index(conn, _params) do
    storages = Store.list_storages()
    render(conn, "index.json", storages: storages)
  end

  def create(conn, %{"storage" => storage_params}) do
    with {:ok, %Storage{} = storage} <- Store.create_storage(storage_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.storage_path(conn, :show, storage))
      |> render("show.json", storage: storage)
    end
  end

  def show(conn, %{"id" => id}) do
    storage = Store.get_storage!(id)
    render(conn, "show.json", storage: storage)
  end

  def update(conn, %{"id" => id, "storage" => storage_params}) do
    storage = Store.get_storage!(id)

    with {:ok, %Storage{} = storage} <- Store.update_storage(storage, storage_params) do
      render(conn, "show.json", storage: storage)
    end
  end

  def delete(conn, %{"id" => id}) do
    storage = Store.get_storage!(id)

    with {:ok, %Storage{}} <- Store.delete_storage(storage) do
      send_resp(conn, :no_content, "")
    end
  end
end
