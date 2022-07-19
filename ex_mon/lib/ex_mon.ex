defmodule ExMon do

  alias ExMon.{Game,Player}
  alias ExMon.Game.{Status,Actions}

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    create_player("Roboto", :punch, :kick, :heal)
    |>Game.start(player)
    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    Actions.fetch_move(move)
    |>do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal(move)
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end
end
