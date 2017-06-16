#
# Plato::MrubyApplication class
#
module Plato
  class MrubyApplication
    include Machine

    def initialize
      @running = false
    end

    def add_timer(ms, proc)
      Timer.add(ms, proc, self)
    end

    def delete_timer(id)
      Timer.delete(id)
    end

    def start
      @running = true
      Timer.start
      loop {
        break unless running?
        Timer.refresh
        _loop
        Machine.delay(1)
      }
    end

    def stop
      # Timer.stop
      @running = false
    end

    def running?
      @running
    end

    def _loop; end
  end
end
