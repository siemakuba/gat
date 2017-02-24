module ApiResponse
  class Errors
    def initialize(error_messages)
      @error_messages = error_messages
    end

    def to_json
      JSON.generate(response_hash)
    end

    def status
      :unprocessable_entity
    end

    private
    attr_reader :error_messages

    def response_hash
      # move to I18n
      { errors: error_messages }
    end
  end
end
