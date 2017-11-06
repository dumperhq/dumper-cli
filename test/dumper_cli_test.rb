require 'test_helper'

class DumperCliTest < Minitest::Test
  def test_ip
    assert boolean? suppress_output { Dumper::Cli::IP.check }
  end

  def test_mysql
    assert boolean? suppress_output { Dumper::Cli::MySQL.check }
  end

  def test_clock
    assert boolean? suppress_output { Dumper::Cli::Clock.check }
  end

private

  def boolean?(value)
    [true, false].include?(value)
  end

  def suppress_output
    begin
      original_stderr = $stderr.clone
      original_stdout = $stdout.clone
      $stderr.reopen(File.new('/dev/null', 'w'))
      $stdout.reopen(File.new('/dev/null', 'w'))
      retval = yield
    rescue Exception => e
      $stdout.reopen(original_stdout)
      $stderr.reopen(original_stderr)
      raise e
    ensure
      $stdout.reopen(original_stdout)
      $stderr.reopen(original_stderr)
    end
    retval
  end
end
