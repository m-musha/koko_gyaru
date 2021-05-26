# frozen_string_literal: true

module Members
  class GenresController < ApplicationController
    def show
      @genre = Genre.find(params[:id])
      @words = @genre.words.page(params[:page]).reverse_order
    end
  end
end
