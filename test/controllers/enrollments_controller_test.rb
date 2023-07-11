require 'rails_helper'

RSpec.describe EnrollmentsController, type: :controller do
  coordinator1 = Coordinator.find_or_create_by(name: "Prakash Chaudhary", email: "chaudharyprakash1993@gmail.com", phone_number: "9662402742")
  coordinator2 = Coordinator.find_or_create_by(name: "Test", email: "test1@gmail.com", phone_number: "12334556666")
  partocopant = Participant.find_or_create_by({ name: 'Participant', gender: 'Male', date_of_birth: Date.new(1990, 1, 1) })
  partocopant1 = Participant.find_or_create_by({ name: 'Participant1', gender: 'FeMale', date_of_birth: Date.new(1992, 1, 1) })
  r1 = Registry.find_or_create_by({ name: 'Registry 1', location: 'Location 1', state: 0 })
  r2 = Registry.find_or_create_by({ name: 'Registry 2', location: 'Location 2', state: 0 })

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all enrollments to @enrollments" do
      enrollment1 = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks 1")
      
      enrollment2 = Enrollment.create(participant_id: partocopant1.id, registry_id: 2, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "email", remarks: "Enrollment remarks 2")

      get :index

      expect(assigns(:enrollments)).to eq([enrollment1, enrollment2])
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

      get :show, params: { id: enrollment.id }

      expect(response).to render_template(:show)
    end

    it "assigns the correct enrollment to @enrollment" do
      enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

      get :show, params: { id: enrollment.id }

      expect(assigns(:enrollment)).to eq(enrollment)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new enrollment to @enrollment" do
      get :new
      expect(assigns(:enrollment)).to be_a_new(Enrollment)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new enrollment" do
        expect {
          post :create, params: { enrollment: { participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks" } }
        }.to change(Enrollment, :count).by(1)
      end

      it "redirects to the created enrollment's show page" do
        post :create, params: { enrollment: { participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks" } }
        enrollment = Enrollment.last
        expect(response).to redirect_to(enrollment)
      end
    end

    context "with invalid attributes" do
      it "does not create a new enrollment" do
        expect {
          post :create, params: { enrollment: { participant_id: nil, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks" } }
        }.not_to change(Enrollment, :count)
      end

      it "renders the new template" do
        post :create, params: { enrollment: { participant_id: nil, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks" } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

      get :edit, params: { id: enrollment.id }

      expect(response).to render_template(:edit)
    end

    it "assigns the correct enrollment to @enrollment" do
      enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

      get :edit, params: { id: enrollment.id }

      expect(assigns(:enrollment)).to eq(enrollment)
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the enrollment" do
        enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

        patch :update, params: { id: enrollment.id, enrollment: { remarks: "Updated remarks" } }

        enrollment.reload
        expect(enrollment.remarks).to eq("Updated remarks")
      end

      it "redirects to the enrollment's show page" do
        enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

        patch :update, params: { id: enrollment.id, enrollment: { remarks: "Updated remarks" } }

        expect(response).to redirect_to(enrollment)
      end
    end

    context "with invalid attributes" do
      it "does not update the enrollment" do
        enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

        patch :update, params: { id: enrollment.id, enrollment: { participant_id: nil } }

        enrollment.reload
        expect(enrollment.participant_id).not_to be_nil
      end

      it "renders the edit template" do
        enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

        patch :update, params: { id: enrollment.id, enrollment: { participant_id: nil } }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the enrollment" do
      enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

      expect {
        delete :destroy, params: { id: enrollment.id }
      }.to change(Enrollment, :count).by(-1)
    end

    it "redirects to the enrollments index page" do
      enrollment = Enrollment.create(participant_id: partocopant.id, registry_id: r1.id, coordinator_id: coordinator1.id, date_of_enrollment: Date.today, method_of_contact: "phone", remarks: "Enrollment remarks")

      delete :destroy, params: { id: enrollment.id }

      expect(response).to redirect_to(enrollments_path)
    end
  end
end
