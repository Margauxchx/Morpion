require_relative 'Player'
require_relative 'BoardCase'
# require_relative 'lib/Board'

class Game
# Présentation du jeux
puts "----------------------------------------"
puts "|        Bienvenue sur ce jeu           |"
puts "| Le but sera de battre ton adversaire  |"
puts "----------------------------------------"
puts
puts "\nPlayer 1\nQuel est ton prénom?"
name1 = gets.chomp.to_s
player1 = Player.new("#{name1}")
puts "#{name1} ton signe sera la X"  
puts "\nPlayer 2\nQuel est ton prénom?"
name2 = gets.chomp.to_s
player2 = Player.new("#{name2}")
puts "#{name2} ton signe sera le O"  
puts "\n#{name1} vs #{name2}"
puts "Faites vos jeux"

# Création de la grille
localization = BoardCase.new
A = BoardCase.new
B = BoardCase.new
C = BoardCase.new
localization.localization_nb
A.localization_letter("A")
B.localization_letter("B")
C.localization_letter("C")

while 1
  localization.show_board
  A.show_board
  B.show_board
  C.show_board
  #début du jeu
  puts "#{name1} choisie une case (ex: A1)"
  position = gets.chomp
  if position[0] == "A"
    A.filling(position[1].to_i, "X")
  elsif position[0] == "B"
    B.filling(position[1].to_i, "X")
  elsif position[0] == "C"
    C.filling(position[1].to_i, "X")
  end

  localization.show_board
  A.show_board
  B.show_board
  C.show_board
  #check si victoire PLAYER 1
  if A.array[1] == "X" && A.array[2] == "X" && A.array[3] == "X" ||
     B.array[1] == "X" && B.array[2] == "X" && B.array[3] == "X" ||
     C.array[1] == "X" && C.array[2] == "X" && C.array[3] == "X" ||
     A.array[1] == "X" && B.array[2] == "X" && C.array[3] == "X" ||
     C.array[1] == "X" && B.array[2] == "X" && A.array[3] == "X" ||
     A.array[1] == "X" && B.array[1] == "X" && C.array[1] == "X" ||
     A.array[2] == "X" && B.array[2] == "X" && C.array[2] == "X" ||
     A.array[3] == "X" && B.array[3] == "X" && C.array[3] == "X" 
    puts "VICTOIRE de #{name1} ! Relance le programme pour rejouer"
    break
  end

  # CHECK GRILLE PLEINE
  if A.array[1] != " " && A.array[2] != " " && A.array[3] != " " &&
     B.array[1] != " " && B.array[2] != " " && B.array[3] != " " &&
     C.array[1] != " " && C.array[2] != " " && C.array[3] != " "
    puts "Dommage, match NUL ! Relance le programme pour rejouer"
    break
  end

  #joueur 2
  puts "#{name2} choisie une case (ex: A1)"
  position = gets.chomp
  if position[0] == "A"
    A.filling(position[1].to_i, "O")
  elsif position[0] == "B"
    B.filling(position[1].to_i, "O")
  elsif position[0] == "C"
    C.filling(position[1].to_i, "O")
  end

  #CHECK VICTOIRE PLAYER 2
  if A.array[1] == "O" && A.array[2] == "O" && A.array[3] == "O" ||
    B.array[1] == "O" && B.array[2] == "O" && B.array[3] == "O" ||
    C.array[1] == "O" && C.array[2] == "O" && C.array[3] == "O" ||
    A.array[1] == "O" && B.array[2] == "O" && C.array[3] == "O" ||
    C.array[1] == "O" && B.array[2] == "O" && A.array[3] == "O" ||
    A.array[1] == "O" && B.array[1] == "O" && C.array[1] == "O" ||
    A.array[2] == "O" && B.array[2] == "O" && C.array[2] == "O" ||
    A.array[3] == "O" && B.array[3] == "O" && C.array[3] == "O" 
   puts "VICTOIRE de #{name2} ! Relance le programme pour rejouer"
   break
 end
end
end

