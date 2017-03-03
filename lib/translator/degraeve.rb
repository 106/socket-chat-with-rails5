module Translator
  class Degraeve < Base
    BASE_URL = 'http://www.degraeve.com/cgi-bin/babel.cgi'.freeze

    def translate!
      api_call.search('blockquote').text.strip
    end

    def url
      uri = URI.join(BASE_URL)
      uri.query = query_hash.to_query
      uri.to_s
    end

    def api_call
      Nokogiri::HTML(open(url))
    end

    def query_hash
      { d: dialects[dialect], w: message }
    end

    def dialects
      { 'Yoda' => 'yoda',
        'Valley Girl' => 'valley',
        'Binary Code' => 'binary' }.freeze.with_indifferent_access
    end
  end
end
