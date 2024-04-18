# frozen_string_literal: true

require_relative "api/version"
require_relative "api/http_utils"
require_relative "api/string_utils"
require_relative "api/server"

require_relative "api/server/transmission.rb"

require_relative "api/server/providers/message_factory.rb"
require_relative "api/server/providers/simulation.rb"

require_relative "api/client/messages.rb"

module Messenger
  module Api
    class Error < StandardError; end
    # Your code goes here...
  end
end
