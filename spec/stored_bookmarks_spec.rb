require './lib/stored_bookmarks'

describe StoredBookmarks do

subject(:stored_bookmarks) { described_class }

  describe '.all' do
    it 'should return all saved bookmarks' do
      expect(stored_bookmarks.all).to be_an Array
    end
  end

  describe '.add' do
    it 'should add a bookmark to the stored bookmarks' do
      stored_bookmarks.add('http://www.stackoverflow.com', 'stackoverflow')
      expect(stored_bookmarks.all).to include('stackoverflow')
    end
  end

  describe '.delete' do
    it 'should delte bookmark when button is clicked' do
      stored_bookmarks.delete('http://www.stackoverflow.com', 'stackoverflow')
      expect(stored_bookmarks.all).to_not include('stackoverflow')
    end
  end
end
