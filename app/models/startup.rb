class Startup
    @@all=[]
    attr_reader :name, :founder, :domain
    attr_writer :name
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        attr_reader :domain
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        @all.find do |startup|
         startup.founder == name
        end
    end

    def self.domains
        @@all.map do |startup|
        startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def all_funding_rounds
        @total = FundingRound.all.select do |founding|
        founding.startup == self
        end
    end

    def num_funding_rounds
        all_funding_rounds.count
    end

    def total_funds
        sum=0
        all_funding_rounds.map do |fund|
        sum += fund.investment
        end
        sum
    end

    def investors
        (all_funding_rounds.map do |fund|
        fund.venture_capitalist
        end).uniq
    end
end
