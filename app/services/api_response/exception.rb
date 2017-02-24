module ApiResponse
  class Exception
    def initialize(exception)
      @exception = exception
    end

    def to_json
      JSON.generate(response_hash)
    end

    def status
      :internal_server_error
    end

    private
    attr_reader :exception

    def response_hash
      # move to I18n
      { error: exception.message }
    end
  end
end
