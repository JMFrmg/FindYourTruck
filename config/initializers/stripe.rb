Rails.configuration.stripe = {
  :publishable_key => 'pk_test_VN2133UEZJbxWPQ1YGpR6r8N',
  :secret_key      => 'sk_test_3v6JCIDQmKdL9JjEg0dgjhr3'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
