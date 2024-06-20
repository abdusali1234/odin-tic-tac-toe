class Player 
    attr_reader :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def player_moves
        puts "#{name}, Which square would you like to play?"
        board_pos = gets.chomp until board_pos.to_i.between?(1,9)
        board_pos.to_i
    end

    def player_wins?(symbol)
        board.three_in_a_row?(symbol)
    end

    def winner_message
        puts "Congratulations #{name}, you won!"
    end
end