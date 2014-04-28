require_relative 'lib/month.rb'
require_relative 'lib/year.rb'

if ARGV.length == 1
  if ARGV[0].length > 2
    year = ARGV[0].to_i
    abort ("please enter a year between 1800 and 3000") if year < 1800 || year > 3000
    cal = Year.new(year)
    cal.to_s
  else
    year = 2014
    month = ARGV[0].to_i
    abort ("please enter a month between 1 and 12") if month < 1 || month > 12
    cal = Month.new(month, year)
    cal.print_month_to_screen
  end
else
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  abort ("please enter a month between 1 and 12") if month < 1 || month > 12
  abort ("please enter a year between 1800 and 3000") if year < 1800 || year > 3000
  cal = Month.new(month, year)
  cal.print_month_to_screen
end
