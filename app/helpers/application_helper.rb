module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def flash_class(level)
    case level
      when :error then "callout alert"
    end
  end
end
