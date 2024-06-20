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

    def update_board(symbol, board_num)
        board[board_num - 1] = symbol
        display_board
    end

end