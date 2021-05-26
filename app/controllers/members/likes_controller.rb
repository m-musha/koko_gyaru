# frozen_string_literal: true

module Members
  class LikesController < ApplicationController
    def create
      @word = Word.find(params[:word_id])
      like = @word.likes.new(member_id: current_member.id)
      like.save
      redirect_to request.referer
    end

    def destroy
      @word = Word.find(params[:word_id])
      like = @word.likes.find_by(member_id: current_member.id)
      like.destroy
      redirect_to request.referer
    end
  end
end
