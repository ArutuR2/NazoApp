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
    
    # 正解なら得点獲得/不正解なら0点
    if data.content == "correct"
      $("#point_"+data.nickname).html(data.time)
    else if data.content == "wrong"
      $("#point_"+data.nickname).html("0")

  
  answer: ->
    $("#startBtn").click()
    @perform 'answer'

  $ ->
    $("#countDownBtn").click (e)->
      $("#startBtn").click()
      $("#startBtn").css(opacity:0)
      App.answer.answer()

$ ->
  $(".btn-1").click (e)->
    App.answer.answer()


