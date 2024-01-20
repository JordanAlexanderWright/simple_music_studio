class TestMailer < ApplicationMailer

  def simple_test
    mail(
      to: "jaws610@gmail.com",
      subject: 'This is a test',
      content_type: 'text/html',
    )
  end
end
