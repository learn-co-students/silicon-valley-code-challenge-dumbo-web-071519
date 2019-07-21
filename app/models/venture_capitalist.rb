class VentureCapitalist
    @@all = []

    attr_reader :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select{ |venturecap| venturecap.total_worth > 1000000000}
    end

    # ! Associations and Aggregate Methods
    # !
    
    def offer_contract(startup, type, investment)
        FundingRound.new(self, type, startup, investment.to_f)
    end
    
    def funding_rounds
        FundingRound.all.select{|fundinground| fundinground.venture_capitalist == self}
    end

    def portfolio
      self.funding_rounds.map{|fundinground| fundinground.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.inject do |memo, fundinground|
            if memo.investment < fundinground.investment
                fundinground
            else
                memo
            end
        end
    end

    def invested(domain)
        invested_into = self.funding_rounds.select{|fundinground| fundinground.startup.domain == domain}
        invested_into.map{|fundinground| fundinground.investment}.inject(:+)
    end
end
