module GeoblacklightMessaging
  class GeoblacklightEventHandler
    include Sneakers::Worker
    from_queue :geoblacklight

    def work(msg)
      msg = JSON.parse(msg)
      result = GeoblacklightMessaging::GeoblacklightEventProcessor.new(msg).process
      if result
        ack!
      else
        reject!
      end
    end
  end
end
