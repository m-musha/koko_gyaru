class Members::MembersController < ApplicationController
  
  def show
    @words = Word.all
    @member = Member.find(params[:id])
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

end
