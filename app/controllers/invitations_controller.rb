class InvitationsController < ApplicationController

  def send_invitation
    email = params[:email]
    studio = params[:studio]
    StudioInvitationsMailer.with(email: email, studio: studio).studio_invitation.deliver_now

    render json: { status: 'success' }
  end
end
