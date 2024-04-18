require 'net/http'
require 'json'

module Messenger
  module Api
    module HttpUtils
      def host
        self.class::HOST
      end
  
      def endpoint
        self.class::END_POINT
      end
  
      def content_headers
        {'Content-Type' => 'application/json'}
      end
  
      # @context_path = route_path()
      def callback_url(context_path)
        "http://xwps.com:3000#{context_path}"
      end
  
      def full_uri(port = 443, https = false, context = nil)
        URI("#{port == 443 || https ? 'https' : 'http'}://#{host}/#{context.nil? ? endpoint : context}")
      end

      def create_uri(uri)
        URI(uri)
      end
  
      def post(request_data)
        uri = full_uri
        http = prepare_http(uri)
        req = prepare_request(uri, request_data)
        http.request(req)
      end
  
      def prepare_http(uri, use_ssl = true)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = use_ssl
        http
      end
  
      def prepare_request(uri, request_data)
        req = Net::HTTP::Post.new(uri.path, content_headers)
        req.body = request_data.to_json
        req
      end
    end
  end
end
