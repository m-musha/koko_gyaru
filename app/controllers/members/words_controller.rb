class Members::WordsController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show]
  # layout 'words'

  def index
    @words = Word.all.page(params[:page]).reverse_order
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
    @word = Word.new(word_params)
    @word.member = current_member
    if @word.save
      flash[:success] = "投稿しました！"
      redirect_to word_path(@word)
    else
      flash[:alert] = "投稿に失敗しました！"
      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
    if @word.member != current_member.id
      render :edit
    else
      redirect_to "/"
    end
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      flash[:success] = "変更を保存しました！"
      redirect_to word_path(@word)
    else
      flash[:alert] = "保存に失敗しました！"
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
