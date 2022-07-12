defmodule Fizzbuzz do

  def build(file_name) do
    file_name
    |>File.read()
    |>handle_file_read()
  end

  def handle_file_read({:ok,  result}), do: convert_string_to_int_list(result)
  def handle_file_read({:error, reason}), do: "Error reading the file: #{reason}"

  def convert_string_to_int_list(string) do
    string
    |>String.split(",")
    |>Enum.map(&String.to_integer/1)
  end

end
