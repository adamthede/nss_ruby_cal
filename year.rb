class Year
  require_relative 'month.rb'

  def initialize(year)
    @year = year
  end

  def construct_year
    year_array = []
    12.times do |i|
      year_array << Month.new(i+1, @year).construct_month("year")
    end
    return year_array
  end

  def print_year_to_screen
    year_for_screen = construct_year.each_slice(3).to_a

    year_display = []
    year_for_screen.each do |item|
      8.times do |i|
        year_display << item[0][i] + "  " + item[1][i] + "  " + item[2][i].to_s.rstrip
        i += 1
      end
    end
    year_display.unshift("\n")
    year_display.unshift("#{@year}".center(62).rstrip)
    return year_display
  end

  def to_s
    puts print_year_to_screen
  end
end
