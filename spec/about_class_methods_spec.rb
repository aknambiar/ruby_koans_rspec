require 'spec_helper'

describe 'Class Methods' do

  class Dog13
  end

  it 'should demonstrate objects_are_objects' do
    fido = Dog13.new
    expect(fido.is_a?(Object)).to eql __
  end

  it 'should demonstrate classes_are_classes' do
    expect(Dog13.is_a?(Class)).to eql __
  end

  it 'should demonstrate classes_are_objects_too' do
    expect(Dog13.is_a?(Object)).to eql __
  end

  it 'should demonstrate objects_have_methods' do
    fido = Dog13.new
    expect(fido.methods.size).to be > _n_
  end

  it 'should demonstrate classes_have_methods' do
    expect(Dog13.methods.size).to be > _n_
  end

  it 'should demonstrate you_can_define_methods_on_individual_objects' do
    fido = Dog13.new

    def fido.wag
      :fidos_wag
    end

    expect(fido.wag).to eql __
  end

  it 'should demonstrate other_objects_are_not_affected_by_these_singleton_methods' do
    fido = Dog13.new
    rover = Dog13.new

    def fido.wag
      :fidos_wag
    end

    expect { rover.wag }.to raise_error(__)
  end

  # ------------------------------------------------------------------

  class Dog14
    def wag
      :instance_level_wag
    end
  end

  def Dog14.wag
    :class_level_wag
  end

  it 'should demonstrate since_classes_are_objects_you_can_define_singleton_methods_on_them_too' do
    expect(Dog14.wag).to eql __
  end

  it 'should demonstrate class_methods_are_independent_of_instance_methods' do
    fido = Dog14.new
    expect(fido.wag).to eql __
    expect(Dog14.wag).to eql __
  end

  # ------------------------------------------------------------------

  class Dog15
    attr_accessor :name
  end

  def Dog15.name
    @name
  end

  it 'should demonstrate classes_and_instances_do_not_share_instance_variables' do
    fido = Dog15.new
    fido.name = 'Fido'
    expect(fido.name).to eql __
    expect(Dog15.name).to eql __
  end

  # ------------------------------------------------------------------

  class Dog16
    def Dog16.a_class_method
      :dogs_class_method
    end
  end

  it 'should demonstrate you_can_define_class_methods_inside_the_class' do
    expect(Dog16.a_class_method).to eql __
  end


  # ------------------------------------------------------------------

  LastExpressionInClassStatement = class Dog16
    21
  end

  it 'should demonstrate class_statements_return_the_value_of_their_last_expression' do
    expect(LastExpressionInClassStatement).to eql __
  end

  # ------------------------------------------------------------------

  SelfInsideOfClassStatement = class Dog16
    self
  end

  it 'should demonstrate self_while_inside_class_is_class_object_not_instance' do
    expect(Dog16 == SelfInsideOfClassStatement).to eql __
  end

  # ------------------------------------------------------------------

  class Dog16
    def self.class_method2
      :another_way_to_write_class_methods
    end
  end

  it 'should demonstrate you_can_use_self_instead_of_an_explicit_reference_to_dog' do
    expect(Dog16.class_method2).to eql __
  end

  # ------------------------------------------------------------------

  class Dog16
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  it 'should demonstrate heres_still_another_way_to_write_class_methods' do
    expect(Dog16.another_class_method).to eql __
  end

  # THINK ABOUT IT:
  #
  # The two major ways to write class methods are:
  #   class Demo
  #     def self.method
  #     end
  #
  #     class << self
  #       def class_methods
  #       end
  #     end
  #   end
  #
  # Which do you prefer and why?
  # Are there times you might prefer one over the other?

  # ------------------------------------------------------------------

  it 'should demonstrate heres_an_easy_way_to_call_class_methods_from_instance_methods' do
    fido = Dog16.new
    expect(fido.class.another_class_method).to eql __
  end
end