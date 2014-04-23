# Cal

The Unit 1 capstone for this course is the implementation of a subset of the Unix program, `cal`.

Objectives
==========

  * Practice with Arrays, Hashes, and Strings
  * Develop the logic of a non-trivial algorithm
  * Programming to meet a (changing) specification

Requirements
==========

  * Your program must have tests.  These test may be as high-level (integration tests) or as low-level (unit tests) as you wish.  I highly recommend a mix of tests.
  * You may not use any of the built-in Ruby classes that provide date, time, or calendar functionality.
  * You may not use exec, Kernel, etc. to shell out to any Unix programs.
  * You should not use "magic" numbers.
  * You must commit your code _at least_ once per day and push it to your github repository.
  * As a capstone project, this should demonstrate *your* skills. Do not share code with your peers. You can help each other _think_ about the problems, but don't help each other code.
  * Your program should accept any combination of months and years between 1800 and 3000.

Suggested Implementation Order
==========

You will find this (and all future) programming projects much easier if you take the time to break it down into smaller parts.  I will suggest a breakdown that works well for me:

  1. Implement Zeller's Congruence, with test for all of the special types of months/years.
  2. Implement printing a month where the first day of the month is on a Sunday.  For example, January 2012.  This is the easiest type of month to print and can be thought of as a base case.  For this, you can temporarily hardcode the assumption that the month will start on Sunday.  Of course, you will use tests for this!
  3. Combine the powers of your Zeller's Congruence (which will tell you the real first day of the month) with your basic month printing from step 2.  Test the hell out of this!
  4. After you feel good about that and have had your first milestone reviewed, combine the ability to print each individual month, to allow you to print an entire year.  Hint: This is all about combining strings!

Resources:
==========

Wikipedia articles that may be of use:

  * [http://en.wikipedia.org/wiki/Cal_(Unix)](http://en.wikipedia.org/wiki/Cal_(Unix))
  * [http://en.wikipedia.org/wiki/Gregorian_calendar](http://en.wikipedia.org/wiki/Gregorian_calendar)
  * [http://en.wikipedia.org/wiki/Zeller's_congruence](http://en.wikipedia.org/wiki/Zeller's_congruence)

Printing Months (due 4/21):
==========

The initial milestone of this assignment is to implement a ruby program, cal.rb that takes two command-line arguments:

`ruby cal.rb 12 2012`

and outputs the calendar for that month (12) and year (2012):
`
   December 2012
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
`
This is functionally equivalent to calling Unix cal with those arguments (cal 12 2012) and the output of your program should match that of Unix cal.
