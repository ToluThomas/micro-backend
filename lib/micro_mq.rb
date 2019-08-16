# frozen_string_literal: true

# Micro Message Queue
class MicroMQ
  attr_reader :size
  
  def initialize()
    #@subscriptions = [] # Array to save subscriptions
    @size = 0 # Size of queue is 0 when queue is initialised
  end

  def size
    @size
  end
=begin
  def subscriptions
    @subscriptions
  end
=end

  def subscribe(topic, subscriber)
    # If topic/subscriber is not empty, subscribe user
    unless topic.to_s.strip.empty? && subscriber.to_s.strip.empty?
=begin      # Add new subscription containing subscriber and topic which he/she subscribed to
      subscriptions.push([subscriber, topic])
      # Queue size is increased by 1 because we have a new subscription
      @size += 1
=end
      # When subscription is complete, subscribe returns true
      true
    else
      # User cannot be subscribed because topic or subscriber is missing, so return false
      false
    end
  end

  def send(topic, message)
    # If topic/message is not empty, "send message"
    unless topic.to_s.strip.empty? && message.to_s.strip.empty?
      # Return reversed string
      message.reverse
    end
  end
end
