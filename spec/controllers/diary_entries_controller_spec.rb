require 'spec_helper'
require "factory_girl"

describe DiaryEntriesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:entry1) { FactoryGirl.create(:diary_entry) }

  before do
    sign_in :user, user
  end

  # This should return the minimal set of attributes required to create a valid
  # DiaryEntry. As you add validations to DiaryEntry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "lights_out" => "2013-12-15 08:19:00" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DiaryEntriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all diary_entries for the current user as @diary_entries" do
      user.diary_entries.create(:notes => "my fancy notes")
      get :index, {}, valid_session
      assigns(:diary_entries).should eq([user.diary_entries.first])
    end

    it "should not return other users' entries" do
      user2 = FactoryGirl.create(:user)
      user2.diary_entries.create(:notes => "my fancy notes 2")
      get :index, {}, valid_session
      assigns(:diary_entries).should eq([])
    end
  end

  describe "GET show" do
    it "assigns the requested diary_entry as @diary_entry" do
      diary_entry = DiaryEntry.create! valid_attributes
      user.diary_entries << diary_entry
      get :show, {:id => diary_entry.to_param}, valid_session
      assigns(:diary_entry).should eq(diary_entry)
    end

    it "raises an error if the current user is not the owner of the entry" do
      diary_entry = DiaryEntry.create! valid_attributes
      expect do
        get :show, {:id => diary_entry.to_param}, valid_session
      end.to raise_error
    end
  end

  describe "GET new" do
    it "assigns a new diary_entry as @diary_entry" do
      get :new, {}, valid_session
      assigns(:diary_entry).should be_a_new(DiaryEntry)
    end
  end

  describe "GET edit" do
    it "assigns the requested diary_entry as @diary_entry" do
      diary_entry = DiaryEntry.create! valid_attributes
      get :edit, {:id => diary_entry.to_param}, valid_session
      assigns(:diary_entry).should eq(diary_entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DiaryEntry" do
        expect {
          post :create, {:diary_entry => valid_attributes}, valid_session
        }.to change(DiaryEntry, :count).by(1)
      end

      it "assigns a newly created diary_entry as @diary_entry" do
        post :create, {:diary_entry => valid_attributes}, valid_session
        assigns(:diary_entry).should be_a(DiaryEntry)
        assigns(:diary_entry).should be_persisted
      end

      it "assigns the new entry to the current user" do
        user.diary_entries.count.should == 0
        post :create, {:diary_entry => valid_attributes}, valid_session
        user.diary_entries.count.should == 1
      end

      it "redirects to the created diary_entry" do
        post :create, {:diary_entry => valid_attributes}, valid_session
        response.should redirect_to(DiaryEntry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved diary_entry as @diary_entry" do
        # Trigger the behavior that occurs when invalid params are submitted
        DiaryEntry.any_instance.stub(:save).and_return(false)
        post :create, {:diary_entry => { "lights_out" => "invalid value" }}, valid_session
        assigns(:diary_entry).should be_a_new(DiaryEntry)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DiaryEntry.any_instance.stub(:save).and_return(false)
        post :create, {:diary_entry => { "lights_out" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested diary_entry" do
        diary_entry = DiaryEntry.create! valid_attributes
        # Assuming there are no other diary_entries in the database, this
        # specifies that the DiaryEntry created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DiaryEntry.any_instance.should_receive(:update).with({ "lights_out" => "2013-12-15 08:19:00" })
        put :update, {:id => diary_entry.to_param, :diary_entry => { "lights_out" => "2013-12-15 08:19:00" }}, valid_session
      end

      it "assigns the requested diary_entry as @diary_entry" do
        diary_entry = DiaryEntry.create! valid_attributes
        put :update, {:id => diary_entry.to_param, :diary_entry => valid_attributes}, valid_session
        assigns(:diary_entry).should eq(diary_entry)
      end

      it "redirects to the diary_entry" do
        diary_entry = DiaryEntry.create! valid_attributes
        put :update, {:id => diary_entry.to_param, :diary_entry => valid_attributes}, valid_session
        response.should redirect_to(diary_entry)
      end
    end

    describe "with invalid params" do
      it "assigns the diary_entry as @diary_entry" do
        diary_entry = DiaryEntry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DiaryEntry.any_instance.stub(:save).and_return(false)
        put :update, {:id => diary_entry.to_param, :diary_entry => { "lights_out" => "invalid value" }}, valid_session
        assigns(:diary_entry).should eq(diary_entry)
      end

      it "re-renders the 'edit' template" do
        diary_entry = DiaryEntry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DiaryEntry.any_instance.stub(:save).and_return(false)
        put :update, {:id => diary_entry.to_param, :diary_entry => { "lights_out" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested diary_entry" do
      diary_entry = DiaryEntry.create! valid_attributes
      expect {
        delete :destroy, {:id => diary_entry.to_param}, valid_session
      }.to change(DiaryEntry, :count).by(-1)
    end

    it "redirects to the diary_entries list" do
      diary_entry = DiaryEntry.create! valid_attributes
      delete :destroy, {:id => diary_entry.to_param}, valid_session
      response.should redirect_to(diary_entries_url)
    end
  end

end
