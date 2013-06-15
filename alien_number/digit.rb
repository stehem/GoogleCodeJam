class Digit

  def initialize(language)
    @language = language
  end

  def next_digit(digit)
    n_i = @language.each_with_index.detect { |n, i| i > index_for_digit(digit) }
    n_i[0] if n_i
  end

  private

  def index_for_digit(digit)
    @language.each_with_index.detect { |n, i| digit == n }[1]
  end

end


