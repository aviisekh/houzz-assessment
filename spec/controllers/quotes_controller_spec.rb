require 'rails_helper'
RSpec.describe QuotesController, type: :controller do
  render_views 

  describe "GET random_quote" do
    it "always responds with success status" do
      get :random_quote
      expect(response).to have_http_status(:success)
    end

    it "responds to html by default" do
      get :random_quote
      expect(response.content_type).to match "text/html"
    end

    it "responds to json format request" do
      get :random_quote,  :format => :json 
      expect(response.content_type).to match "application/json"
    end

    it "responds to xml format request" do
      get :random_quote,  :format => :xml 
      expect(response.content_type).to match "application/xml"
    end

    it "responds the quote from the CSV file" do 
      get :random_quote,  :format => :json
      @quotes = []
      CSV.foreach(Rails.root.join('lib','data','quotes.csv'), headers: true) { |row| @quotes << row.to_h }
      expect(@quotes).to include JSON.parse(response.body)
    end
  end
end