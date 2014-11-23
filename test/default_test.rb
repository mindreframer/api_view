require './test/test_helper'

describe 'ApiView::Default' do
  describe 'class methods' do
    describe 'convert' do
      it "works with to_api" do
        mock = Minitest::Mock.new.expect(:to_api, {field: 'to_api'})
        res = ApiView::Default.convert(mock)
        res.must_equal({:field=>"to_api"})
      end

      it "works with to_hash" do
        mock = Minitest::Mock.new.expect(:to_hash, {field: 'to_hash'})
        res = ApiView::Default.convert(mock)
        res.must_equal({:field=>"to_hash"})
      end

      it "works with serializable_hash" do
        mock = Minitest::Mock.new.expect(:serializable_hash, {field: 'serializable_hash'})
        res = ApiView::Default.convert(mock)
        res.must_equal({:field=>"serializable_hash"})
      end

      it "works with serializable_hash" do
        res = ApiView::Default.convert({hey: 'hey'})
        res.must_equal({:hey=>"hey"})
      end
    end
  end
end
