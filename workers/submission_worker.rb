require "json"
require "net/http"

class SubmissionWorker
  include Sidekiq::Worker
  include ActionView::Helpers::TextHelper

  def perform(params, remote_ip)
    if pass_recaptcha?(params["g-recaptcha-response"], remote_ip) == false
      puts "Recaptcha failed! #{params["g-recaptcha-response"]}, #{remote_ip}"
      return false
    end

    body = app_body(params)

    Mail.deliver do
      to params["email"]
      from ENV["FROM_EMAIL"]
      subject "Engineering Application Recieved"
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "Hi there,<br>We've recieved your application. We'll be in touch soon!<br>#{body}"
      end
    end

    Mail.deliver do
      from params["email"]
      to ENV["TO_EMAIL"]
      subject "Engineering Application Recieved"
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "We've recieved an application.<br>#{body}"
      end
    end
  end

  def pass_recaptcha?(response, ip)
    res = Net::HTTP.post_form(
      URI.parse("https://www.google.com/recaptcha/api/siteverify"),
      {
        secret: ENV["RECAPTCHA_KEY"],
        remoteip: ip,
        response: response
      }
    )

    JSON.parse(res.body)["success"] == true
  end

  def app_body(params)
    "Name: #{params["name"]}<br>Email: #{params["email"]}<br>Github Profile URL: #{params["github_profile_url"]}<br>Why work with us? #{simple_format(params["cover_letter"])}"
  end
end