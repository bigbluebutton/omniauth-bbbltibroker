require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bbbltibroker < OmniAuth::Strategies::OAuth2
      option :name, :bbbltibroker

      option :client_options, {
        site: "http://localhost:3000",
      }

      uid do
        raw_info["uid"]
      end

      info do
        info_map
      end

      def raw_info
        @raw_info ||= access_token.get("#{options[:raw_info_url] || ''}").parsed
      end

      def info_map
        map = {}
        options[:info_params].each do |param|
          map[param.to_sym] = raw_info[param]
        end
        map
      end

    end
  end
end
