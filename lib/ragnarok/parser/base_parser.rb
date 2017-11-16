module Ragnarok
  module Parser
    class BaseParser
      def parse
        raise NotImplementedError
      end

      def split_colon(text)
        text.split(/:/).last.to_i
      end

      def self.nokogiri(path)
        Nokogiri::HTML.parse(File.read(path), nil, 'utf-8')
      end
    end
  end
end

