defmodule MacVendorLookupTest do
  use ExUnit.Case
  doctest MacVendorLookup

  test "given known vendor" do
    assert MacVendorLookup.run("FC:FB:FB:01:FA:21") == "Cisco Systems, Inc"
  end

  test "given unknown vendor" do
    assert MacVendorLookup.run("FC:AB:FB:01:FA:22") == "N/A"
  end
end
