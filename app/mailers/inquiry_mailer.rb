# frozen_string_literal: true

class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail to: ENV['EMAIL_ADDRESS'], subject: '【ココギャル】 お問い合わせ通知'
  end
end
