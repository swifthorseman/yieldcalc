class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :titleize_full_name!
  before_validation :remove_spaces_telephone!

  has_many :calculators, dependent: :destroy

  validates :full_name, presence: true,
	                    format: { 
	                    with: /\A[a-zA-Z]+[a-zA-Z\-\'\s]+\z/, 
	                    message: 'must start with an alphabet, may contain only alphabets, apostrophes, hyphens and spaces.' }

  validates_length_of :full_name, within: 2..255,
                      too_long: 'must be between 2 and 255 characters inclusive.',
                      too_short: 'must be between 2 and 255 characters inclusive.'

  validates :telephone, presence: true,
	                    format: { 
	                    with: /\A[0][1-9][0-9]+\z/,
	                    message: 'must start with a single zero and may contain only numbers.' }

  validates_length_of :telephone, within: 10..15,
                      too_long: 'must be between 10 and 15 characters inclusive.',
                      too_short: 'must be between 10 and 15 characters inclusive.'


  private
  def titleize_full_name!
    self.full_name = self.full_name.titlecase unless self.full_name.blank?
  end

  def remove_spaces_telephone!
  	self.telephone = self.telephone.gsub(/\s+/, "") unless self.telephone.blank?
  end
end
