require "live_assets/engine"
require "thread"
require "listen"

module LiveAssets
  matter_reader :subscribers
  @@subscribers = []

  def self.subscribe(subscriber)
    subscribers << subscriber
  end

  def self.unsubscribe(subscriber)
    subscribers.delete(subscriber)
  end

  def self.start_listener(event, directories)
    Thread.new do
      Listen.to(*directories, latency: 0.5) do |_modified, _added, _removed|
        subscribers.each { |s| s << event }
      end
    end
  end
end
