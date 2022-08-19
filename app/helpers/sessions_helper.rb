module SessionsHelper
  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, class: "flash #{key}" if msg.present?
    end.join
  end
end
