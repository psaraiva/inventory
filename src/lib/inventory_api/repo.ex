defmodule InventoryApi.Repo do
  use Ecto.Repo,
    otp_app: :inventory_api,
    adapter: Ecto.Adapters.Postgres
end
