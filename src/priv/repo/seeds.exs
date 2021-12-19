# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InventoryApi.Repo.insert!(%InventoryApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
InventoryApi.Repo.insert!(%InventoryApi.Store.Storage{
  name: "Sabone Lavanda",
  quantity: 1000
})

InventoryApi.Repo.insert!(%InventoryApi.Store.Storage{
  name: "Sabone Limao",
  quantity: 500
})

InventoryApi.Repo.insert!(%InventoryApi.Store.Storage{
  name: "Sabone Rosas",
  quantity: 1500
})
