require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let!(:supplier) { create(:supplier) }
  let!(:unit) { create(:unit, supplier_id: supplier.id) }


  let!(:user) { create(:employee, location_id: unit.id) }
  let!(:product) { create(:product) }
  let!(:unit_quantity) { create(:quantity, product_id: product.id, stock_id: unit.stock.id, amount: 100) }
  let!(:supplier_quantity) { create(:quantity, product_id: product.id, stock_id: supplier.stock.id, amount: 100) }

  let!(:order) { create(:order, ordered_by: user) }
  let(:order_params) {
    { order: {
      'ordered_by_id' => user.id,
      'order_items_attributes' => [{'product_id' => product.id, 'quantity' => 2}]
    } }
  }

  describe "GET /index" do
    it "returns a successful response" do
      get api_v1_orders_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    it "returns the requested order" do
      get api_v1_order_path(order)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    it "creates a new order" do
      expect {
        post api_v1_orders_path, params: order_params
      }.to change(Order, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /update" do
    it "updates the order status" do
      patch api_v1_order_path(order), params: { order: { status: 'completed' } }
      order.reload
      expect(order.status).to eq('completed')
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /destroy" do
    it "deletes the order" do
      order = create(:order)
      expect {
        delete api_v1_order_path(order)
      }.to change(Order, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
