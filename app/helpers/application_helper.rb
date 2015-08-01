module ApplicationHelper
  def flash_alert(message,type = :success)
    content_tag :div, class: "alert alert-dismissable alert-#{type}" do
      content_tag(:button, '&times;'.html_safe, class: :close,
                  'data-dismiss': 'alert') + message
    end
  end

  def list_flash_alerts
    flash.map { |type, message| flash_alert message, type }.join.html_safe
  end
end
