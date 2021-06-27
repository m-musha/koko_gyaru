# frozen_string_literal: true

module Members
  class MembersController < ApplicationController
    before_action :authenticate_member!
    before_action :ensure_correct_member, only: [:edit, :update]
    before_action :set_member

    def show
      @words = @member.words.page(params[:page]).reverse_order
      @name = @member.name
    end

    def edit
      if @member == current_member
        render :edit
      else
        redirect_to member_path(current_member.id)
      end
    end

    def update
      if @member.update(member_params)
        redirect_to member_path(current_member.id)
      else
        render :edit
      end
    end

    private

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :profile_image)
    end

    def ensure_correct_member
      @member = Member.find(params[:id])
      unless @member = current_member
        redirect_to member_path(current_member)
      end
    end
  end
end
