defmodule Guess do
  use Application

  def start(_,_) do#recebe doi parametros que não serão usados por enquanto
    run()#executa o run
    {:ok,self()}#retorna uma tupla sempre o resultado caso execute corretamente e o PID(processed ID) do processo
  end

  def run() do
    IO.puts("Let's play Guess The Number")
    IO.puts("Which level do you want to play?")
    IO.puts("1. Easy")
    IO.puts("2. Medium")
    IO.puts("3. Hard")
    IO.puts("4. Exit")
    IO.gets("Enter your choice: ")
    |>Integer.parse()
    |>parseInput()
    |>pickNumber()
    |>play()
  end

  def play(pickedNumber) do
    IO.gets("Alright mate, I've chosen a number. What is your guess? ")
    |> parseInput()
    |> guess(pickedNumber, 1)
  end

  def guess(userPick,pickedNumber,score) when userPick > pickedNumber do
    IO.gets("Too high, try again: ")
    |>parseInput()
    |>guess(pickedNumber,score + 1)
  end

  def guess(userPick,pickedNumber,score) when userPick < pickedNumber do
    IO.gets("Too low, try again: ")
    |>parseInput()
    |>guess(pickedNumber,score + 1)
  end

  def guess(userPick,pickedNumber,score) do
    IO.puts("Well done mate, you guessed it in #{score} tries!")
    showScore(score)
  end

  def showScore(score) when score > 7 do
    IO.puts("Better luck next time")
    endGame()
  end

  def showScore(score) do
    {_, msg} = %{1..1 => "You're a mind reader!",
      2..4 => "Most Impressive!",
      5..7 => "You can do better than this! "}
      |> Enum.find(fn {range, _} ->
        Enum.member?(range, score)
      end)
      IO.puts(msg)
    endGame()
  end

  def parseInput(:error), do: invalidInputError()


  def parseInput({num,_}) do
    IO.puts("You chose #{num}")
    num
  end

  def parseInput(data) do
    data
    |> Integer.parse()
    |> parseInput()
  end

  def pickNumber(level) do
    level
    |> getRange()
    |> Enum.random()
  end

  def getRange(level) do
    case level do
      1 -> 1..10
      2 -> 1..100
      3 -> 1..1000
      4 -> endGame()
      _ -> invalidInputError()
    end
  end

  def invalidInputError() do
    IO.puts("Invalid input")
    run()
  end

  def endGame() do
    IO.puts("Bye")
  end



  #  outro approach
  #def parseInput(data) do
  #  if data==:error do
  #    IO.puts("Invalid input")
  #    run()
  #  else
  #    res = Integer.parse(data)#recebe o valor do input do usuario e converte para inteiro
  #    {num,_} = res
  #    num
  #  end
  #end
end
