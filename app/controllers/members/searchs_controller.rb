class Members::SearchsController < ApplicationController

  def search
    @range = params[:range]
    search = params[:search]
    @text = params[:text]
    if @range == 'member'
       @member = Member.search(search, @text)
    elsif @range == 'word'
       @word = Word.search(search, @text)
    else
       @genre = Genre.search(search, @text)
    end
    
  end
end