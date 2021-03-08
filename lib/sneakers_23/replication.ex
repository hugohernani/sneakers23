defmodule Sneakers23.Replication do
  alias __MODULE__.{Server}

  def child_spec(opts) do
    %{
      id: Server,
      start: {Server, :start_link, [opts]}
    }
  end
  
  def mark_product_released!(product_id) do
    broadcast!({:mark_product_released!, product_id})
  end

  def item_sold!(item_id) do
    broadcast!({:item_sold!, item_id})
  end

  defp broadcast!(data) do
    Phoenix.PubSub.broadcast_from!(
      Sneakers23.PubSub,
      server_pid(),
      "inventory_replication",
      data
    )
  end

  defp server_pid(), do: Process.whereis(Server)
end
