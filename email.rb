# encoding: utf-8

module Assassins
  class Email
    def self.send (to, subject, body)
      mailer = Assassins::App.settings.mailer
      message = {
        :subject => subject,
        :from_name => 'Donlon 6 Assassins',
        :text => body,
        :to => to,
        :preserve_recipients => false,
        :from_email => 'DoNotReply@donlon6.tk'
      }
      if !mailer.nil?
        $stderr.puts mailer.messages.send(message)
      else
        emails = to.map {|recipient| recipient[:email]}.join(', ')
        $stderr.puts "Sending email to #{emails}"
        $stderr.puts "Subject \"#{subject}\""
        $stderr.puts "Message body:\n#{body}"
      end
    end
  end
end

# vim:set ts=2 sw=2 et:
