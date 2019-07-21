class VentureCapitalist

  attr_reader :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|capitalist| capitalist.total_worth > 1000000000}
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}
  end

  def portfolio
    self.funding_rounds.map {|round| round.startup}.uniq
  end

  def biggest_investment
    largest = self.funding_rounds.map {|round| round.investment}.max
    self.funding_rounds.find {|round| round.investment == largest}
  end

  def invested(domain)
    rounds = self.funding_rounds.select {|round| round.startup.domain == domain}
    rounds.map {|round| round.investment}.sum
  end


end
