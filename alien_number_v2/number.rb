require_relative "language"

class Numberv2

  def initialize(language, source)
    @language = Language.new(language)
    @digit = Digit.new(@language)
    @source = source
  end

  def count_to(n)
    n_to_a = n.split("")
    count = 0
    while n_to_a.any? 
      add = base_count(n_to_a)
      n_to_a.shift
      n_to_a.shift while n_to_a.first == @language.zero
      count += add
    end
    count.to_i
  end

  private

  def base_count(n)
    first_number = n[0]
    first_number_base_block = "#{first_number}#{@language.zero}"
    @count_for_first_number_base_block ||= {} 
    @count_for_first_number_base_block[first_number_base_block] ||= begin
       @source.count_to(first_number_base_block, :increment)
    end
    length = n.length
    @count_for_first_number_base_block[first_number_base_block]*(@language.length**(length-2))
  end

end

