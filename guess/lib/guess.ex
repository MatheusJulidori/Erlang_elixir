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
    |>getRange()
    |>IO.inspect()
  end

  def parseInput(:error), do: invalidInputError()


  def parseInput({num,_}) do
    IO.puts("You chose #{num}")
    num
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
