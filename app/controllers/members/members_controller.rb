class Members::MembersController < ApplicationController
  
  def show
    @words = Word.all
    @member = Member.find(params[:id])
  end
  
  
  def edit
  end 
  
  def update
  end
  
  private
  
   def member_params
     params.require(:member).permit(:name, :profile_image)
   end 

end
