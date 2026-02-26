call = "じゃんけん・・・" #かけ声を変数に入れる(あいこの時に書き換える)
loop do #勝敗がつくまで繰り返す
    direction = ["上", "下", "左", "右"] #数字を言葉に変換するために配列に格納する
    puts call #現在のかけ声(じゃんけん/あいこでを表示)
    puts "0:グー/1:チョキ/2:パー/3:戦わない"
    my_hand = gets.to_i #入力を数値に変換して変数に代入

    if my_hand == 3 #「3：戦わない」を選択したら
      puts "対戦を終了します"
      exit #ループ処理を抜ける
    elsif my_hand < 0 || my_hand > 2 #入力が0より小さいか、2より大きい場合(3は処理済)
      puts "0~3の数字を入力してください"
      next #ループのはじめに戻る(再入力を求める)
    end

    if call == "あいこで・・・" #かけ声が「あいこ」かどうかでだす瞬間の台詞を使い分ける
      puts "ショ！"
    else #あいこ以外のかけ声
      puts "ホイ！"
    end
    puts "----------"

    if my_hand == 0
      puts "あなたはグーを出しました"
    elsif my_hand == 1
      puts "あなたはチョキを出しました"
    else
      puts "あなたはパーを出しました"
    end

    pc_hand = rand(0..2) #相手(PC)の手をランダム(0～2)で決定
    if pc_hand == 0
      puts "相手はグーを出しました"
    elsif pc_hand == 1
      puts "相手はチョキを出しました"
    else
      puts "相手はパーを出しました"
    end
    puts "----------"

    if my_hand == pc_hand #あいこだった場合
      call = "あいこで・・・" #かけ声を書き換える
      next #ループの先頭に戻る
    #じゃんけんに勝った場合
    elsif my_hand == 0 && pc_hand == 1 || 
          my_hand == 1 && pc_hand == 2 ||
          my_hand == 2 && pc_hand == 0
      case_pattern = "win"
      call = "じゃんけん・・・" #かけ声をリセット
    #じゃんけんに負けた場合
    else 
      case_pattern = "lose"
      call = "じゃんけん・・・" #かけ声をリセット
    end

    case case_pattern #あっちむいてホイのフェーズ
    when "win" #じゃんけんで勝っている場合
      finger = 5 #範囲外の数字を代入しておくことで、while内の処理を実行させる
      while finger < 0 || finger > 3 #入力された数字が 0より小さいか、3より大きい間は入力画面をループする
        puts "あっち向いて～"
        puts "0:上/1:下/2:左/3:右"
        finger = gets.to_i
        if finger < 0 || finger > 3 #範囲外の数字の場合、再入力させる
          puts "0~3の数字を入力してください"
        end
    end

    puts "ホイ！"
    puts "----------"

    pc_face = rand(0..3) #相手が向く方向をランダム(0～3)で決定

    puts "あなた：#{direction[finger]}を差しました"
    puts "相手：#{direction[pc_face]}を向きました"

    if finger == pc_face #方向が一致したら勝ち
        puts "【あなたの勝ちです】"
        break #全体のループを抜けてプログラムを終了
    end

    when "lose" #じゃんけんで負けた場合
      face = 5  #範囲外の数字を代入しておくことで、while内の処理を実行させる
      while face < 0 || face > 3 #入力された数字が 0より小さいか、3より大きい間は入力画面をループする
         puts "あっち向いて～"
         puts "0:上/1:下/2:左/3:右"
         face = gets.to_i
         if face < 0 || face > 3 #範囲外の数字の場合、再入力させる
             puts "0~3の数字を入力してください"
         end
    end

    puts "ホイ！"
    puts "----------"

    pc_finger = rand(0..3) #相手が指す方向をランダム(0～3)で決定

    puts "あなた：#{direction[face]}を向きました"
    puts "相手：#{direction[pc_finger]}を指しました"
    if face == pc_finger
        puts "【あなたの負けです】"
        break #ループを抜けてプログラム終了
    end
  end #caseの終わり
end #loopの終わり

