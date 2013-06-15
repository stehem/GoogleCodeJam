require "minitest/autorun"
require_relative "alien_number"

describe AlienNumber do

  it "works for the first example" do
    source = AlienNumber.new("0123456789")
    count = source.count_to("9", :increment)
    target = AlienNumber.new("oF8")
    target.count_to(count).must_equal("Foo")
  end


  it "works for the second example" do
    source = AlienNumber.new("oF8")
    count = source.count_to("Foo", :increment)
    target = AlienNumber.new("0123456789")
    target.count_to(count).must_equal("9")
  end

  it "works for the third example" do
    source = AlienNumber.new("0123456789abcdef")
    count = source.count_to("13", :increment)
    target = AlienNumber.new("01")
    target.count_to(count).must_equal("10011")
 end

  it "works for the fourth example" do
    source = AlienNumber.new("O!CDE?")
    count = source.count_to("CODE", :increment)
    target = AlienNumber.new("A?JM!.")
    target.count_to(count).must_equal("JAM!")
  end

end





