module ExternalData
  module Parser
    class JSON < Base

      private

      def parse_data
        ::JSON.parse(data.to_s)
      end
    end
  end
end
