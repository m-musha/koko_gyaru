# frozen_string_literal: true

module Members
  class SearchsController < ApplicationController
    before_action :authenticate_member!

    def search
      @range = params[:range]
      search = params[:search]
      @text = params[:text]
      case @range
      when 'member'
        @member = Member.search(search, @text)
      when 'word'
        @word = Word.search(search, @text)
      else
        @genre = Genre.search(search, @text)
      end
    end
  end
end
