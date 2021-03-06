# frozen_string_literal: true

module Members
  class WordsController < ApplicationController
    before_action :authenticate_member!, except: %i[index show]
    before_action :ensure_correct_member, only: [:update, :edit, :destroy]

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
    end

    def create
      @word = Word.new(word_params)
      @word.member = current_member
      if @word.save
        redirect_to word_path(@word)
      else
        render :new
      end
    end

    def edit
      @word = Word.find(params[:id])
      if @word.member == current_member
        render :edit
      else
        redirect_to '/'
      end
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
      params.require(:word).permit(:member_id, :sentence, :genre_id)
    end

      #accepts_nested_attributes_forを無視するために記述
    def word_genres_update_params
      params.require(:word).permit(:genre_id)
    end

    def ensure_correct_member
      @word = Word.find(params[:id])
      unless @word = current_member.id
        redirect_to words_path
      end
    end
  end
end