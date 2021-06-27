# frozen_string_literal: true

module Members
  class LikesController < ApplicationController
    before_action :set_word
    before_action :login_check

    def create
      like = @word.likes.new(member_id: current_member.id)
      like.save
      redirect_to request.referer
    end

    def destroy
      like = @word.likes.find_by(member_id: current_member.id)
      like.destroy
      redirect_to request.referer
    end

    private

    def set_word
      @word = Word.find(params[:word_id])
    end

    def login_check
      unless member_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to new_member_session_path
      end
    end

  end
end
