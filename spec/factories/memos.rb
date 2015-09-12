# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :memo do
    association :record
    #       sentence  = "
    # # 研究
    # ## アイデア
    # - アイデアその1-#{n}
    # - アイデアその2-#{n}
    # - アイデアその3-#{n}
    #   - 先生のコメント
    
    #   > 絵を描いたほうがいい

    # ## TODO
    # - 事務処理-#{n}
    # - 研究相談-#{n}

    # ## DONE
    # - プロトタイプ作成-#{n}
    #       "
    sequence(:sentence) { |n| "# 研究\r\n## アイデア\r\n- アイデアその1-#{n}\r\n- アイデアその2-#{n}\r\n- アイデアその3-#{n}\r\n - 先生のコメント\r\n > 絵を描いたほうがいい\r\n\r\n## TODO\r\n- 事務処理-#{n}\r\n- 研究相談-#{n}\r\n\r\n## DONE\r\n- プロトタイプ作成-#{n}\r\n" }
  
    factory :invalid_memo do 
      sentence nil
    end

  end
end
