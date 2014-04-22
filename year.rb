class Year
  require_relative 'month.rb'

  attr_reader :year

  def initialize(year)
    @year = year
  end

  def construct_year
    year_display = []
    12.times do |i|
      year_display << Month.new(i+1, @year).construct_month_array
    end
    return year_display
  end

  def print_year
    year_screen = construct_year.each_slice(3).to_a

    year_display = []
    year_screen.each do |item|
      i = 0
      until item[0][i].nil? && item[1][i].nil? && item[2][i].nil?
=begin
        if item[0][i].nil? && !item[1][i].nil? && !item[2][i].nil?
          year_display << "                    " + "  " + item[1][i] + "  " + item[2][i]
        elsif item[0][i].nil? && item[1][i].nil? && !item[2][i].nil?
          year_display << "                    " + "  " + "                    " + "  " + item[2][i]
        elsif item[0][i].nil? && !item[1][i].nil? && item[2][i].nil?
          year_display << "                    " + "  " + item[1][i] + "  " + "                    "
        elsif !item[0][i].nil? && item[1][i].nil? && item[2][i].nil?
          year_display << item[0][i] + "  " + "                    " + "  " + "                    "
        elsif !item[0][i].nil? && !item[1][i].nil? && item[2][i].nil?
          year_display << item[0][i] + "  " + item[1][i] + "  " + "                    "
        else
=end
          year_display << item[0][i] + "  " + item[1][i] + "  " + item[2][i]
        # end
        i += 1
      end
    end
    year_display.unshift("\n")
    year_display.unshift("#{@year}".center(62))
    year_display.each do |item|
      puts item
    end
  end
end
