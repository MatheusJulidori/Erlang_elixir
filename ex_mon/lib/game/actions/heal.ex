defmodule ExMon.Game.Actions.Heal do

  alias ExMon.Game
  alias ExMon.Game.Status

  @heal_power 18..25

  def heal_life(player) do
    heal = calc_heal()

    Game.fetch_player(player)
    |>Map.get(:life)
    |>calc_total_life(heal)
    |>update_life(player)
  end

  defp calc_heal(), do: Enum.random(@heal_power)

  defp calc_total_life(life, heal) when life + heal > 100, do: 100
  defp calc_total_life(life, heal), do: life + heal

  defp update_life(life,player) do
    Game.fetch_player(player)
    |>Map.put(:life, life)
    |>update_game(player,life)
  end

  defp update_game(player_data,player_key,life) do
    Game.info()
    |>Map.put(player_key, player_data)
    |>Game.update()

    Status.print_move_message(player_key, :heal, life)
  end

end
