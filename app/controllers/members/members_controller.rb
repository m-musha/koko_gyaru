class Members::MembersController < ApplicationController
    before_action :authenticate_member!


  def show
    @member = Member.find(params[:id])
    @words = @member.words.page(params[:page]).reverse_order
    @name = @member.name
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(current_member.id)
    else
      render :edit
    end
  end

  private

   def member_params
     params.require(:member).permit(:name, :profile_image)
   end
   
  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_user)
    end
  end

end
