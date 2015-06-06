require 'rails_helper'

RSpec.describe Company, :type => :model do

  before{ @company = FactoryGirl.create(:company) }

  context "validates name" do
    it 'has name' do
      @company.name = nil
      expect(@company).not_to be_valid
    end

    it 'name minimum length' do
      @company.name = 'aaaa'
      expect(@company).not_to be_valid
    end

    it 'name maximum length' do
      @company.name = 'a' * 81
      expect(@company).not_to be_valid
    end
  end

  context "validates cnpj" do
    it 'is present' do
      @company.cnpj = nil
      expect(@company).not_to be_valid
    end

    it 'length' do
      @company.cnpj = 'aaaa'
      expect(@company).not_to be_valid
    end

    it 'only numbers' do
      @company.cnpj = '60746948TESTE2'
      expect(@company).not_to be_valid
    end

    it 'valid' do
      #cnpj inválido que passaria nas validações acima
      @company.cnpj = '12346948000112'
      expect(@company).not_to be_valid
      #cnpj real (válido)
      @company.cnpj = '60746948000112'
      expect(@company).to be_valid
    end
  end
end
