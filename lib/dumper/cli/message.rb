module Dumper
  module Cli
    class Message
      class << self
        def fetch_will_fail_warning
          'warning - remote fetch from dumper.io to this server will fail. You will need to use the dumper gem with rails.'
        end
      end
    end
  end
end
