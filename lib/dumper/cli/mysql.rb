module Dumper
  module Cli
    class MySQL
      def self.check
        print 'Checking my.cnf... '
        bound = nil
        ['/etc/my.cnf', '/etc/mysql/my.cnf', '/usr/etc/my.cnf', '~/.my.cnf'].each do |name|
          fullpath = File.expand_path(name)
          next unless File.exist?(fullpath)
          File.readlines(fullpath).each do |line|
            if line =~ /^bind-address/
              bound = line.split('=').last.strip
              break
            end
          end
        end
        if bound
          if bound == '127.0.0.1'
            print 'There is bind-address = 127.0.0.1 => '
          elsif IPAddr.new(bound).private?
            print "There is bind-address = #{bound} => "
          end
          puts Dumper::Cli::Message.fetch_will_fail_warning.color(:red)
          return false
        else
          puts 'No bind-address defined in my.cnf => ' << 'good'.color(:green)
          return true
        end
      end
    end
  end
end
