require "rails_helper"
RSpec.describe Admin::CategoriesController, type: :controller do
  let(:category) {FactoryBot.create :category}
  subject {category}

  let(:category_invalid) do
    {name: ""}
  end

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET edit" do
    it "render edit" do
      get :edit, params: {id: category.id}
      expect(response).to have_http_status(:ok)
      expect(response).to render_template "edit"
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create,
        params: {category: FactoryBot.attributes_for(:category)}}
      it "creates a new category" do
        expect(assigns(:category)).to be_a Category
      end

      it "redirects after create" do
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    context "invalid params" do
      before {post :create, params: {category: category_invalid}}
      it "render new" do
        expect(response).to render_template "new"
      end
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: subject.id, category: {name: "man",
          description: "", parent_id: 0, active: 0}}
        expect(flash[:success]).to match("update succeed")
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    context "update category" do
      it "update fail" do
        patch :update, params: {id: subject.id, category:{name: ""}}
        expect(flash[:danger]).to match("update failed")
        expect(response).to render_template "edit"
      end
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: subject.id}}
    it "category not found" do
      delete :destroy, params: {id: subject.id}
      expect(flash[:danger]).to match("Not found category")
      expect(response).to redirect_to(admin_categories_path)
    end

    it "delete success" do
      delete :destroy, params: {id: subject.id}
      expect(flash[:success]).to match("Delete succeed")
      expect(response).to redirect_to(admin_categories_path)
    end
  end

  describe "PATCH #active" do
    it "active category" do
      post :active, params: {id: subject.id, category: {active: 1}}, format: "json"
    end
  end
end
