defmodule ExMon.GameTest do

  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Player", :punch, :kick, :heal)
      computer = Player.build("Computer", :punch, :kick, :heal)

      assert {:ok, _pid} = Game.start(computer,player) #pattern matching pra ver que retorna :ok e um PID
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Player", :punch, :kick, :heal)
      computer = Player.build("Computer", :punch, :kick, :heal)

      expected_response = %{
        computer: computer,
        player: player,
        turn: :player,
        status: :started
      }

      Game.start(computer,player)
      assert Game.info() == expected_response
    end

  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Player", :punch, :kick, :heal)
      computer = Player.build("Computer", :punch, :kick, :heal)

      expected_response = %{
        computer: computer,
        player: player,
        turn: :player,
        status: :started
      }

      Game.start(computer,player)

      assert Game.info() == expected_response

      #Alterando estado do jogo
      new_state = %{
        computer: %Player{
          life: 85,
          moves: %{move_avg: :punch, move_rnd: :kick, move_heal: :heal},
          name: "Computer"
        },
        player: %Player{
          life: 85,
          moves: %{move_avg: :punch, move_rnd: :kick, move_heal: :heal},
          name: "Player"
        },
        turn: :player,
        status: :started
      }
      Game.update(new_state)


      new_expected_response = %{
        computer: %Player{
          life: 85,
          moves: %{move_avg: :punch, move_rnd: :kick, move_heal: :heal},
          name: "Computer"
        },
        player: %Player{
          life: 85,
          moves: %{move_avg: :punch, move_rnd: :kick, move_heal: :heal},
          name: "Player"
        },
        turn: :computer,
        status: :continue
      }

      #Verificando que game state foi alterado
      assert Game.info() == new_expected_response
    end

  end

  describe "player/0" do
    test "returns player info" do
      player = Player.build("Player", :punch, :kick, :heal)
      computer = Player.build("Computer", :punch, :kick, :heal)

      expected_response = %Player{
        life: 100,
        moves: %{
          move_avg: :kick,
          move_rnd: :punch,
          move_heal: :heal
        },
        name: "Player"
      }
      Game.start(computer,player)
      assert Game.player() == expected_response
    end
  end

  describe "turn/0" do
    test "returns turn info" do
      player = Player.build("Player", :punch, :kick, :heal)
      computer = Player.build("Computer", :punch, :kick, :heal)

      expected_response = :player
      Game.start(computer,player)
      assert Game.turn() == expected_response
    end
  end

  describe "fetch_player/1" do
    test "returns player info" do
      player = Player.build("Player", :punch, :kick, :heal)
      computer = Player.build("Computer", :punch, :kick, :heal)

      expected_computer = %Player{
        life: 100,
        moves: %{
          move_avg: :kick,
          move_rnd: :punch,
          move_heal: :heal
        },
        name: "Computer"
      }
      expected_player = %Player{
        life: 100,
        moves: %{
          move_avg: :kick,
          move_rnd: :punch,
          move_heal: :heal
        },
        name: "Player"
      }
      Game.start(computer,player)
      assert Game.fetch_player(:computer) == expected_computer
      assert Game.fetch_player(:player) == expected_player
    end
  end

end
