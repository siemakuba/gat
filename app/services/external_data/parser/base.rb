module ExternalData
  module Parser
    class Base
      def perform(data)
        @data = data
        @parsed_data ||= parse_data
      end

      private
      attr_reader :data
    end
  end
end
