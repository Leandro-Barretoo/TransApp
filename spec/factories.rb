# rubocop:disable Metrics/BlockLength

FactoryBot.define do
  factory :user, aliases: [:author] do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { 'password' }

    factory :user_with_groups do
      transient do
        groups_count { 5 }
      end

      groups do
        Array.new(groups_count) { association(:group) }
      end

      factory :user_with_buys do
        transient do
          buys_count { 5 }
        end

        buys do
          Array.new(buys_count) { association(:buy) }
        end
      end
    end
  end

  factory :group do
    name { Faker::Company.name }
    icon { Faker::Company.logo }
    user

    factory :group_with_buys do
      transient do
        buys_count { 5 }
      end

      buys do
        Array.new(buys_count) { association(:buy) }
      end
    end
  end

  factory :buy do
    name { Faker::Commerce.product_name }
    amount { Faker::Commerce.price }
    author

    factory :buy_with_groups do
      transient do
        groups_count { 5 }
      end

      groups do
        Array.new(groups_count) { association(:group) }
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
