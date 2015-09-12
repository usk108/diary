require 'spec_helper'

describe RecordsController do
  # it "render template index" do
  #   get :index
  #   expect(response).to render_template :index
  # end 

  describe 'GET #index' do
    # ページネーションの指定分だけインスタンス変数に持たせる
    # ファクトリかかないと
    context "when the records are more than 7" do
      it "populates an array of 7 records"
    end
    context "when the records are less than 7" do
      it "populates an array of all records in database" do
        d0906 = create(:record, date: '2015-09-06 21:10:40 +0900')
        d0907 = create(:record, date: '2015-09-07 21:10:40 +0900')
        d0908 = create(:record, date: '2015-09-08 21:10:40 +0900')
        get :index
        expect(assigns(:records)).to eq([d0908, d0907, d0906])
      end
    end

    # :index テンプレートを表示すること
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
