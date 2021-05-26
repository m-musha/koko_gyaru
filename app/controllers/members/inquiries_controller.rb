# frozen_string_literal: true

module Members
  class InquiriesController < ApplicationController
    def new
      @inquiry = Inquiry.new
    end

    def create
      @inquiry = Inquiry.new(inquiry_params)
      if @inquiry.save
        InquiryMailer.send_mail(@inquiry).deliver
        flash[:success] = '送信されました！'
        redirect_to new_inquiry_path
      else
        flash.now[:alert] = '送信に失敗しました！'
        render :new
      end
    end

    private

    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
  end
end
