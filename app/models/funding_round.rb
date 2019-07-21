class FundingRound
    @@all = []

    attr_reader :venture_capitalist, :startup
    attr_reader :type, :investment

    def initialize(venture_capitalist, type, startup, investment)
        @venture_capitalist = venture_capitalist
        @type = type
        @startup = startup
        @investment = investment.to_f

        @@all << self
    end

    def self.all
        @@all
    end


end
