App.answer = App.cable.subscriptions.create "AnswerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    console.log data.nickname
    console.log data.content
    $('.solveLog').html("最新：" + data.nickname + "がQ" + data.content + "に正解しました")
    $('.solveLogBox').append('<p>' + data.nickname + "がQ" + data.content + "に正解しました" + '</p>');

    # 正解した場所のLOCKが不透明になる
    for i in [1..16]
      if data.content == i.toString()
        $('#LOCK'+i.toString()).css(opacity:1);

  
  answer: ->
    @perform 'answer'

$ ->
  $(".btn-1").click (e)->
    App.answer.answer()

$('.solveLog').html("テスト：" + @nickname)