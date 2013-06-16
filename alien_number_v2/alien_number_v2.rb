require_relative "../alien_number/alien_number"
require_relative "number"

class AlienNumberV2

  def initialize(language)
    @language = Language.new(language)
    @source = AlienNumber.new(language)
    @digit = Digit.new(language.split(""))
    @number = Numberv2.new(language, @source)
  end

  def build_from(i)
    guess = initial_guess(i)
    (0..guess.length-1).each do |d|

      count = @number.count_to(guess.join(""))

      while count < i
        next_digit = @digit.next_digit(guess[d])
        break unless next_digit
        possible_next = guess.dup.tap { |clone| clone[d] =  next_digit }.join("")

        count = @number.count_to(possible_next)
        if count == i
          guess[d] = next_digit
          break
        elsif count > i
          break
        end
        guess[d] = next_digit
      end

    end
    guess.join("")
  end


  def number
    @number
  end

  private

  def initial_guess(i)
    number_of_digits = Math.log(i, @language.length).ceil
    number_of_digits += 1 if number_of_digits - Math.log(i, @language.length).floor == 0
    (1..number_of_digits).to_a.map { |d| @language.zero}.tap { |g| g[0] = @language.language[1]}
  end

end


























