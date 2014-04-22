class Month
  attr_reader :month
  attr_reader :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def days_in_month
    if leap_year?
      month_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    else
      month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
    return month_days[@month - 1]
  end

  def day_on_first_of_month
    if @month == 1 || @month == 2
      month = @month + 12
      year = @year - 1
    else
      month = @month
      year = @year
    end
    # new construction of the algorithm
    day_on_first_of_month = (1 + ((26 *(month + 1))/10).floor + year + (year/4).floor + (6*(year/100)).floor + (year/400).floor) % 7
    return day_on_first_of_month
  end

  def leap_year?
    if @year % 4 == 0
      if @year % 100 == 0
        if @year % 400 == 0
          return true
        end
        return false
      end
      return true
    end
    return false
  end

  def construct_month
    month_days = days_in_month
    first_day = day_on_first_of_month
    if first_day == 0
      calendar_fill = 6
    else
      calendar_fill = first_day - 1
    end
    calendar = []
    calendar_fill.times do
      calendar << 0
    end
    rest_of_calendar = (1..month_days).to_a
    calendar += rest_of_calendar
    new_calendar = calendar.each_slice(7).to_a
    calendar_string = ""
    new_calendar.each do |row|
      row.each do |day|
        if day == 0
          calendar_string += "  "
        elsif day < 10
          calendar_string += (" "+day.to_s)
        else
          calendar_string += day.to_s
        end
        calendar_string += " "
      end
      calendar_string += "\n"
    end
    return calendar_string
  end

  def print_month_to_screen
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_text = months[@month - 1]
    title = "#{month_text} #{year}"
    puts title.center(20)
    puts "Su Mo Tu We Th Fr Sa"
    puts construct_month
  end

  def print_month_to_array
    month_array = []
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_text = months[@month - 1]
    title = "#{month_text}"
    month_array << title.center(20)
    month_array << "Su Mo Tu We Th Fr Sa"
    month_array << construct_month
    return month_array
  end

  def construct_month_array
    month_days = days_in_month
    first_day = day_on_first_of_month
    if first_day == 0
      calendar_fill = 6
    else
      calendar_fill = first_day - 1
    end
    calendar = []
    calendar_fill.times do
      calendar << 0
    end
    rest_of_calendar = (1..month_days).to_a
    calendar += rest_of_calendar
    new_calendar = calendar.each_slice(7).to_a
    final_calendar = []
    new_calendar.each do |row|
      calendar_string = ""
      row.each do |day|
        if day == 0
          calendar_string += "  "
        elsif day < 10
          calendar_string += (" "+day.to_s)
        else
          calendar_string += day.to_s
        end
        calendar_string += " "
      end
      final_calendar << calendar_string.chomp(" ")
    end
    new_final_calendar = []
    final_calendar.each do |line|
      new_final_calendar << line.ljust(20)
    end
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_text = months[@month - 1]
    new_final_calendar.unshift("Su Mo Tu We Th Fr Sa")
    new_final_calendar.unshift("#{month_text}".center(20))
    if new_final_calendar.length == 7
      new_final_calendar.push("                    ")
    end
    return new_final_calendar
  end

end
