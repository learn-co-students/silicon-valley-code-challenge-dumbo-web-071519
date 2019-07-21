require_relative '../config/environment.rb'


def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("foo", "Bro Dude", "dudes.com")
s2 = Startup.new("bar", "Bill Jims", "corn.com")

vc1 = VentureCapitalist.new("B.Hole", 200000)
vc2 = VentureCapitalist.new("S.Ish", 2000000000)
vc3 = VentureCapitalist.new("B.Boy", 500000)
vc4 = VentureCapitalist.new("Shoob", 1000000000)

fr1 = FundingRound.new(s1, vc1, "Angel", 50000)
fr2 = FundingRound.new(s1, vc2, "Seed A", 70000)
fr3 = FundingRound.new(s2, vc3, "Pre-Seed", 80000)
fr4 = FundingRound.new(s1, vc4, "Angel", 100000)

binding.pry
0 
#leave this here to ensure binding.pry isn't the last line