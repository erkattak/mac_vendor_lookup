defmodule MacVendorLookup do
  @moduledoc """
  Documentation for MacVendorLookup.
  """

  def main(args) do
    args
    |> parse_args()
    |> run()
    |> IO.puts()
  end


  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args, switches: [mac: :string])
    options
  end

  defp run([mac: mac]) when is_binary(mac) do
    case HTTPoison.get("http://api.macvendors.com/" <> mac) do
      {:ok, resp} ->
        parse_body(resp.body)
      {:error, _} ->
        ""
    end
  end
  defp run(_), do: "N/A"

  defp parse_body("Vendor not found" <> _), do: parse_body("N/A")
  defp parse_body(text) do
    text
  end
end
