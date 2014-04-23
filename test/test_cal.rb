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

  def test_print_month_to_screen
    new_cal = `ruby cal.rb 4 2014`
    expected_cal = `cal 4 2014`

    assert_equal new_cal, expected_cal
  end

  def test_print_year_to_screen
    new_cal = `ruby cal.rb 2014`
    expected_cal = `cal 2014`

    assert_equal new_cal, expected_cal
  end
=begin
  def test_print_all_years
    i = 1800
    while i < 3000
      expected = `cal "#{i}"`
      actual = `ruby cal.rb "#{i}"`
      assert_equal expected, actual
      i += 1
    end
   end
=end
end
