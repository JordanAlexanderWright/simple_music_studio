module StudioOwners
  class StudioOwnersController < ApplicationController
    before_action :check_studio

    def index

    end

    def dashboard
      @students = User.where(studio_id: current_studio_owner.studio.id)
      @link = make_stripe_link
    end

    def make_stripe_link
      # Set your secret key. Remember to switch to your live secret key in production.
      # See your keys here: https://dashboard.stripe.com/apikeys
      Stripe.api_key = ENV["STRIPE_TEST_KEY"]

      response = Stripe::AccountLink.create({
                                   account: current_studio_owner.stripe_account_id,
                                   refresh_url: 'https://example.com/reauth',
                                   return_url: 'https://example.com/return',
                                   type: 'account_onboarding',
                                 })

      response.url
    end



    def check_studio
      puts 'hello'
      unless current_studio_owner.studio
        # Redirect to the studio creation path
        # Replace 'new_studio_path' with the correct path for your application
        redirect_to new_studio_path
      end
      # No need for an 'if' block since you're only handling the case where the studio does not exist
    end

  end
end
