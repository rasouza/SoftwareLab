class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    strategy = ["R", "P", "S"]
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless strategy.include?(player1[1])
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless strategy.include?(player2[1])

    return player1 if player1[1] == player2[1]

    return player2 if player1[1] == "R" and player2[1] == "P"
    return player1 if player1[1] == "R" and player2[1] == "S"
    return player1 if player1[1] == "P" and player2[1] == "R"
    return player2 if player1[1] == "P" and player2[1] == "S"
    return player1 if player1[1] == "S" and player2[1] == "P"
    return player2 if player1[1] == "S" and player2[1] == "R"
  end

  def self.tournament_winner(tournament)
    #Caso base: [ ["Armando", "P"], ["José", "S"]] => José S
    if (tournament[0][0].is_a? String)
      return self.winner(tournament[0], tournament[1])
    else
      a = self.tournament_winner(tournament[0])
      b = self.tournament_winner(tournament[1])
      return self.winner(a, b)
    end
  end

end
