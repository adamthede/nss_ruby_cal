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
    # Zeller's Congruence for the Gregorian Calendar (http://en.wikipedia.org/wiki/Zeller's_congruence)
    first_day = (1 + ((26 *(month + 1))/10).floor + year + (year/4).floor + (6*(year/100)).floor + (year/400).floor) % 7
    return first_day
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

  def construct_month(print_selector)
    # create an array of days for the month
    calendar_month = create_array_of_days

    # prepare an array containing each line of the printed calendar
    calendar_month_formatted = create_array_for_month(calendar_month)

    # final formatting for the printed calendar
    calendar_month_final = create_final_month(calendar_month_formatted, print_selector)

    return calendar_month_final
  end

  def create_array_of_days
    first_day = day_on_first_of_month
    month_days = days_in_month
    if first_day == 0
      calendar_start = 6
    else
      calendar_start = first_day - 1
    end
    calendar = []
    calendar_start.times do
      calendar << 0
    end
    calendar_end = (1..month_days).to_a
    calendar += calendar_end
    return calendar
  end

  def create_array_for_month(calendar)
    new_calendar = calendar.each_slice(7).to_a
    final_calendar = []
    new_calendar.each do |row|
      calendar_line = ""
      row.each do |day|
        if day == 0
          calendar_line += "\s\s"
        elsif day < 10
          calendar_line += ("\s"+day.to_s)
        else
          calendar_line += day.to_s
        end
        calendar_line += "\s"
      end
      final_calendar << calendar_line.chomp("\s")
    end
    return final_calendar
  end

  def create_final_month(calendar_month_formatted, print_selector)
    formatted_final_calendar = []

    if print_selector == "month"
      calendar_month_formatted.each do |line|
        formatted_final_calendar << line.ljust(20).rstrip
      end
    elsif print_selector == "year"
      calendar_month_formatted.each do |line|
        formatted_final_calendar << line.ljust(20)
      end
    end

    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_text = months[@month - 1]

    formatted_final_calendar.unshift("Su Mo Tu We Th Fr Sa")

    if print_selector == "month"
      formatted_final_calendar.unshift("#{month_text} #{year}".center(20).rstrip)
      until formatted_final_calendar.length == 8
        formatted_final_calendar.push("\s".center(20).rstrip)
      end
    elsif print_selector == "year"
      formatted_final_calendar.unshift("#{month_text}".center(20))
      until formatted_final_calendar.length == 8
        formatted_final_calendar.push("\s".center(20))
      end
    end

    return formatted_final_calendar
  end

  def print_month_to_screen
    puts construct_month("month")
  end

end
