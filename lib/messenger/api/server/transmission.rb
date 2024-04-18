module Messenger
  module Api
    module Server
      class Transmission
        attr_reader :message, :provider

        def initialize(message, provider)
          @message = message
          @provider = provider
        end

        def self.deliver_message(message, provider = :simulation)
          new(message, provider).deliver_message
        end

        def deliver_message
          Providers::MessageFactory.create(provider, message)
        end
      end
    end
  end
end
