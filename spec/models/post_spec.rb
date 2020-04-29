require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with title and image' do
        expect(build(:post)).to be_valid
      end
    end
    context 'can not save' do
      it 'is invalid without title and image' do
        post = build(:post, title: nil, image: nil)
        post.valid?
        expect(post.errors[:title]).to include("can't be blank")
      end

      it 'is invalid without title' do
        post = build(:post, title: nil)
        post.valid?
        expect(post.errors[:title]).to include("can't be blank")
      end

      it 'is invalid without image' do
        post = build(:post, image: nil)
        post.valid?
        expect(post.errors[:image]).to include("can't be blank")
      end

      it 'is invalid without User' do
        post = build(:post, user_id: nil)
        post.valid?
        expect(post.errors[:user]).to include("must exist")
      end
    end
  end
end