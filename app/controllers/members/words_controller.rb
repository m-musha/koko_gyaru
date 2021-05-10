class Members::WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
    @member = @word.member
  end

  def new
    @word = Word.new
    # WordGenre.new(word_id: word.id)を簡略して記述
    @word.word_genres.build

  end

  def create
    word = Word.new(word_params)
    word.member = current_member
    word.save
    redirect_to word_path(word.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def word_params
    params.require(:word).permit(:sentence, :member_id, word_genres_attributes: :genre_id)
  end


end
