# frozen_string_literal: true

require 'json'
require_relative '../lib/micro_sorting'

describe 'general sorting' do
  let(:filename) { File.expand_path('../orders_data.json', __dir__) }
  let(:orders) { JSON.parse(File.read(filename)) }
  let(:microSorting) { MicroSorting.new }

  it 'has 4 orders' do
    expect(orders.size).to eq(4)
  end

  it 'formats currency to german string' do
    totalPrice = microSorting.totalPrice(orders)
    expect(microSorting.priceToGermanCurrency(totalPrice)).to eq("257,50")
  end

  it 'creates a sorted list of order names' do
    names = microSorting.names(orders)
    expect(microSorting.sortNames(names)).to eq("Ann, Eric, Robert, Susan")
  end
end
