module Messenger
  module Api
    module Server
      module Providers
        class Simulation
          include Messenger::Api::HttpUtils

          attr_reader :message

          HOST = 'jo3kcwlvke.execute-api.us-west-2.amazonaws.com'.freeze
          END_POINT = 'dev/provider1'.freeze
          CALLBACK_END_POINT = '/api/messages/callback'.freeze

          def initialize(message)
            @message = message
          end

          def self.deliver(message)
            new(message).deliver
          end

          def deliver
            post(api_request)
          end

          private

          def api_request
            {}.tap do |h|
              h['to_number'] = message.destination
              h['message'] = message.content
              h['callback_url'] =
                "#{callback_url(CALLBACK_END_POINT)}?message_context_id=#{message.context_id}"
            end
          end
        end
      end
    end
  end
end
