module ApiData
  class Base
    include Enumerable

    def each(&block)
      collection_data.each(&block)
    end

    alias_method :to_hash, :to_h
  end
end
