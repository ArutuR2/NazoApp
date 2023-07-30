point = 3

App.answer = App.cable.subscriptions.create "AnswerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log data.message
    point -= 1
    $('.status').html("いまこの問題に正解すると"+point+"点獲得")
    $('.status').html(data.message)

    $('.solveLog').html(data.message)
    $('.solveLogBox').append('<p>' + data.message + '</p>');

    

  answer: ->
    @perform 'answer'

$ ->
  $(".btn-1").click (e)->
    App.answer.answer()
 