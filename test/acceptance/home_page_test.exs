defmodule Acceptance.HomePageTest do
  use ExUnit.Case, async: false
  use Hound.Helpers

  setup do
    Hound.start_session()
    :ok
  end

  test "the page loads" do
    navigate_to("http://localhost:4002")
    assert page_title() == "Sneakers23"
  end
end
