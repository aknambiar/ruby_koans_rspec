require 'spec_helper'

describe 'Sandwich Code' do
  
  def count_lines(file_name)
    file = File.open(file_name)
    count = 0
    while file.gets
      count += 1
    end
    count
  ensure
    file&.close
  end

  it 'should demonstrate counting_lines' do
    expect(count_lines('example_file.txt')).to eql __
  end

  # ------------------------------------------------------------------

  def find_line(file_name)
    file = File.open(file_name)
    while (line = file.gets)
      return line if line.match(/e/)
    end
  ensure
    file&.close
  end

  it 'should demonstrate finding_lines' do
    expect(find_line('example_file.txt')).to eql __
  end

  # ------------------------------------------------------------------
  # THINK ABOUT IT:
  #
  # The count_lines and find_line are similar, and yet different.
  # They both follow the pattern of "sandwich code".
  #
  # Sandwich code is code that comes in three parts: (1) the top slice
  # of bread, (2) the meat, and (3) the bottom slice of bread.  The
  # bread part of the sandwich almost always goes together, but
  # the meat part changes all the time.
  #
  # Because the changing part of the sandwich code is in the middle,
  # abstracting the top and bottom bread slices to a library can be
  # difficult in many languages.
  #
  # (Aside for C++ programmers: The idiom of capturing allocated
  # pointers in a smart pointer constructor is an attempt to deal with
  # the problem of sandwich code for resource allocation.)
  #
  # Consider the following code:
  #

  def file_sandwich(file_name)
    file = File.open(file_name)
    yield(file)
  ensure
    file&.close
  end

  # Now we write:

  def count_lines2(file_name)
    file_sandwich(file_name) do |file|
      count = 0
      while file.gets
        count += 1
      end
      count
    end
  end

  it 'should demonstrate counting_lines2' do
    expect(count_lines2('example_file.txt')).to eql __
  end

  # ------------------------------------------------------------------

  def find_line2(file_name)
    # Rewrite find_line using the file_sandwich library function.
  end

  it 'should demonstrate finding_lines2' do
    expect(find_line2('example_file.txt')).to eql __
  end

  # ------------------------------------------------------------------

  def count_lines3(file_name)
    File.open(file_name) do |file|
      count = 0
      while file.gets
        count += 1
      end
      count
    end
  end

  it 'should demonstrate open_handles_the_file_sandwich_when_given_a_block' do
    expect(count_lines3('example_file.txt')).to eql __
  end
end
