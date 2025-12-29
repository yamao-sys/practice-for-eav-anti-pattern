# NOTE: ridgepoleでスキーマ変更を行うにあたり、rails組み込みのdb系コマンドで使用が想定されるものを置き換え
namespace :bulk_import do
  desc "Bulk import data"

  task run: :environment do
    seed_numbers = (1..20000000).to_a

    contract_ids = seed_numbers.sample(10000)
    column_ids = seed_numbers.sample(16)

    p "column_ids: #{column_ids}"

    now = Time.now

    number_contract_details = []
    multiline_text_contract_details = []
    datetime_contract_details = []
    user_contract_details = []
    text_contract_details = []
    option_contract_details = []

    contract_ids.each do |contract_id|
      [column_ids[0], column_ids[12], column_ids[13]].each do |column_id|
        number_contract_details << {
          contract_id:,
          column_id:,
          value: Faker::Number.between(from: 1, to: 10000000),
          created_at: now,
          updated_at: now
        }
      end

      [column_ids[1]].each do |column_id|
        multiline_text_contract_details << {
          contract_id:,
          column_id:,
          value: Faker::Lorem.paragraph(sentence_count: 10),
          created_at: now,
          updated_at: now
        }
      end

      [column_ids[2], column_ids[7], column_ids[9], column_ids[11]].each do |column_id|
        datetime_contract_details << {
          contract_id:,
          column_id:,
          value: Faker::Time.between(from: 10.years.ago, to: Time.now),
          created_at: now,
          updated_at: now
        }
      end

      [column_ids[3], column_ids[5], column_ids[6]].each do |column_id|
        user_contract_details << {
          contract_id:,
          column_id:,
          user_id: Faker::Number.between(from: 1, to: 10000000),
          created_at: now,
          updated_at: now
        }
      end

      [column_ids[4], column_ids[10], column_ids[15]].each do |column_id|
        text_contract_details << {
          contract_id:,
          column_id:,
          value: Faker::Lorem.sentence(word_count: 10),
          created_at: now,
          updated_at: now
        }
      end

      [column_ids[8], column_ids[14]].each do |column_id|
        option_contract_details << {
          contract_id:,
          column_id:,
          option_id: Faker::Number.between(from: 1, to: 10000000),
          created_at: now,
          updated_at: now
        }
      end
    end

    number_contract_details.each_slice(10000) do |batch_number_contract_details|
      NumberContractDetail.insert_all(batch_number_contract_details)
    end
    p "number_contract_details: #{number_contract_details.count}"

    multiline_text_contract_details.each_slice(10000) do |batch_multiline_text_contract_details|
      MultilineTextContractDetail.insert_all(batch_multiline_text_contract_details)
    end
    p "multiline_text_contract_details: #{multiline_text_contract_details.count}"

    datetime_contract_details.each_slice(10000) do |batch_datetime_contract_details|
      DatetimeContractDetail.insert_all(batch_datetime_contract_details)
    end
    p "datetime_contract_details: #{datetime_contract_details.count}"

    user_contract_details.each_slice(10000) do |batch_user_contract_details|
      UserContractDetail.insert_all(batch_user_contract_details)
    end
    p "user_contract_details: #{user_contract_details.count}"

    text_contract_details.each_slice(10000) do |batch_text_contract_details|
      TextContractDetail.insert_all(batch_text_contract_details)
    end
    p "text_contract_details: #{text_contract_details.count}"

    option_contract_details.each_slice(10000) do |batch_option_contract_details|
      OptionContractDetail.insert_all(batch_option_contract_details)
    end
    p "option_contract_details: #{option_contract_details.count}"
  end
end
