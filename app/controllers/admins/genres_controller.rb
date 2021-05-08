class Admins::GenresController < ApplicationController
  
  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admins_genres_path
  end
  
  def index
    @genre = Genre.new
    @genres = Genres.all
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admins_genres_path
  end 
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
    

end
