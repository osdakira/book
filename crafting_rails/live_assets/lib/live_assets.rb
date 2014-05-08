require "live_assets/engine"
require "thread"
require "listen"

module LiveAssets
  autoload :SSESubscriber, "live_assets/sse_subscriber"
end

# module LiveAssets

#   mattr_reader :subscribers
#   @@subscribers = []

#   def self.subscribe(subscriber)
#     # puts "subscribe"
#     subscribers << subscriber
#   end

#   def self.unsubscribe(subscriber)
#     subscribers.delete(subscriber)
#   end

#   def self.start_listener(event, directories)
#     # puts "start_listener"
#     Thread.new do
#       Listen.to(*directories, latency: 0.5) do |_modified, _added, _removed|
#         subscribers.each { |s| s << event }
#       end.start
#     end
#   end
# end
