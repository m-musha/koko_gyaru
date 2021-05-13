class Members::WordsController < ApplicationController

  def index
    @words = Word.all
    @all_ranks = Word.create_all_ranks
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
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to word_path(@word)
    else
      render :edit
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to words_path
  end

  private

  def word_params
    params.require(:word).permit(:member_id, :sentence, word_genres_attributes: :genre_id)
  end


end
