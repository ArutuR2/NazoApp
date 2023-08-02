class LockController < ApplicationController

    def nickname
        @nickname = params[:nickname]
    end

    def room
        @nickname = params[:nickname]
    end
    
    def getCount
        @nickname = params[:nickname]
        @count = params[:count]
        @flag = TimeCount.create(nickname:@nickname, time:@count)
        ActionCable.server.broadcast "answer_channel", nickname:@nickname, content: @count
    end

    def system
        @logs = TimeCount.all
    end
    
    def judge
        @nickname1 = params[:nickname1]
        @nickname2 = params[:nickname2]
        @time1 = params[:time1]
        @time2 = params[:time2]
        # 人数に応じて増やす
        @judge1 = params[:judge1]
        @judge2 = params[:judge2]
        @judge3 = params[:judge3]
        ActionCable.server.broadcast "answer_channel", nickname:@nickname1, content: @judge1, time: @time1
        ActionCable.server.broadcast "answer_channel", nickname:@nickname2, content: @judge2, time: @time2
    end

    def reset
        @A = TimeCount.all
        @A.each do |keyA|
          keyA.destroy
        end
    end
end
