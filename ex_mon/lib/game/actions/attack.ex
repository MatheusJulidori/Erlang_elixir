defmodule ExMon.Game.Actions.Attack do

  alias ExMon.Game

  @move_avg_power 18..25
  @move_rnd_power 10..35

  def attack_opponent(opponent, move) do
    dmg = calc_power(move)

    Game.fetch_player(opponent)
    |>Map.get(:life)
    |>calc_total_life(dmg)
    |>update_life(opponent)
  end

  defp calc_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calc_power(:move_rnd), do: Enum.random(@move_rnd_power)

  defp calc_total_life(life, dmg) when life - dmg < 0, do: 0
  defp calc_total_life(life, dmg), do: life - dmg

  defp update_life(life,player) do
    Game.fetch_player(player)
    |>Map.put(:life, life)
  end
end
