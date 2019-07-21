class Startup
    @@all = []

    attr_reader :founder, :domain
    attr_accessor :name

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

    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    # ! Associations and Aggregate Methods
    # !

    def all_fundingrounds
        FundingRound.all.select{|fundinground| fundinground.startup == self}
    end


    def sign_contract(venturecap, type, investment)
        FundingRound.new(venturecap, type, self, investment)
    end

    def num_funding_rounds
        self.all_fundingrounds.count
    end

    def total_funds
        self.all_fundingrounds.map{|fundinground| fundinground.investment}.inject(:+)
    end

    def investors
        self.all_fundingrounds.map{|fundinground| fundinground.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include? investor
        end
    end
end
