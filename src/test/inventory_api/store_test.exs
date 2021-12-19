defmodule InventoryApi.StoreTest do
  use InventoryApi.DataCase

  alias InventoryApi.Store

  describe "storages" do
    alias InventoryApi.Store.Storage

    import InventoryApi.StoreFixtures

    @invalid_attrs %{name: nil, quantity: nil}

    test "list_storages/0 returns all storages" do
      storage = storage_fixture()
      assert Store.list_storages() == [storage]
    end

    test "get_storage!/1 returns the storage with given id" do
      storage = storage_fixture()
      assert Store.get_storage!(storage.id) == storage
    end

    test "create_storage/1 with valid data creates a storage" do
      valid_attrs = %{name: "some name", quantity: 42}

      assert {:ok, %Storage{} = storage} = Store.create_storage(valid_attrs)
      assert storage.name == "some name"
      assert storage.quantity == 42
    end

    test "create_storage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_storage(@invalid_attrs)
    end

    test "update_storage/2 with valid data updates the storage" do
      storage = storage_fixture()
      update_attrs = %{name: "some updated name", quantity: 43}

      assert {:ok, %Storage{} = storage} = Store.update_storage(storage, update_attrs)
      assert storage.name == "some updated name"
      assert storage.quantity == 43
    end

    test "update_storage/2 with invalid data returns error changeset" do
      storage = storage_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_storage(storage, @invalid_attrs)
      assert storage == Store.get_storage!(storage.id)
    end

    test "delete_storage/1 deletes the storage" do
      storage = storage_fixture()
      assert {:ok, %Storage{}} = Store.delete_storage(storage)
      assert_raise Ecto.NoResultsError, fn -> Store.get_storage!(storage.id) end
    end

    test "change_storage/1 returns a storage changeset" do
      storage = storage_fixture()
      assert %Ecto.Changeset{} = Store.change_storage(storage)
    end
  end
end
