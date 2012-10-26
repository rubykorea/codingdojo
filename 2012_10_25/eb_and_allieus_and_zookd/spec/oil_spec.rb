require "spec_helper"

def price(amount)
    # params : [period, price] 

    params = [ [20, 0.90], [40, 0.80], [0, 0.75] ]

    params.map do |period, price|
        qt = (period != 0) ? [period, amount].min : amount
        amount -= qt
        qt * price
    end.inject(&:+)
end

def notused_function
=begin
    while galon > 0
    	quantity = [period[i], galon].min
    	quantity = galon if period[i] == 0
    	sum += quantity * price[i]
    	galon -= quantity
    	i += 1
    end
    return sum
=end

=begin
    if galon <= 20
        return galon * 90
    elsif galon <= 60
        return 1800 + (galon-20) * 80
    else
        return 1800 + 3200 + (galon-60) * 75
    end
=end
end

describe "#price" do
    it "should calculate price" do
        price(0).should == 0
        price(10).should == 9
        price(20).should == 18
        price(21).should == 18.8
        price(60).should == 50
        price(61).should == 50.75
        price(100).should == 80
        price(200).should == 155
    end
end
