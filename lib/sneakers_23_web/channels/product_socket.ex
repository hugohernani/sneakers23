defmodule Sneakers23Web.ProductSocket do
  use Phoenix.Socket

  ## Channels

  channel "product:*", Sneakers23Web.ProductChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
