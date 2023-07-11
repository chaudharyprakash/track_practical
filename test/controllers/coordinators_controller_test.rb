require 'rails_helper'

RSpec.describe CoordinatorsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all coordinators to @coordinators" do
      coordinator1 = Coordinator.create(name: "Prakash Chaudhary", email: "chaudharyprakash1992@gmail.com", phone_number: "9662402742")
      coordinator2 = Coordinator.create(name: "Test", email: "test@gmail.com", phone_number: "12334556666")

      get :index

      expect(assigns(:coordinators)).to eq([coordinator1, coordinator2])
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      get :show, params: { id: coordinator.id }

      expect(response).to render_template(:show)
    end

    it "assigns the correct coordinator to @coordinator" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      get :show, params: { id: coordinator.id }

      expect(assigns(:coordinator)).to eq(coordinator)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new coordinator to @coordinator" do
      get :new
      expect(assigns(:coordinator)).to be_a_new(Coordinator)
    end
  end

  describe "POST #create" do
    it "creates a new coordinator" do
      expect {
        post :create, params: { coordinator: { name: "John Doe", email: "john@example.com", phone_number: "1234567890" } }
      }.to change(Coordinator, :count).by(1)
    end

    it "redirects to the created coordinator's show page" do
      post :create, params: { coordinator: { name: "John Doe", email: "john@example.com", phone_number: "1234567890" } }
      coordinator = Coordinator.last
      expect(response).to redirect_to(coordinator)
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      get :edit, params: { id: coordinator.id }

      expect(response).to render_template(:edit)
    end

    it "assigns the correct coordinator to @coordinator" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      get :edit, params: { id: coordinator.id }

      expect(assigns(:coordinator)).to eq(coordinator)
    end
  end

  describe "PATCH #update" do
    it "updates the coordinator" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      patch :update, params: { id: coordinator.id, coordinator: { name: "Updated Name" } }

      coordinator.reload
      expect(coordinator.name).to eq("Updated Name")
    end

    it "redirects to the coordinator's show page" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      patch :update, params: { id: coordinator.id, coordinator: { name: "Updated Name" } }

      expect(response).to redirect_to(coordinator)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the coordinator" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      expect {
        delete :destroy, params: { id: coordinator.id }
      }.to change(Coordinator, :count).by(-1)
    end

    it "redirects to the coordinators index page" do
      coordinator = Coordinator.create(name: "John Doe", email: "john@example.com", phone_number: "1234567890")

      delete :destroy, params: { id: coordinator.id }

      expect(response).to redirect_to(coordinators_path)
    end
  end
end
