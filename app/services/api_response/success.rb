module ApiResponse
  class Success
    def initialize(data)
      @data = data
    end

    def to_json
      JSON.generate(data.to_hash)
    end

    def status
      :ok
    end

    private
    attr_reader :data
  end
end
