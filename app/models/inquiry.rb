# frozen_string_literal: true

class Inquiry < ApplicationRecord
  validates :name,    presence: true
  validates :email,   presence: true
  validates :message, presence: true
end
