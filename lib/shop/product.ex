defmodule Shop.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :slug, :string
    field :console, Ecto.Enum, values: [:pc, :xbox, :playstation, :nintendo]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :console])
    |> validate_required([:name, :console])
    |> format_name()
    |> slugify()
    |> unique_constraint(:slug)
  end

  defp format_name(changeset) do
    name =
      changeset.changes.name
      |> String.trim()

    put_change(changeset, :name, name)
  end

  defp slugify(changeset) do
    slug =
      changeset.changes.name
      |> String.downcase()
      |> String.replace(" ", "-")

    put_change(changeset, :slug, slug)
  end
end
