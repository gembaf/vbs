shared_context 'all' do
  let(:skills) do
    skills = []
    skills << create(:ragnarok_skill, name: '致命必殺')
    skills << create(:ragnarok_skill, name: 'カブト割')
    skills << create(:ragnarok_skill, name: '大雷撃陣')
  end

  let(:medallions) do
    medallions = []
    medallions << create(:ragnarok_medallion, reality: 3)
    medallions << create(:ragnarok_medallion, reality: 5)
    medallions << create(:ragnarok_medallion, reality: 8)
  end
end

