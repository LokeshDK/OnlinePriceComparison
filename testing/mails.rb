
require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <notification@onlinepricecomparison.com>
To: A Test User <suryajapan@gmail.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('87.44.4.143') do |smtp|
  smtp.send_message message, 'notification@onlinepricecomparison.com', 'suryajapan@gmail.com'
end