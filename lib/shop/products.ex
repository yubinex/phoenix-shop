defmodule Shop.Products do
  alias Shop.Repo
  alias Shop.Products.Product

  def list_products, do: Repo.all(Product)

  def find_product_by_slug(slug) when is_binary(slug) do
    Repo.get_by(Product, slug: slug)
  end
end
