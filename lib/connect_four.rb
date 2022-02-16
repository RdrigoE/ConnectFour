class ConnectFour
  attr_accessor :game
  @@WHITE = '⚪'
  @@ORDER = [5,4,3,2,1,0]
  
  def initialize
    @game =  [@@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE], 
             [@@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE], 
             [@@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE], 
             [@@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE], 
             [@@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE], 
             [@@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE, @@WHITE]
  end

  def game
    for i in @game
      for j in i
        print j
      end
      puts
    end
  end


  def redPlay(column)
    for row in @@ORDER
      if @game[row][column] == @@WHITE
        @game[row][column] = '🔴'
        return self.game
      end
    end
  end

  def yellowPlay(column)
    for row in @@ORDER
      if @game[row][column] == @@WHITE
        @game[row][column] = '🟡'
        return self.game
      end
    end
  end

  def check_horizontal(row,column,symbol)
    temp = @game[row]
    if temp[column] == symbol and temp[column + 1] == symbol and temp[column + 2] == symbol and temp[column + 3] == symbol
      return true
    end
    return false
  end

  def check_vertical(row,column,symbol)
    if @game[row][column] == symbol and @game[row + 1][column] == symbol and @game[row + 2][column] == symbol and @game[row + 3][column] == symbol
      return true
    end
    return false
  end

  def check_diag_left(row,column,symbol)
    if @game[row][column] == symbol and @game[row - 1][column - 1] == symbol and @game[row - 2][column - 2] == symbol and @game[row - 3][column - 3] == symbol
      return true
    end
    return false
  end 

  def check_diag_rigth(row,column,symbol)
    if @game[row][column] == symbol and @game[row - 1][column + 1] == symbol and @game[row - 2][column + 2] == symbol and @game[row - 3][column + 3] == symbol
      return true
    end
    return false
  end 

  def game_over
    for row in 0..5
      for column in 0..6
        if @game[row][column] != @@WHITE
          if column < 4
            if check_horizontal(row, column, @game[row][column])
              puts "horizontal"
              return true
            elsif row > 2 and check_diag_rigth(row, column, @game[row][column])
              puts "diag ri"
              return true
            end
          end
          if column > 2 and row > 2 and check_diag_left(row, column, @game[row][column])
            puts "diag left"  
            return true
          end

          if row < 3 and check_vertical(row, column, @game[row][column])
            puts "vertical"
            return true
          end
        end
      end
    end
  end
end



game = ConnectFour.new()
game.game
while true do
  puts "Player 1 -> Place your coin: "
  player1_play = gets.chomp.to_i
  game.redPlay(player1_play - 1)
  if game.game_over == true
    puts "Player 1 is the winner!"
    break
  end

  puts "Player 2 -> Place your coin: "
  player2_play = gets.chomp.to_i
  game.yellowPlay(player2_play - 1)
  if game.game_over == true
    puts "Player 2 is the winner!"
    break
  end
end
