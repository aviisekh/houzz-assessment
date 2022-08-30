class QuotesController < ApplicationController
  require 'csv'
  before_action :read_quotes, only: :random_quote

  def random_quote
    @quote = @quotes.sample
  end

  private
  def read_quotes
    quote_file = Rails.root.join('lib','data','quotes.csv')
    @quotes = []
    CSV.foreach(quote_file, headers: true) do |row|
        @quotes << OpenStruct.new(row.to_h)
    end
  end
end
