defmodule ExMon.Game.Status do

  alias ExMon.Game

  def print_round_message() do
    IO.puts("\nThe game has started!\n")
    IO.inspect(Game.info())
    IO.puts("----------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\nInvalid move: #{move}\n")
  end


  def print_move_message(player, move, damage) do
    case move do
    :attack -> IO.puts("\n#{player} got attacked for #{damage} damage!\n")
    :heal -> IO.puts("\n#{player} heals for #{damage} life!\n")
    end
  end
end
