require './test/test_helper'

describe 'ApiView::Engine' do
  describe 'class methods' do
    describe 'render' do
      it "just works" do
        res = ApiView::Engine.render('hey')
        res.must_equal 'hey'
      end

      it "can deduct format from scope (request object)" do
        scope = OpenStruct.new(request: OpenStruct.new(format: 'xml'))
        obj   = [{a: 'hash'}]
        Array.any_instance.stubs(:to_xml).returns('to_xml_works')
        res = ApiView::Engine.render(obj, scope, {})
        res.must_equal('to_xml_works')
      end
    end

    describe 'convert' do
      it "works basic data types" do
        res = ApiView::Engine.convert('hey')
        res.must_equal 'hey'
      end

      it "works with hashes" do
        res = ApiView::Engine.convert({a: 'hash'})
        res.must_equal({:a=>"hash"})
      end

      it "works with arrays" do
        res = ApiView::Engine.convert([{a: 'hash'}])
        res.must_equal([{:a=>"hash"}])
      end

      it "works with arrays and extra params" do
        res = ApiView::Engine.convert([{a: 'hash'}], {format: 'json'})
        res.must_equal([{:a=>"hash"}])
      end
    end
  end

  describe 'instance methods' do
  end
end