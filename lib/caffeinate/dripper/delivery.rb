# frozen_string_literal: true

module Caffeinate
  module Dripper
    # Handles delivery of a `Caffeinate::Mailer` for a `Caffeinate::Dripper`.
    module Delivery
      # :nodoc:
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods
        # Delivers the given Caffeinate::Mailing
        #
        # @param [Caffeinate::Mailing] mailing The mailing to deliver
        def deliver!(mailing)
          if mailing.drip.parameterized?
            message = mailing.mailer_class.constantize.with(mailing: mailing).send(mailing.mailer_action)
          else
            message = mailing.mailer_class.constantize.send(mailing.mailer_action, mailing)
          end
          message.caffeinate_mailing = mailing
          message.deliver
        end
      end
    end
  end
end
