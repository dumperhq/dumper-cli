require 'socket'
require 'ipaddress'
require 'forwardable'

module Dumper
  module Cli
    class IP
      extend Forwardable
      def_delegators :@ip, :address, :private?

      def initialize(*args)
        UDPSocket.open do |s|
          s.do_not_reverse_lookup = true
          s.connect '64.233.187.99', 1
          @ip = IPAddress(s.addr.last)
        end
        raise "#{@ip.address} is not IPv4!" unless @ip.ipv4?
      end

      def self.check
        print 'Checking IP address... '
        ip = IP.new
        print "#{ip.address} => "
        if ip.private?
          puts "Private IP, #{Dumper::Cli::Message.fetch_will_fail_warning}".color(:red)
          return false
        else
          puts 'Public IP, good'.color(:green)
          return true
        end
      end

    end
  end
end
