module Dumper
  module Cli
    class Runner < Thor
      include Thor::Actions

      desc 'doctor', 'Check configurations'
      def doctor
        Dumper::Cli::IP.check
        Dumper::Cli::MySQL.check
        Dumper::Cli::Clock.check
      end
    end
  end
end
