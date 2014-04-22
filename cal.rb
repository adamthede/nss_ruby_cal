require_relative 'month.rb'
require_relative 'year.rb'

if ARGV.length == 1
  if ARGV[0].length > 2
    year = ARGV[0].to_i
    cal = Year.new(year)
    cal.to_s
  else
    year = 2014
    month = ARGV[0].to_i
    cal = Month.new(month, year)
    cal.print_month_to_screen
  end
else
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  cal = Month.new(month, year)
  cal.print_month_to_screen
end
