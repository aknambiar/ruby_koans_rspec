require 'spec_helper'

describe 'Array Assignment' do
  
  it 'should demonstrate non-parallel assignment' do
    names = ['John', 'Smith']

    expect(names).to eql __
  end

  it 'should demonstrate parallel assignment' do
    first_name, last_name = ['John', 'Smith']

    expect(first_name).to eql __
    expect(last_name).to eql __
  end

  it 'should demonstrate parallel assignments with splat operator' do
    first_name, *last_name = ['John', 'Smith', 'III']

    expect(first_name).to eql __
    expect(last_name).to eql __
  end

  it 'should demonstrate parallel assignments with too few variables' do
    first_name, last_name = ['Cher']

    expect(first_name).to eql __
    expect(last_name).to eql __
  end

  it 'should demonstrate parallel assignments with subarrays' do
    first_name, last_name = [['Willie', 'Rae'], 'Johnson']

    expect(first_name).to eql __
    expect(last_name).to eql __
  end

  it 'should demonstrate parallel assignments with one variable' do
    first_name, = ['John', 'Smith']

    expect(first_name).to eql __
  end

  it 'should demonstrate swapping with parallel assignment' do
    first_name = 'Roy'
    last_name = 'Rob'
    first_name, last_name = last_name, first_name

    expect(first_name).to eql __
    expect(last_name).to eql __
  end
end
