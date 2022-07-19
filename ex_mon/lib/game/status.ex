defmodule ExMon.Game.Status do

  def print_round_message(%{status: :started} = info) do
    IO.puts("\nThe game has started!\n")
    IO.inspect(info)
    IO.puts("----------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\nIt's #{player} turn\n")
    IO.inspect(info)
    IO.puts("----------------------------------")
  end


  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\nThe game is over\n")
    IO.inspect(info)
    IO.puts("----------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\nInvalid move: #{move}\n")
  end


  def print_move_message(player, :attack, damage) do
    IO.puts("\n#{player} got attacked for #{damage} damage!\n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("\n#{player} healed to #{life}HP!\n")
  end
end
