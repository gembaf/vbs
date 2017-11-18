module Ragnarok
  module Parser
    class BaseParser
      def parse
        raise NotImplementedError
      end

      def split_colon(text)
        text.split(/:/).last.to_i
      end
    end
  end
end

