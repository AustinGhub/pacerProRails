require 'rails_helper'

RSpec.describe Item, type: :model do

  it 'soft deletes an item' do
    item = Item.create(name: 'Test Item')
    item.soft_delete
    expect(item.deleted_at).not_to be_nil
  end

  it 'restores a soft-deleted item' do
    item = Item.create(name: 'Test Item')
    item.soft_delete
    item.restore
    expect(item.deleted_at).to be_nil
  end

  it 'excludes soft-deleted items from normal queries' do
    item1 = Item.create(name: 'Item 1')
    item2 = Item.create(name: 'Item 2').soft_delete
    expect(Item.count).to eq(1)
  end

  it 'soft deletes multiple items and restores' do 
    item1 = Item.create(name: 'astro')
    item2 = Item.create(name: 'travis scott')
    item3 = Item.create(name: 'newjeans')
    item4 = Item.create(name: 'bts')
    item5 = Item.create(name: 'flash')
    item6 = Item.create(name: 'luffy')

    item6.soft_delete
    item1.soft_delete
    item5.soft_delete
    expect(item6.deleted_at).not_to be_nil
    expect(item1.deleted_at).not_to be_nil
    expect(Item.count).to eq(3)

    item6.restore
    expect(Item.count).to eq(4)
    item1.restore
    expect(Item.count).to eq(5)
  end

  it 'does not include soft-deleted items in find operations' do
    item = Item.create(name: 'Test Item')
    item.soft_delete
    expect(Item.find_by(name: 'Test Item')).to be_nil
  end


  it 'finds the item in the query when the query is unscoped' do
    item = Item.create(name: 'Test Item')
    item.soft_delete
    expect(Item.unscoped { Item.find_by(name: 'Test Item') }).to eq(item)
  end

end



