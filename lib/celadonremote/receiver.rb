module CeladonRemote
  class Receiver
    def initialize(port, code=(5..6), eol:"\r\n", eot:"N!")
      @ser = SerialPort.new(port, 9600, 8, 1, SerialPort::NONE)
      @eol = eol
      @code = code
      @eot = eot
      @codes = {}
    end

    def oncode(code, &b)
      @codes[code] = b
    end

    def start_listener(allow_hold:false)
      prev_line = ""

      h = 0

      loop do
        l=@ser.readline(@eol)

        if allow_hold && l.start_with?(@eot)
          code = prev_line[@code]
          h = h+1
        elsif l.start_with?(@eot)
          next
        else
          code = l[@code]
          h = 0
          prev_line = l
        end

        if @codes[code]
          @codes[code].call(h)
        end
      end
    end
  end
end
