class StudioOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :studio

  after_save :create_stripe_account

  #
  def create
  end

  def create_stripe_account
    # Set Stripe API key (better to move this to an initializer or use environment variable)
    Stripe.api_key = ENV["STRIPE_TEST_KEY"]

    begin
      response = Stripe::Account.create({
                                          type: 'custom',
                                          country: 'US',
                                          email: self.email, # Use 'self' to refer to the email of the StudioOwner instance
                                          capabilities: {
                                            card_payments: { requested: true },
                                            transfers: { requested: true },
                                          },
                                        })

      self.update_column(:stripe_account_id, response.id)

    rescue Stripe::StripeError => e

      Rails.logger.error "Stripe error while creating account: #{e.message}"
    end

  end

end
