# frozen_string_literal: true

module Admins
  class GenresController < ApplicationController
    before_action :authenticate_admin!

    def index
      @genre = Genre.new
      @genres = Genre.all.page(params[:page]).reverse_order
    end

    def create
      genre = Genre.new(genre_params)
      genre.save
      redirect_to admins_genres_path
    end

    def edit
      @genre = Genre.find(params[:id])
    end

    def update
      @genre = Genre.find(params[:id])
      @genre.update(genre_params)
      redirect_to admins_genres_path
    end

    def destroy
      genre = Genre.find(params[:id])
      genre.destroy
      redirect_to admins_genres_path
    end

    private

    def genre_params
      params.require(:genre).permit(:name)
    end
  end
end
