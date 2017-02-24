module ExternalData
  module Parser
    class Json < Base

      private

      def parse_data
        ::JSON.parse(data.to_s)
      end
    end
  end
end
