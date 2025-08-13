defmodule Shop.Promotions.Promotion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "promotions" do
    field :name, :string
    field :code, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(promotion, attrs) do
    promotion
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:code)
  end
end
