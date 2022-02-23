HANDS = ['グー','チョキ','パー']
DIRECTIONS = ['上','下','左','右']
LINE = '-' * 25

def random_hand(type)
  
  [*0...type.length].sample
end

def my_turn?(user_hand, pc_hand)
 
  ((user_hand == 0) && (pc_hand == 1)) ||
  ((user_hand == 1) && (pc_hand == 2)) ||
  ((user_hand == 2) && (pc_hand == 0))
end

def input_janken

  loop do
    puts 'グー(0) / チョキ(1) / パー(2) / 戦はない(3) \n\n'

    user_hand = gets.chomp

    exit if user_hand == "3"
    
    if ["0","1","2"].include?(user_hand)
      break user_hand.to_i
    else
      puts '入力された値が不正です。もう一度入力してください。'
    end
  end
end

def input_game
  
  loop do
    puts <<-EOS
      　　上(0)
      左(2)　　右(3)
      　　下(1)
    EOS
    

    user_way = gets.chomp
    if ["0","1","2","3"].include?(user_way)
      break user_way.to_i
    else
      puts '入力された値が不正です。もう一度入力してください。'
    end
  end
end

def output_janken(user_hand)
  
  loop do
    pc_hand = random_hand(HANDS)
    puts LINE
    puts "あなた: #{HANDS[user_hand]}を出しました"
    puts "相手: #{HANDS[pc_hand]}を出しました"
    puts LINE
    if user_hand == pc_hand
      puts 'あいこで...'
      user_hand = input_janken
      puts 'ショ！'
    else
      break pc_hand
    end
  end
end

def output_game(user_way)
  pc_way = random_hand(DIRECTIONS)
  puts LINE
  puts "あなた: #{DIRECTIONS[user_way]}"
  puts "相手: #{DIRECTIONS[pc_way]}"
  puts LINE
  pc_way
end

def win
  puts 'あなたの勝ちです!'
end

def lose
  puts 'あなたの負けです！'
end

# ===== GAME START =====
will_continue = true


while will_continue
 
  puts 'じゃんけん...'
  user_hand = input_janken
  puts 'ホイ！'
  pc_hand = output_janken(user_hand)

  
  puts "あっち向いて〜#{my_turn?(user_hand, pc_hand) ? '(指を差す側)' : '(顔を向ける側)'}"
  user_way = input_game
  puts 'ホイ！'
  pc_way = output_game(user_way)

  
  if user_way == pc_way 
    will_continue = false
    
    my_turn?(user_hand, pc_hand) ? win : lose
  end
end