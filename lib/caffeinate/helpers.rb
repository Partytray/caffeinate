# frozen_string_literal: true

module Caffeinate
  # URL helpers for accessing the mounted Caffeinate instance.
  module Helpers
    def caffeinate_unsubscribe_url(subscription, options = {})
      opts = (::ActionMailer::Base.default_url_options || {}).merge(options)
      Caffeinate::Engine.routes.url_helpers.unsubscribe_campaign_subscription_url(token: subscription.token, **opts)
    end

    def caffeinate_subscribe_url(subscription, options = {})
      opts = (::ActionMailer::Base.default_url_options || {}).merge(options)
      Caffeinate::Engine.routes.url_helpers.subscribe_campaign_subscription_url(token: subscription.token, **opts)
    end

    def caffeinate_unsubscribe_path(subscription, options = {})
      Caffeinate::Engine.routes.url_helpers.unsubscribe_campaign_subscription_path(token: subscription.token, **options)
    end

    def caffeinate_subscribe_path(subscription, options = {})
      Caffeinate::Engine.routes.url_helpers.subscribe_campaign_subscription_path(token: subscription.token, **options)
    end
  end
end
