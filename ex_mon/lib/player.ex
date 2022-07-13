defmodule ExMon.Player do

  @max_life 100
  @struct_attributes [:life, :moves, :name]

  @enforce_keys @struct_attributes

  defstruct @struct_attributes

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd,
      },
      name: name
    }
  end

end
