module Ragnarok
  module Parser
    def nokogiri(path)
      Nokogiri::HTML.parse(File.read(path), nil, 'utf-8')
    end

    module_function :nokogiri
  end
end

