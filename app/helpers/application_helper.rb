module ApplicationHelper
  def flash_class(level)
    case level
      when :error then "callout alert"
    end
  end
end
