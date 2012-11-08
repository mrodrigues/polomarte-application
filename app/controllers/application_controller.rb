class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def setup_error_messages(errors)
      if errors.count > 1
        html = "<h1>Houveram #{errors.count} erros:</h1>"
      else
        html = "<h1>Houve 1 erro:</h1>"
      end
      html += "<ul>"
      errors.messages.each do |attribute, attribute_errors|
        attribute_errors.each do |message|
          html += "<li>#{message}</li>"
        end
      end
      html += "</ul>"
      html.html_safe
    end
end
