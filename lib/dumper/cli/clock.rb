require 'net/ntp'

module Dumper
  module Cli
    class Clock
      def self.check
        print 'Checking server clock accuracy... '
        target = Net::NTP.get('us.pool.ntp.org').time
        source = Time.now
        diff = (target - source).abs.round(3)
        print "#{source.strftime('%Y-%m-%d %H:%M:%S')} (server time) vs #{target.strftime('%Y-%m-%d %H:%M:%S')} (ntp time), diff: #{diff} seconds => "
        if diff > 15 * 60
          puts 'warning, Amazon S3 does not accept clock skewed more than 15 minutes.'.color(:red)
          return false
        else
          puts 'good'.color(:green)
          return true
        end
      end
    end
  end
end
