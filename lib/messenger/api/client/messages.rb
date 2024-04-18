require 'net/http'
require 'json'

module Messenger
  module Api
    module Client
      module Messages
        include Messenger::Api::HttpUtils

        MESSAGES_URI = 'http://localhost:3000/api/messages'

        def retrieve_all(offset, result_size)
          params = {offset_id: offset, size: result_size}
          retrieve_uri = create_uri(MESSAGES_URI)
          retrieve_uri.query = URI.encode_www_form(params)
          response = Net::HTTP.get_response(retrieve_uri)
          JSON.parse(response.body)
        end
    
        def retrieve(message_id)
          retrieve_uri = create_uri(MESSAGES_URI + "/#{message_id}")
          response = Net::HTTP.get_response(retrieve_uri)
          JSON.parse(response.body)
        end
    
        def retrieve_by_destination(destination, offset, result_size)
          params = {offset_id: offset, size: result_size, search_destination: destination}
          retrieve_uri = create_uri(MESSAGES_URI)
          retrieve_uri.query = URI.encode_www_form(params)
          response = Net::HTTP.get_response(retrieve_uri)
          JSON.parse(response.body)
        end
    
        def send_message(destination, content)
          request_data = message_request_data(destination, content)
          uri = create_uri(MESSAGES_URI + '/deliver')
          http = prepare_http(uri, false)
          req = prepare_request(uri, request_data)
          JSON.parse(http.request(req).body)
        end
    
        def message_request_data(destination, content)
          {}.tap do |r|
            r[:destination] = destination
            r[:content] = content
          end
        end
      end
    end
  end
end