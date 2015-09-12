require 'spec_helper'
#require 'rails_helper'

describe Memo do
  # 文章とrecord_idがあれば有効な状態であること
  it "is valid with a sentence, record_id" do
    # memo = Memo.new(
    #   sentence: 'Sentence of Memo',
    #   record_id: 1
    #   )
    expect(build(:memo)).to be_valid
  end

  # 文章がなければ無効な状態であること
  it "is invalid without sentence" do
    # memo = Memo.new(sentence: nil)
    memo = build(:memo, sentence: nil)
    memo.valid?
    # binding.pry
    # 現在日本語設定にしているためこのテストは通らない
    # expect(memo.errors[:sentence]).to include("can't be blank")
    expect(memo.errors[:sentence]).to include("を入力してください")
  end

  # 重複したrecord_idなら無効な状態であること
  it "is invalid with a duplicate record_id" do
    # Memo.create(
    #   sentence: 'Sentence of Memo',
    #   record_id: 1
    #   )

    # memo = Memo.new(
    #   sentence: 'Sentence of Memo',
    #   record_id: 1
    #   )

    record = create(:record)
    beforememo = create(:memo, record_id: record.id)
    memo = build(:memo, record_id: record.id)
    memo.valid?
    
    # 現在日本語設定にしているためこのテストは通らない
    # expect(memo.errors[:record_id]).to include("has already been taken")
    expect(memo.errors[:record_id]).to include("はすでに存在します")
  end

end
