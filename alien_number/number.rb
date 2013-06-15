require_relative "digit"

class Number

  def initialize(language)
    @language = language
    @digit = Digit.new(@language)
  end

  def increment_number(number)
    possible_increment_index = first_possible_increment_index(number)
    n_to_a = number.split("")
    last_index = n_to_a.length-1
    if possible_increment_index
      n_to_a.tap do |nb| 
        nb[possible_increment_index] = @digit.next_digit(nb[possible_increment_index])
        if possible_increment_index < last_index
          (possible_increment_index+1..last_index).each { |i| nb[i] = @language[0] }
        end
      end.join("")
    else
      n_to_a.map { |x| @language[0] }.unshift(@language[1]).join("")
    end
  end

  private

  def first_possible_increment_index(number)
    d_i = number.split("").each_with_index.reverse_each.detect { |x, i| @digit.next_digit(x) }
    d_i[1] if d_i
  end

end


