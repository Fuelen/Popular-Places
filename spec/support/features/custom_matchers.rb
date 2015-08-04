module Features
  module CustomMatchers
    def has_alert?(text, type = :success)
      has_css? "div.alert.alert-dismissable.alert-#{type}", text: text
    end
  end
end
Capybara::Session.send(:include, Features::CustomMatchers)
