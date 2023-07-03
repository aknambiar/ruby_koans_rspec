require 'spec_helper'

describe 'Iteration' do
  
  def as_name(name)
    name.to_sym
  end

  it 'should demonstrate each_is_a_method_on_arrays' do
    expect([].methods.include?(as_name(:each))).to eql __
  end

  it 'should demonstrate iterating_with_each' do
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    expect(sum).to eql __
  end

  it 'should demonstrate each_can_use_curly_brace_blocks_too' do
    array = [1, 2, 3]
    sum = 0
    array.each { |item|
      sum += item
    }
    expect(sum).to eql __
  end

  it 'should demonstrate break_works_with_each_style_iterations' do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each { |item|
      break if item > 3
      sum += item
    }
    expect(sum).to eql __
  end

  it 'should demonstrate collect_transforms_elements_of_an_array' do
    array = [1, 2, 3]
    new_array = array.collect { |item| item + 10 }
    expect(new_array).to eql __

    # NOTE: 'map' is another name for the 'collect' operation
    another_array = array.map { |item| item + 10 }
    expect(another_array).to eql __
  end

  it 'should demonstrate select_selects_certain_items_from_an_array' do
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| (item % 2) == 0 }
    expect(even_numbers).to eql __

    # NOTE: 'find_all' is another name for the 'select' operation
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    expect(more_even_numbers).to eql __
  end

  it 'should demonstrate find_locates_the_first_element_matching_a_criteria' do
    array = ['Jim', 'Bill', 'Clarence', 'Doug', 'Eli']

    expect(array.find { |item| item.size > 4 }).to eql __
  end

  it 'should demonstrate inject_will_blow_your_mind' do
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    expect(result).to eql __

    result2 = [2, 3, 4].inject(1) { |sum, item| sum * item }
    expect(result2).to eql __

    # Extra Credit:
    # Describe in your own words what inject does.
  end

  it 'should demonstrate all_iteration_methods_work_on_any_collection_not_just_arrays' do
    # Ranges act like a collection
    result = (1..3).map { |item| item + 10 }
    expect(result).to eql __

    # Files act like a collection of lines
    File.open('example_file.txt') do |file|
      upcase_lines = file.map { |line| line.strip.upcase }
      expect(upcase_lines).to eql __
    end

    # NOTE: You can create your own collections that work with each,
    # map, select, etc.
  end

  # Bonus Question:  In the previous koan, we saw the construct:
  #
  #   File.open(filename) do |file|
  #     # code to read 'file'
  #   end
  #
  # Why did we do it that way instead of the following?
  #
  #   file = File.open(filename)
  #   # code to read 'file'
  #
  # When you get to the "AboutSandwichCode" koan, recheck your answer.

end