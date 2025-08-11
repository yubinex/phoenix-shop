defmodule ShopWeb.ProductHTML do
  alias Shop.Products.Product
  use ShopWeb, :html

  embed_templates "product_html/*"

  attr :product, Product, required: true

  def product(assigns) do
    ~H"""
    <.link
      href={~p"/products/#{@product.slug}"}
      class="block text-lg font-medium text-purple-400 hover:text-purple-300 hover:underline py-1 px-2 transition-colors duration-200"
    >
      {@product.name}
    </.link>
    """
  end
end
