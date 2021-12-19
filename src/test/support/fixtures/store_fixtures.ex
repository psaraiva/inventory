defmodule InventoryApi.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InventoryApi.Store` context.
  """

  @doc """
  Generate a storage.
  """
  def storage_fixture(attrs \\ %{}) do
    {:ok, storage} =
      attrs
      |> Enum.into(%{
        name: "some name",
        quantity: 42
      })
      |> InventoryApi.Store.create_storage()

    storage
  end
end
