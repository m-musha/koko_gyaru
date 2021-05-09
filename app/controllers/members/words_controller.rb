class Members::WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def show
  end

  def new
    @word = Word.new
    # WordGenre.new(word_id: word.id)を簡略して記述
    @word.word_genres.build

  end

  def create
    word = Word.new(word_params)
    word.save
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def word_params
    params.require(:word).permit(:sentence, word_genres_attributes: :genre_id)
  end


end
