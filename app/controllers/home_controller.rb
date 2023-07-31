class HomeController < ApplicationController

  def top
  end

  def q1
    @nickname = params[:nickname]
  end

  def q2
  end

  def log
    @logs = Log.all
  end

  def nickname
    @nickname = params[:nickname]
  end

  def menu
    @nickname = params[:nickname]
  end

  def question
    @qNum = params[:qNum]
    @nickname = params[:nickname]
    @logs = Log.all
  end

  def confirm
    @qNum = params[:qNum]
    @nickname = params[:nickname]
    @selfanswer = params[:selfanswer]

    @answersQueue = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",]

    if @selfanswer == @answersQueue[@qNum.to_i-1]
      @flag = Log.new(nickname:@nickname, content:@qNum)
      @flag.save
      ActionCable.server.broadcast "answer_channel", nickname:@nickname, content: @qNum
      redirect_to("/home/menu/" + @nickname)
    else
    end
  end

  def reset
    @A = Log.all
    @A.each do |keyA|
      keyA.destroy
    end
  end

end
