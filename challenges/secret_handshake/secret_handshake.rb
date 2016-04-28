require 'pry'

class SecretHandshake
  def initialize(input)
    @binary = convert_binary(input)
    @handshake = []
  end

  def convert_binary(input)
    return 0 if input.is_a?(String)
    input.to_s(2).to_i
  end

  def build_move_list
    @handshake << "wink" if @binary % 10 == 1
    @handshake << "double blink" if @binary % 100 / 10 == 1
    @handshake << "close your eyes" if @binary % 1000 / 100 == 1
    @handshake << "jump" if @binary % 10000 / 1000 == 1
  end

  def reverse_output?
    @binary / 10000 == 1
  end

  def commands
    build_move_list
    reverse_output? ? @handshake.reverse! : @handshake
  end
end
