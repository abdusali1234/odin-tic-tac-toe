class Board
    attr_reader :board, :new_board

    def initialize
        @board = Array.new(9) { |x| x + 1 }
    end

    def display_board
        puts <<-HEREDOC
        #{board[0]} | #{board[1]} | #{board[2]}
        --+---+--
        #{board[3]} | #{board[4]} | #{board[5]}
        --+---+--
        #{board[6]} | #{board[7]} | #{board[8]}
        HEREDOC
    end

    def update_board(symbol, board_pos)
        board[board_pos - 1] = symbol
        display_board
    end

    def three_in_a_row?(symbol)
        winning_combos = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
          ]

        winning_combos.any? do |combo|
            combo.all? do |pos|
                board[pos] == symbol
            end
        end
    end

    def can_play_square?(board_pos)
        return board[board_pos - 1].is_a?(Numeric) ? true : false
    end

end