require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bbbltibroker < OmniAuth::Strategies::OAuth2
      option :name, :ltibroker

      option :client_options, {
        site: "http://localhost:3000",
      }

      uid do
        raw_info["uid"]
      end

      info do
        {
          full_name: raw_info["full_name"],
          first_name: raw_info["first_name"],
          last_name: raw_info["last_name"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get("#{options[:omniauth_root] || ''}/api/v1/user.json").parsed
      end

    end
  end
end
