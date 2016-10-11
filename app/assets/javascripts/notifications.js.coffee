class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    console.log(@notifications)
    @setup() if @notifications.length > 0

  setup: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleSuccess: (data) =>
    console.log(data)

jQuery ->
  new Notifications