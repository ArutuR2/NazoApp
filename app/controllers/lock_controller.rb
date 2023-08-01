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

    def reset
        @A = TimeCount.all
        @A.each do |keyA|
          keyA.destroy
        end
    end
end
