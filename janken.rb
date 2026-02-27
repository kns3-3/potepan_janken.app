class JankenGame
  HANDS = ["グー", "チョキ", "パー"] #ジャンケンの手を配列で定数として定義
  DIRECTIONS = ["上", "下", "左", "右"] #あっち向いてホイの方向を配列で定数として定義
  
  def initialize #インスタンス作成時に実行されるメソッド
    @call = "じゃんけん・・・" #最初のかけ声をインスタンス変数に保存
  end

  def input_janken_hand #ジャンケンの手を入力する処理
    loop do #正しい数字を入力するまでループする
      puts @call #「じゃんけん/あいこで」のセリフを表示
      puts "0:グー/1:チョキ/2:パー/3:戦わない"
      my_hand = gets.to_i #入力を数値に変換して変数に代入

      if my_hand == 3 #「3：戦わない」を選択したら
        puts "対戦を終了します"
        exit #プログラム自体を終了
      elsif my_hand >= 0 && my_hand <= 2 #0~2を選択したら
        return my_hand #その数字を呼び出し元に返す
      else #それ以外を選択したら
        puts "0~3の数字を入力してください"
      end
    end
  end

  def input_direction #あっち向いてホイの方向を入力する処理
    choice = 5 #範囲外の数字を代入しておくことで、while内の処理を1回は実行させる
    
    while choice < 0 || choice > 3 #入力された数字が0～3以外の間は以下をループする
      puts "あっち向いて～"
      puts "0:上/1:下/2:左/3:右"
      choice = gets.to_i #ループの中で入力を受ける

      if choice < 0 || choice > 3 #入力が範囲外の数字の場合、再入力させる
        puts "0~3の数字を入力してください"
      end
    end #条件がfalseになったら(0～3が入力されたら)ループを抜ける

    return choice #入力された数字を、input_directionを呼び出した側に返す
  end

  def play
    loop do #勝敗がつくまで繰り返す
      my_hand = input_janken_hand #ジャンケンの手を入力させる

      if @call == "あいこで・・・" #かけ声が「あいこ」かどうかでだす瞬間の台詞を使い分ける
        puts "ショ！"
      else #あいこ以外のかけ声
        puts "ホイ！"
      end

      puts "----------"

      puts "あなたは#{HANDS[my_hand]}を出しました"
      pc_hand = rand(0..2) #相手(PC)の手をランダム(0～2)で決定
      puts "相手は#{HANDS[pc_hand]}を出しました"

      puts "----------"

      if my_hand == pc_hand #あいこだった場合
        @call = "あいこで・・・" #かけ声を書き換える
        next #ループの先頭に戻る(ジャンケンからやり直す)
      elsif my_hand == 0 && pc_hand == 1 || #じゃんけんに勝った場合
            my_hand == 1 && pc_hand == 2 ||
            my_hand == 2 && pc_hand == 0
        case_pattern = :win #勝ち状態を保持
        @call = "じゃんけん・・・" #かけ声をリセット
      else  #じゃんけんに負けた場合
        case_pattern = :lose #負け状態を保持
        @call = "じゃんけん・・・" #かけ声をリセット
      end

      case case_pattern #あっちむいてホイのフェーズ
      when :win #じゃんけんで勝っている場合
        finger = input_direction #input_directionメソッドを呼び出し、結果をfingerに入れる

        puts "ホイ！"
        puts "----------"

        pc_face = rand(0..3) #相手が向く方向をランダム(0～3)で決定

        puts "あなた：#{DIRECTIONS[finger]}を指しました"
        puts "相手：#{DIRECTIONS[pc_face]}を向きました"

        if finger == pc_face #方向が一致したら勝ち
          puts "【あなたの勝ちです】"
          break #全体のループを抜けてプログラムを終了
        end

      when :lose #じゃんけんで負けている場合
        face = input_direction #input_directionメソッドを呼び出し、結果をfaceに入れる

        puts "ホイ！"
        puts "----------"

        pc_finger = rand(0..3) #相手が指す方向をランダム(0～3)で決定

        puts "あなた：#{DIRECTIONS[face]}を向きました"
        puts "相手：#{DIRECTIONS[pc_finger]}を指しました"

        if face == pc_finger #方向が一致したら負け
          puts "【あなたの負けです】"
          break #ループを抜けてプログラム終了
        end
      end #caseの終わり
    end #loopの終わり
  end #playの終わり
end #classの終わり

game = JankenGame.new #インスタンスを作成
game.play #ゲームを開始する