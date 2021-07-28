require "rails_helper"

RSpec.describe "StripePayments", type: :request do
  describe "GET index" do
    it "renders the index template" do
      get root_path
      expect(response).to render_template(:index)
    end

    it "has a 200 status code" do
      get root_path
      expect(response).to have_http_status(200) 
    end
  end

  describe "POST create_checkout_session" do
    it "has a 303 status code" do
      product = create(:product)
      post create_checkout_session_path(product)
      expect(response).to have_http_status(303)  
    end
  end
end
