FactoryBot.define do
  factory :ragnarok_title, class: Ragnarok::Title do
    name '覇王の'
    attack 10
    defense 10
    speed 10
    intelligence 10
    medallion { create(:ragnarok_medallion) }
  end
end

