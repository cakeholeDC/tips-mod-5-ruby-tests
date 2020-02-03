require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment

  attr_accessor :start, :interval, :period

  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date) #date => Tue, 02 Jan 2018 00:00:00 +0000

    current = @start
    #current => Mon, 01 Jan 2018 00:00:00 +0000

    while current < date # true


      if @period == 'monthly'
        # binding.pry
        # current => Mon, 01 Jan 2018 00:00:00 +0000
        current = current.advance(months: @interval)
        # binding.pry
        # current => Thu, 01 Feb 2018 00:00:00 +0000
      elsif @period == 'weekly'
        # binding.pry
        # current => Mon, 01 Jan 2018 00:00:00 +0000
        current = current.advance(weeks: @interval)
        # binding.pry
        # current => Mon, 08 Jan 2018 00:00:00 +0000
      elsif @period == 'daily' # => true
        # binding.pry
        #current => Mon, 01 Jan 2018 00:00:00 +0000
        current = current.advance(days: @interval)
        # current => Tue, 02 Jan 2018 00:00:00 +0000
        # binding.pry
      end

      # in this while loop
      # current will never equal date
      # before making the above adjustments
      if current == date # jan 2 == jan 2 => true
        return true
      end

    end

    return false
  end
end
