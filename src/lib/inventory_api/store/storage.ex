defmodule InventoryApi.Store.Storage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "storages" do
    field :name, :string
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(storage, attrs) do
    storage
    |> cast(attrs, [:name, :quantity])
    |> validate_required([:name, :quantity])
  end
end
