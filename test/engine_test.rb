require './test/test_helper'

describe 'ApiView::Engine' do
  describe 'class methods' do
    describe 'render' do
      it "just works" do
        res = ApiView::Engine.render('hey')
        res.must_equal 'hey'
      end
    end

    describe 'render' do
      it "just works" do
        res = ApiView::Engine.convert('hey')
        res.must_equal 'hey'
      end
    end
  end

  describe 'instance methods' do
  end
end