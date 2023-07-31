App.answer = App.cable.subscriptions.create "AnswerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    console.log data.message
    $('.solveLog').html(data.message)
    $('.solveLogBox').append('<p>' + data.message + '</p>');

    # 正解した場所のLOCKが不透明になる
    for i in [1..16]
      console.log data.message
      if data.message == i.toString()
        $('#LOCK'+i.toString()).css(opacity:1);

  
  answer: ->
    @perform 'answer'

$ ->
  $(".btn-1").click (e)->
    App.answer.answer()
 