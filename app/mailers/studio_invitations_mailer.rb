class StudioInvitationsMailer < ApplicationMailer

  def studio_invitation()
    @email = params[:email]

    @studio = Studio::find(params[:studio])

    mail(
      to: "jaws610@gmail.com",
      subject: 'Test Invitation',
      content_type: 'text/html',
      )
  end

end
