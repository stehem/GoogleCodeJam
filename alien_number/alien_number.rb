require_relative "number"

class AlienNumber

  def initialize(language)
    @language = language.split("")
    @number = Number.new(@language)
  end

  def count_to(i, action=nil)
    number, count = @number.increment_number(@language[0]), 1
    while (action ? number : count) != i
      number = @number.increment_number(number)
      count += 1
    end
    action ? count : number
  end

end


