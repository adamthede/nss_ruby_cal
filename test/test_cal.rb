require_relative 'helper'
require_relative '../month.rb'

class TestCal < MiniTest::Unit::TestCase

  def test_to_see_if_tests_work
    assert_equal true, true
  end

  def test_to_check_that_wednesday_is_first_day_in_february_2012
    new_cal = Month.new(2, 2012)
    first_of_month = new_cal.day_on_first_of_month

    assert_equal 4, first_of_month
  end

  def test_to_check_that_2012_is_a_leap_year
    new_cal = Month.new(2, 2012)
    leap_year = new_cal.leap_year?

    assert_equal true, leap_year
  end

  def test_to_check_that_2100_is_not_leap_year
    new_cal = Month.new(1, 2100)
    leap_year = new_cal.leap_year?

    assert_equal false, leap_year
  end

  def test_print_to_screen
    new_cal = Month.new(12, 1866)
    expected_print = <<EOS
   December 1866
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS

    assert_equal expected_print, new_cal.print_month_to_screen
  end
end
