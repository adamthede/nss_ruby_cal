require_relative 'month.rb'
require_relative 'year.rb'

month = ARGV[0].to_i
year = ARGV[1].to_i

cal = Month.new(month, year)
cal.print_month_to_screen
