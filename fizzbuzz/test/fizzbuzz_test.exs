defmodule FizzbuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns {:ok, converted_list}" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz, :fizz, :fizzbuzz]}
      assert Fizzbuzz.build("numbers.txt") == expected_response
    end

    test "when an invalid file is provided, returns {:error, error_reason}" do
      expected_response = {:error, "Error reading the file: enoent"}
      assert Fizzbuzz.build("numberss.txt") == expected_response
    end
  end

end
