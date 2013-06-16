require_relative "../alien_number/alien_number"
require "minitest/autorun"
require 'benchmark'



class AlienNumberV2

  def initialize(language)
    @language = language
    @source = AlienNumber.new(@language)
    @digit = Digit.new(@language.split(""))
  end

  def base_count(n)
    first_number = n.split("")[0]
    first_number_base_block = "#{first_number}#{zero}"
    count_for_first_number_base_block = @source.count_to(first_number_base_block, :increment)
    length = n.split("").length
    count_for_first_number_base_block*(language_length**(length-2))
  end

  def zero
    @zero ||= @language.split("")[0][0]
  end

  def language_length
    @language_length ||= @language.split("").length
  end

  def count_to(n)
    n_to_a = n.split("")
    count = 0
    while n_to_a.any? 
      add = base_count(n_to_a.join(""))
      n_to_a.shift
      n_to_a.shift while n_to_a.first == zero
      count += add
    end
    count.to_i
  end

  def build_from(i)
    guess = initial_guess(i)

    (0..guess.length-1).each do |d|

      count = count_to(guess.join(""))

      while count < i
        next_digit = @digit.next_digit(guess[d])
        break unless next_digit
        possible_next = guess.dup.tap { |clone| clone[d] =  next_digit }.join("")
        count = count_to(possible_next)
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

  def initial_guess(i)
    number_of_digits = Math.log(i, language_length).ceil
    number_of_digits += 1 if number_of_digits - Math.log(i, language_length).floor == 0
    (1..number_of_digits).to_a.map { |d| zero}.tap { |g| g[0] = @language[1]}
  end

end


describe "V2" do

   it "works 3" do
    anv2 = AlienNumberV2.new('O!CDE?')
    anv3 = AlienNumberV2.new('A?JM!.')
    anv3.build_from(anv2.count_to("CODE")).must_equal("JAM!")
  end


  it "works" do
    anv2 = AlienNumberV2.new('0123456789abcdef')
    anv3 = AlienNumberV2.new('01')
    anv3.build_from(anv2.count_to("13")).must_equal("10011")
  end

  it "works 2" do
    anv2 = AlienNumberV2.new('0123456789')
    anv3 = AlienNumberV2.new('oF8')
    anv3.build_from(anv2.count_to("9")).must_equal("Foo")
  end
  
  it "works 4" do
    anv2 = AlienNumberV2.new('oF8')
    anv3 = AlienNumberV2.new('0123456789')
    anv3.build_from(anv2.count_to("Foo")).must_equal("9")
  end
 
  
end

puts Benchmark.measure {  
    anv2 = AlienNumberV2.new('$amn#Ed')
    anv3 = AlienNumberV2.new('Gge5/9YJQ-O3Sl${k;&uo(+[DRr62NdA])8<|@M')
    anv3.build_from(anv2.count_to('mnaan#mm#$n'))
}























