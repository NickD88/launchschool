class SecretFile
  attr_reader :log

  def initialize(secret_data, logger)
    @data = secret_data
    @log = logger
  end

  def data
    @log.create_log_entry
    @data
  end
end

class SecurityLogger

  def self.create_log_entry
    "User has accessed the system"
  end
end

info = SecretFile.new("123.txt", SecurityLogger)
puts info.data
