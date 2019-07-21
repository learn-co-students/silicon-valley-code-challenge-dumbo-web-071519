require 'pry'
class Startup
  attr_reader :name, :founder, :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    self.all.find {|startup| startup.founder == founder_name}
  end

  def self.domains
    self.all.map {|startup| startup.domain}
  end

  def sign_contract(capitalist, type, amount)
    FundingRound.new(self, capitalist, type, amount)
  end

  def rounds
    FundingRound.all.select {|round| round.startup == self}
  end

  def num_funding_rounds
    self.rounds.size
  end

  def total_funds
    self.rounds.map {|round| round.investment}.sum
  end

  def investors
    self.rounds.map {|round| round.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end


end
