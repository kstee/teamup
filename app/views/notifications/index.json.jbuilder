json.array! @notifications do |notification|
  #json.recipient notification.recipient.name
  json.id notification.id
  json.actor notification.actor.name
  json.action notification.action
  json.notifiable do
    json.type "#{notification.notifiable.description}"
  end 
  json.url listing_path(notification.notifiable_id)
end