class VentureCapitalist
    @@all = []
    attr_reader :name
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select do |capitalist|
        capitalist.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new( startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |fund|
            fund.venture_capitalist == self
        end
    end

    def portfolio
        (funding_rounds.map do |fund|
         fund.startup
         end).uniq
    end

    def biggest_investment
        bigest=0
        funding_rounds.map do |fund|
          if fund.investment > bigest
           bigest=fund.investment
          end
        end
        bigest
    end

    def invested(some_domain)
        total_amount = 0
        funding_rounds.map do |fund|
         if fund.startup.domain == some_domain
            total_amount += fund.investment
         end
        end
        total_amount
    end
end


