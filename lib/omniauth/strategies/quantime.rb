require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Quantime < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "quantime"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site => "http://lvh.me:3000",
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        prune!({
          :name => raw_info['id'],
          :email => raw_info['email']
        })
      end

      extra do
        prune!({
          'raw_info' => raw_info
        })
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'quantime', 'Quantime'