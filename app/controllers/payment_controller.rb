class PaymentController < ApplicationController
  # skip_before_action :verify_authenticity_token, :only => :create
  def page
  end
  def create
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = "sk_test_KILRi7ILJX3Jlw0DM5BmVzF5"

    # Token is created using Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]

    logger.debug("11111111111")
    logger.debug(params[:amount].to_i)
    logger.debug("11111111111")
    # was getting an invalid integer error if the cost is a float point
    charge = Stripe::Charge.create({
        amount: params[:amount].to_i,
        currency: 'usd',
        description: 'Example charge',
        source: token,
        receipt_email: current_user.email,
    })
    redirect_to payment_page_path
  end
end
