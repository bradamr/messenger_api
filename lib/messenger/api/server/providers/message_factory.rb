module Messenger
  module Api
    module Server
      module Providers
        class MessageFactory
          def self.create(provider, message)
            case provider
            when :simulation
              Providers::Simulation.deliver(message)
            end
          end
        end
      end
    end
  end
end
