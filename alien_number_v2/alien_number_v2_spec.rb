require "minitest/autorun"
require_relative "alien_number_v2"

describe "V2" do

   it "works 3" do
    anv2 = AlienNumberV2.new('O!CDE?')
    anv3 = AlienNumberV2.new('A?JM!.')
    anv3.build_from(anv2.number.count_to("CODE")).must_equal("JAM!")
  end


  it "works" do
    anv2 = AlienNumberV2.new('0123456789abcdef')
    anv3 = AlienNumberV2.new('01')
    anv3.build_from(anv2.number.count_to("13")).must_equal("10011")
  end

  it "works 2" do
    anv2 = AlienNumberV2.new('0123456789')
    anv3 = AlienNumberV2.new('oF8')
    anv3.build_from(anv2.number.count_to("9")).must_equal("Foo")
  end
  
  it "works 4" do
    anv2 = AlienNumberV2.new('oF8')
    anv3 = AlienNumberV2.new('0123456789')
    anv3.build_from(anv2.number.count_to("Foo")).must_equal("9")
  end
 
end
