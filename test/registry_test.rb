require './test/test_helper'

describe 'ApiView::Registry' do
  describe 'class methods' do
    describe 'add_model' do
      it "just works" do
        model     = Class.new
        converter = Class.new
        ApiView::Registry.add_model(model, converter)
        ApiView::Registry.models.keys.must_include model.to_s
      end
    end

    describe 'converter_for' do
      it "just works" do
        model     = Class.new
        converter = Class.new
        ApiView::Registry.add_model(model, converter)

        ApiView::Registry.converter_for(model).must_equal converter
      end
    end
  end
end
