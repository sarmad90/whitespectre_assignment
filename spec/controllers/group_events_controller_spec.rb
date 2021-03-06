require 'rails_helper'

RSpec.describe GroupEventsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # GroupEvent. As you add validations to GroupEvent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { published: false }
  }

  let(:invalid_attributes) {
    { published: true }
  }

  before do
    request.env["HTTP_ACCEPT"] = 'application/json'
    request.env["ACCEPT"] = 'application/json'
  end

  describe "GET #index" do
    it "assigns all group events as @group_events" do
      group_event = GroupEvent.create! valid_attributes
      get :index
      expect(assigns(:group_events)).to eq([group_event])
    end
  end

  describe "GET #show" do
    it "assigns the requested group_event as @group_event" do
      group_event = GroupEvent.create! valid_attributes
      get :show, id: group_event.to_param
      expect(assigns(:group_event)).to eq(group_event)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new group_event" do
        expect {
          post :create, group_event: valid_attributes
        }.to change(GroupEvent, :count).by(1)
      end

      it "assigns a newly created group_event as @group_event" do
        post :create, group_event: valid_attributes
        expect(assigns(:group_event)).to be_a(GroupEvent)
        expect(assigns(:group_event)).to be_persisted
      end

      it "render the created group_event" do
        post :create, group_event: valid_attributes
        expect(response).to render_template("show")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved group_event as @group_event" do
        post :create, group_event: invalid_attributes
        expect(assigns(:group_event)).to be_a_new(GroupEvent)
      end

      it "re-renders the 'new' template" do
        post :create, group_event: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates a group event" do
        some_group_event = GroupEvent.create!
        put :update, id: some_group_event.id, group_event: { name: "new name" }
        expect(response).to render_template("show")
        expect(assigns(:group_event).name).to eq("new name")
      end
    end

    context "with invalid params" do
      it "doesn't update a group event" do
        some_group_event = GroupEvent.create!
        put :update, id: some_group_event.id, group_event: { published: true }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET #publish" do
    context "with valid params" do
      it "publishes a group event" do
        some_group_event = GroupEvent.create!(name: "some name", description: "some description",
          start_date: 3.days.ago, end_date: DateTime.now)
        expect(some_group_event.published?).to be false
        get :publish, id: some_group_event.id
        expect(response).to render_template("show")
        expect(assigns(:group_event).published?).to be true
      end
    end

    context "with valid params" do
      it "doesn't publish a group event" do
        some_group_event = GroupEvent.create!
        expect(some_group_event.published?).to be false
        get :publish, id: some_group_event.id
        expect(response).to have_http_status(:unprocessable_entity)
        expect(assigns(:group_event).errors.count).to eq(4)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested support_case" do
      group_event = GroupEvent.create! valid_attributes
      expect {
        delete :destroy, id: group_event.to_param
      }.to change(GroupEvent, :count).by(-1)
    end
  end

end
