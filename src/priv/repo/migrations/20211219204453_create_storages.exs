defmodule InventoryApi.Repo.Migrations.CreateStorages do
  use Ecto.Migration

  def change do
    create table(:storages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :quantity, :integer

      timestamps()
    end
  end
end
