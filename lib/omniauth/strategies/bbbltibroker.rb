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

      # Include the launch_nonce if it is part of the parameters in the request
      def setup_phase
        Rails.logger.debug "(bbbltibroker) Setup phase initiated in strategy."
        super
        request.env['omniauth.strategy'].options[:authorize_params][:launch_nonce] = request.params["launch_nonce"] if request.params["launch_nonce"].present?
      end

      def callback_url
        full_host + callback_path
      end

      def request_phase
        Rails.logger.debug "(bbbltibroker) Request phase initiated in strategy."
        super
      end

      def callback_phase
        Rails.logger.debug "(bbbltibroker) Callback phase initiated in strategy."
        super
      end
    end
  end
end
