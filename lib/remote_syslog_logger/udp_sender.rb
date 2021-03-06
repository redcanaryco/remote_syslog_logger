require 'socket'
require 'syslog_protocol'
require 'remote_syslog_logger/syslog_sender'

module RemoteSyslogLogger
  class UdpSender < SyslogSender
    def initialize(remote_hostname, remote_port, options = {})
      super(remote_hostname, remote_port, options)
      @socket = UDPSocket.new
    end

    def send_message(content)
      @socket.send(content, 0, @remote_hostname, @remote_port)
    end

    def close
      @socket.close
    end
  end
end
