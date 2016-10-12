module ApplicationHelper

  def header(text)
    content_for(:header) { text.to_s }
  end

  # for mailboxer
  def active_page(active_page)
    @active == active_page ? "active" : ""
	end

end
