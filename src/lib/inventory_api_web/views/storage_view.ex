defmodule InventoryApiWeb.StorageView do
  use InventoryApiWeb, :view
  alias InventoryApiWeb.StorageView

  def render("index.json", %{storages: storages}) do
    %{data: render_many(storages, StorageView, "storage.json")}
  end

  def render("show.json", %{storage: storage}) do
    %{data: render_one(storage, StorageView, "storage.json")}
  end

  def render("storage.json", %{storage: storage}) do
    %{
      id: storage.id,
      name: storage.name,
      quantity: storage.quantity
    }
  end
end
