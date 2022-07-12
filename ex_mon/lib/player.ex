defmodule ExMon.Player do

  @max_life 100
  @struct_attributes [:life, :move_rnd, :move_avg, :move_heal, :name]

  @enforce_keys @struct_attributes

  defstruct @struct_attributes

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      move_avg: move_avg,
      move_heal: move_heal,
      move_rnd: move_rnd,
      name: name
    }
  end

end
