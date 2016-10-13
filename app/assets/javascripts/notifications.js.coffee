class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $("[data-behavior='notifications']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )
  

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: -> $("[data-behavior='unread-count']").text(0)
    )   

  handleSuccess: (data) =>
    items = $.map data, (notification) ->
   
      
      "<p id='dropdown-text'><a class='dropdown-item' href='#{notification.url}'><em>#{notification.actor} #{notification.action} </em>[#{notification.notifiable.type}].</a></p>"
    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notification-items']").html(items)

jQuery ->
  new Notifications