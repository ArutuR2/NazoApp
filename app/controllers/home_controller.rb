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
  end

  def confirm
    @nickname = params[:nickname]
    @selfanswer = params[:selfanswer]
    if @selfanswer == "こたえ"
      @flag = Log.new(content: @nickname)
      @flag.save
      ActionCable.server.broadcast "answer_channel", message: "fuga"
      redirect_to("/home/q2/" + @nickname)
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
