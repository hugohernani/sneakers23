defmodule Sneakers23Web.CartView do
  def cart_to_map(cart) do
    {:ok, serialized} = Sneakers23.Checkout.export_cart(cart)

    {:ok, products} = Sneakers23.Inventory.get_complete_products()
    item_ids = Sneakers23.Checkout.cart_item_ids(cart)
    items = render_items(products, item_ids)

    %{items: items, serialized: serialized}
  end

  defp render_items(products, item_ids) do
    Enum.reduce(products, [], fn product, acc ->
      Enum.reduce(product.items, acc, fn item, acc ->
        if item.id in item_ids do
          [render_item(product, item) | acc]
        else
          acc
        end
      end)
    end)
    |> Enum.sort_by(& &1.id)
  end

  @product_attrs [
    :brand, :color, :name, :price_usd, :main_image_url, :released
  ]

  @item_attrs [:id, :size, :sku]

  defp render_item(product, item) do
    product_attrs = Map.take(product, @product_attrs)
    item_attributes = Map.take(item, @item_attrs)
    product_attrs
    |> Map.merge(item_attributes)
    |> Map.put(:out_of_stock, item.available_count == 0)
  end
end
