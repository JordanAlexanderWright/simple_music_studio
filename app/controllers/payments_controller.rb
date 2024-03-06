class PaymentsController < ApplicationController
  def payment_request
    Stripe.api_key = ENV["STRIPE_TEST_KEY"]

    # APPLICATION FEE AMOUNT, NEED LOGIC TO PASS A 1 % FEE, can't just pass a percentage

    session = Stripe::Checkout::Session.create({
                                                 line_items: [{
                                                                # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
                                                                price: 'price_1Or99UPXB9dK5njAyXr9bsjU',
                                                                quantity: 1,
                                                              }],
                                                 mode: 'payment',
                                                 payment_intent_data: { application_fee_amount: 100},
                                                 success_url: "http://localhost:3000/payment_success",
                                                 cancel_url: "http://localhost:3000/payment_failure",
                                                 automatic_tax: {enabled: false},
                                               },
                                               {stripe_account: 'acct_1Or8OZPXB9dK5njA'}
                                                )
    redirect_to session.url, status: 303, allow_other_host: true
  end

  def success

  end

  def failure

  end
end
