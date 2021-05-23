class Members::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @words = @genre.words.page(params[:page]).reverse_order
  end

end
