require 'spec_helper'

def my_global_method(one, two)
  one + two
end

describe 'Methods' do
  
  it 'should demonstrate calling_global_methods' do
    expect(my_global_method(2, 3)).to eql __
  end

  it 'should demonstrate calling_global_methods_without_parentheses' do
    result = my_global_method 2, 3
    expect(result).to eql __
  end

  # (NOTE: We are Using eval below because the example code is
  # considered to be syntactically invalid).
  # it 'should demonstrate sometimes_missing_parentheses_are_ambiguous' do
  #   eval 'expect(5).should eql my_global_method 2, 3' # ENABLE CHECK
  #                                                #
  #                                                # Ruby doesn't know if you mean:
  #                                                #
  #                                                #   assert_equal(5, my_global_method(2), 3)
  #                                                # or
  #                                                #   assert_equal(5, my_global_method(2, 3))
  #                                                #
  #                                                # Rewrite the eval string to continue.
  #                                                #
  # end

  # NOTE: wrong number of argument is not a SYNTAX error, but a
  # runtime error.
  it 'should demonstrate calling_global_methods_with_wrong_number_of_arguments' do
    expect { my_global_method }.to raise_error(__)

    expect { my_global_method(1, 2, 3) }.to raise_error(__)
  end

  # ------------------------------------------------------------------

  def method_with_defaults(one, two = :default_value)
    [one, two]
  end

  it 'should demonstrate calling_with_default_values' do
    expect(method_with_defaults(1)).to eql [1, __]
    expect(method_with_defaults(1, 2)).to eql [1, __]
  end

  # ------------------------------------------------------------------

  def method_with_var_args(*args)
    args
  end

  it 'should demonstrate calling_with_variable_arguments' do
    expect(method_with_var_args.class).to eql __
    expect(method_with_var_args).to eql __
    expect(method_with_var_args(:one)).to eql __
    expect(method_with_var_args(:one, :two)).to eql __
  end

  # ------------------------------------------------------------------

  def method_with_explicit_return
    :a_non_return_value
    return :return_value
    :another_non_return_value
  end

  it 'should demonstrate method_with_explicit_return' do
    expect(method_with_explicit_return).to eql __
  end

  # ------------------------------------------------------------------

  def method_without_explicit_return
    :a_non_return_value
    :return_value
  end

  it 'should demonstrate method_without_explicit_return' do
    expect(method_without_explicit_return).to eql __
  end

  # ------------------------------------------------------------------

  def my_method_in_the_same_class(one, two)
    one * two
  end

  it 'should demonstrate calling_methods_in_same_class' do
    expect(my_method_in_the_same_class(3, 4)).to eql __
  end

  it 'should demonstrate calling_methods_in_same_class_with_explicit_receiver' do
    expect(self.my_method_in_the_same_class(3, 4)).to eql __
  end

  # ------------------------------------------------------------------

  def my_private_method
    'a secret'
  end
  private :my_private_method

  it 'should demonstrate calling_private_methods_without_receiver' do
    expect(my_private_method).to eql __
  end

  it 'should demonstrate calling_private_methods_with_an_explicit_receiver' do
    expect { self.my_private_method }.to raise_error(__)
  end

  # ------------------------------------------------------------------

  class Dog1
    def name
      'Fido'
    end

    private

    def tail
      'tail'
    end
  end

  it 'should demonstrate calling_methods_in_other_objects_require_explicit_receiver' do
    rover = Dog1.new
    expect(rover.name).to eql __
  end

  it 'should demonstrate calling_private_methods_in_other_objects' do
    rover = Dog1.new
    expect { rover.tail }.to raise_error(__)
  end
end
