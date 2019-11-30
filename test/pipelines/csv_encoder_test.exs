defmodule Pipelines.CSVEncoderTest do
  use ExUnit.Case, async: false

  @valid %{first: "some", second: "data"}

  test "CSVEncoder converts a single-level map to a csv string" do
    Application.put_env(:crawly, :item, [:first, :second])

    pipelines = [Crawly.Pipelines.CSVEncoder]
    item = @valid
    state = %{}

    {item, _state} = Crawly.Utils.pipe(pipelines, item, state)

    assert is_binary(item)
    assert item == ~S("some","data")
  end

end
