require 'rails_helper'

feature 'Memo management' do
  let(:memo) { build_stubbed(:memo, sentence: 'sentence which is not markdown text') }

  # 新しいメモを追加する
  scenario "adds a new memo" do


    record = create(:record)
    create(:memo, record_id: record.id)
    today = Time.now

    expect{
      visit root_path

      click_link '新規作成'
      fill_in 'memo_sentence', with: memo.sentence
      click_button '登録する'
    }.to change(Memo, :count).by(1) #.and change(Record, :count).by(1)
    expect(current_path).to eq root_path
    expect(page).to have_content "#{today.year}年#{today.month}月#{today.day}日"
    expect(page).to have_content memo.sentence
  end
end


