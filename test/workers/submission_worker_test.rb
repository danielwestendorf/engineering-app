require File.expand_path "../../test_helper.rb", __FILE__

class SubmissionWorkerTest < Minitest::Test

  def setup
    ENV["RECAPTCHA_KEY"] = "abcd"
    ENV["FROM_EMAIL"] = "from@example.com"
    ENV["TO_EMAIL"] = "to@example.com"
    stub_request(:post, "https://www.google.com/recaptcha/api/siteverify").
      with(body: {secret: "abcd", remoteip: "1.1.1.1", response: "12345"}).
      to_return(body: "{\"success\": true}")
  end

  def test_responds_to_perform
    SubmissionWorker.new.perform({"g-recaptcha-response" => "12345", "email": "noreply@example.com"}, "1.1.1.1")

    assert 2, Mail::TestMailer.deliveries.length
  end

  def test_pass_recaptcha?
    assert true, SubmissionWorker.new.pass_recaptcha?("12345", "1.1.1.1")
  end

end
