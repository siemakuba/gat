class PanelProvidersStrategies
  include Enumerable

  class Values < Struct.new(:code, :data_source, :data_kind, :strategy)
  end

  def each(&block)
    strategies.each(&block)
  end

  private

  def strategies
    [
      Values.new(:provider1, 'http://time.com', :html, :letters),
      Values.new(:provider2, 'http://openlibrary.org/search.json?q=the+lord+of+the+rings', :json, :arrays),
      Values.new(:provider3, 'http://time.com ', :html, :nodes)
    ]
  end
end
