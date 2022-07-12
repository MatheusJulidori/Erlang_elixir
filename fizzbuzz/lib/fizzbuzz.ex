defmodule Fizzbuzz do

  def build(file_name) do
    file_name
    |>File.read()
    |>handle_file_read()
  end

  defp handle_file_read({:ok,  result}), do: {:ok, convert_string_to_int_list(result)}
  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_string_to_int_list(string) do
    string
    |>String.split(",")
    |>Enum.map(&String.to_integer/1)
    |>Enum.map(&evaluate_numbers/1)
  end

  defp evaluate_numbers(num) when rem(num,3) == 0  and rem(num,5) == 0, do: :fizzbuzz
  defp evaluate_numbers(num) when rem(num,3) == 0, do: :fizz
  defp evaluate_numbers(num) when rem(num,5) == 0, do: :buzz
  defp evaluate_numbers(num), do: num


end
