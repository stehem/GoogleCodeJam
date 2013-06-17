class Digit

  def initialize(language)
    @language = language
  end

  def next_digit(digit)
    @n_i ||= {}
    @n_i[digit] ||= begin @language.each_with_index.detect { |n, i| i > index_for_digit(digit) }
    end
    @n_i[digit][0] if @n_i[digit]
  end

  def previous_digit(digit)
    @n_i ||= {}
    @n_i[digit] ||= begin @language.each_with_index.detect { |n, i| i < index_for_digit(digit) }
    end
    @n_i[digit][0] if @n_i[digit]
  end


  private

  def index_for_digit(digit)
    @language.each_with_index.detect { |n, i| digit == n }[1]
  end

end


