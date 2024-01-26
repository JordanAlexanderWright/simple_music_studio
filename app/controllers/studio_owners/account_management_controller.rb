module StudioOwners
  class AccountManagementController < ApplicationController

    def edit
      # this worked, just didn not show in logs.... work on later
      # current_studio_owner.confirm_stripe_tos
    end

    def index
    end

    def accept_tos
      Rails.logger.info "Accept TOS action called"
      current_studio_owner.confirm_stripe_tos
    end

  end
end
