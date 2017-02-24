module ApiResponse
  class Unauthorized
    def initialize(auth_key)
      @auth_key = auth_key
    end

    def to_json
      JSON.generate(response_hash)
    end

    def status
      :unauthorized
    end

    private
    attr_reader :auth_key

    def response_hash
      { auth_key: auth_key }
    end
  end
end
