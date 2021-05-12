class Members::SearchsController < ApplicationController

  def search
    @range = params[:range]
    search = params[:search]
    @text = params[:text]
    if @range == 'member'
       @member = Member.search(search, @text)
    else
       @word = Word.search(search, @text)
    end
  end

end
