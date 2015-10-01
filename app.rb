require File.expand_path '../init', __FILE__
require File.expand_path '../lib/params_validator', __FILE__
require File.expand_path '../workers/submission_worker', __FILE__

class EngineeringApp < Sinatra::Base
  include ParamsValidator

  EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  set :sessions, true
  set :static, true
  set :show_exceptions, :after_handler

  get "/" do
    haml :index
  end

  post "/apply" do
    req :name, :email, :github_profile_url, :cover_letter, "g-recaptcha-response"
    fmt :email, EMAIL_REGEX
    fmt :github_profile_url, /https?:\/\/(www\.)?github\.com\/.+/

    puts "Success! #{name}, #{email}, #{github_profile_url}, #{cover_letter}"

    SubmissionWorker.perform_async(params, request.ip)

    haml :apply
  end

  error ParamsValidator::RequestInvalid do
    status 422
    env['sinatra.error'].message
  end
end