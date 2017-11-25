FactoryBot.define do
  factory :ragnarok_unit, class: Ragnarok::Unit do
    name 'ゴブリン'
    type '亜人'
    protection '火'
    profession 'ブレイダー'
    hp 10
    attack 10
    defense 10
    speed 10
    intelligence 10
    tribe '男魔獣'
    specialty ''
    item1 '片手'
    item2 '両手'
  end
end

