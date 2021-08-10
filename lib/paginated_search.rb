class PaginatedSearch
  include Enumerable

  def initialize(&block)
    @block = block
  end

  def each
    return to_enum(:each) unless block_given?

    offset = 0

    loop do
      results = @block.call(offset)

      break if results.length == 0

      results.each do |result|
        yield result
      end

      offset += results.length
    end
  end
end
