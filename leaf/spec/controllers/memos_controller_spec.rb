require 'spec_helper'

describe MemosController do
  # it "assigns edit Memo" do
  #   test_memo = create(:memo)
  #   get :edit, id: test_memo
  #   expect(assigns(:memo)).to eq(test_memo)
  # end

  # it "save success" do
  #   expect { 
  #     post :create, memo: attributes_for(:memo)
  #   }.to change(Memo, :count).by(1)
  # end

  describe 'GET #new' do
    before do
      @record = create(:record)
    end

    # @memo に新しいメモを割り当てること
    it "assigns a new memo to @memo" do
      get :new, record_id: @record.id
      # expect(assigns(:memo)).to eq(build(:memo))
      expect(assigns(:memo)).to be_a_new(Memo)
    end

    # :new テンプレートを表示すること
    it "renders the :new template" do
      get :new, record_id: @record.id
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    # @memo に要求されたメモを割り当てること
    it "assigns the requested memo to @memo" do
      memo = create(:memo)
      get :edit, id: memo
      expect(assigns(:memo)).to eq memo
    end

    # :edit テンプレートを表示すること
    it "renders the :edit template" do
      memo = create(:memo)
      get :edit, id: memo
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    before do
      @record = create(:record)
      @memo = attributes_for(:memo)
    end

    #有効な属性の場合
    context "with valid attributes" do
      # データベースに新しいメモを保存すること
      it "saves the new contact in the database" do
        expect{post :create, memo: @memo, record_id: @record.id}.to change(Memo, :count).by(1)
      end

      # records#index にリダイレクトすること
      it "redirects to records#index" do
        post :create, memo: @memo, record_id: @record.id
        expect(response).to redirect_to root_path
      end
    end

    # 無効な属性の場合
    context "with invalid attributes" do
      # データベースに新しいメモを保存しないこと
      it "does not save the new memo in the database" do
        expect{post :create, memo: attributes_for(:invalid_memo), record_id: @record.id}.not_to change(Memo, :count)
      end

      # :new テンプレートを再表示すること
      it "re-renders the :new template" do
        post :create, memo: attributes_for(:invalid_memo), record_id: @record.id
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before do
      @memo = create(:memo, sentence: 'old sentence')
    end

    # 有効な属性の場合
    context "with valid attribute" do
      # データベースのメモを更新すること
      it "updates the memo in the database" do
        patch :update, id: @memo, memo: attributes_for(:memo)
        expect(assigns(:memo)).to eq(@memo)
      end

      # @memo の属性を変更すること
      it "changes @memo's attributes" do
        patch :update, id: @memo, memo: attributes_for(:memo, sentence: 'new sentence')
        @memo.reload
        expect(@memo.sentence).to eq('new sentence')
      end

      # records#index にリダイレクトすること
      it "redirects to records#index" do
        patch :update, id: @memo, memo: attributes_for(:memo)
        expect(response).to redirect_to records_path
      end
    end

    # 無効な属性の場合
    context "with invalid attribute" do
      # データベースのメモを更新しないこと
      it "does not update the memo" do
        patch :update, id: @memo, memo: attributes_for(:memo, sentence: nil)
        @memo.reload
        expect(@memo.sentence).to eq('old sentence')
      end

      # :edit テンプレートを再表示すること
      it "re-renders the :edit template" do
        patch :update, id: @memo, memo: attributes_for(:memo, sentence: nil)
        expect(response).to render_template :edit
      end
    end
  end

  # どう書いたらいい？
  # describe 'DELETE #destroy' do
  #   # データベースからメモ
  #   it "deletes the memo from the database"
  #   # records#index にリダイレクトすること
  #   it "redirects to records#index"
  # end

  describe 'GET #search' do
    # 有効な検索ワードの場合
    context "with valid search word" do
      # 該当するメモがあった場合
      context "when some memos contain the word" do
        # @memos に該当するメモを割り当てること
        it "assigns the requested memos to @memos"
        # :seatch テンプレートを表示すること
        it "renders the :seatch template"
      end

      # 該当するメモがなかった場合
      context "when no memo contains the word" do
        # records#index にリダイレクトすること
        it "redirects to records#index"
      end
    end

    # 無効な検索ワードの場合
    # nilとかSQLインジェクションとか
    context "with invalid search word" do
        # records#index にリダイレクトすること
        it "redirects to records#index"
    end
  end
end
