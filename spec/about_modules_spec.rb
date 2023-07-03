require 'spec_helper'

describe 'Modules' do

  module Nameable
    def set_name(new_name)
      @name = new_name
    end

    def here
      :in_module
    end
  end

  it 'should demonstrate cant_instantiate_modules' do
    expect { Nameable.new }.to raise_error(__)
  end

  # ------------------------------------------------------------------

  class Dog11
    include Nameable

    attr_reader :name

    def initialize
      @name = 'Fido'
    end

    def bark
      'WOOF'
    end

    def here
      :in_object
    end
  end

  it 'should demonstrate normal_methods_are_available_in_the_object' do
    fido = Dog11.new
    expect(fido.bark).to eql __
  end

  it 'should demonstrate module_methods_are_also_available_in_the_object' do
    fido = Dog11.new
    expect { fido.set_name('Rover') }.not_to raise_error(Exception)
  end

  it 'should demonstrate module_methods_can_affect_instance_variables_in_the_object' do
    fido = Dog11.new
    expect(fido.name).to eql __
    fido.set_name('Rover')
    expect(fido.name).to eql __
  end

  it 'should demonstrate classes_can_override_module_methods' do
    fido = Dog11.new
    expect(fido.here).to eql __
  end
end
