class AnswerChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "answer_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def answer
    ActionCable.server.broadcast "answer_channel", message: "hoge"
  end
end
