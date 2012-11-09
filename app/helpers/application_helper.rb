module ApplicationHelper
  def title
    text = "TODO"
    if @title
      text += " | #{@title}"
    end
    text
  end
end
