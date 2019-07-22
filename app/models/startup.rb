class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
        "Startup name & Domain has Changed to #{name}:#{domain}"
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        Startup.all.find{ |startup| startup.founder == founder_name}
    end

    def self.domains
        Startup.all.map do |startup| 
        startup.domain
        end.uniq
    end

    #part 2
    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.count{|round| round.startup == self}
    end

    def total_funds
        FundingRound.all.sum{|round| round.investment}
    end

    def investors
        FundingRound.all.map do |round|
            round.venture_capitalist
        end.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end.uniq
    end


end
