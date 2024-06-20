require_relative 'board'
require_relative 'player'

class Game
    attr_reader :game_board, :player_one, :player_two, :moves, :current_player

    def initialize
        @game_board = Board.new
        @moves = 1
    end

    def assign_player_one
        puts "Player 1, please enter your name: "
        @player_one = Player.new(gets.chomp, 'X')
        @current_player = player_one
        
    end

    def assign_player_two
        puts "Player 2, please enter your name: "
        @player_two = Player.new(gets.chomp, 'O')
    end


    def change_current_player
      current_player == player_one ? player_two : player_one
    end

    def game_move
        move = current_player.player_moves
        move = current_player.player_moves until game_board.can_play_square?(move)
        move
    end

    def play_game
        while @moves <= 9
          move = game_move
          game_board.update_board(current_player.symbol, move)
          if current_player.player_wins?(game_board)
            current_player.winner_message
            break
          end
          @current_player = change_current_player
          @moves += 1
        end
    end

    def tie_message
        puts "Tie, no one wins!"
    end

    def start_game
        puts "\nLet's Tic-Tac-Toe!\n\n"
        assign_player_one
        assign_player_two
        game_board.display_board
        play_game
        tie_message if moves == 10
    end



    


end
