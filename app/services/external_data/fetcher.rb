module ExternalData
  class Fetcher
    OK_RESPONSE_CODE = 200

    def initialize(source:, parser: ExternalData::Parser::HTML.new)
      @source = source
      @parser = parser
    end

    def fetch
      parsed_response_data if success?
    end

    private
    attr_reader :source, :parser
    delegate :body, :status, to: :response, prefix: true

    def parsed_response_data
      parser.perform(response_body)
    end

    def response
      @response ||= ::Excon.get(source)
    end

    def success?
      response_status == OK_RESPONSE_CODE
    end
  end
end
