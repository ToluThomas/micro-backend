# frozen_string_literal: true

require_relative '../lib/micro_mq'

subscriber = proc {
  # Get name of subscriber
  puts 'What\'s your name?\n'
  # Get user input and remove new line in input (added when user hits ENTER key)
  gets.chomp
 }

describe 'Micro Message Queue' do

  let(:queue) { MicroMQ.new }

  it 'has 0 items in queue' do
    expect(queue.size).to eq(0)
  end

  it 'can register a subscriber' do
    expect(queue.subscribe('my-topic', subscriber)).to eq(true)
  end

  it 'can send a message to the queue' do
    queue.subscribe('my-topic', subscriber)
    expect(queue.send('my-topic', 'Hello')).to eq('olleH')
  end

end
