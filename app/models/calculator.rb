class Calculator < ActiveRecord::Base

  before_validation :upcase_post_code!

  belongs_to :user

  # https://gist.github.com/jasonneylon/4407872
  validates_format_of :post_code, :with =>  /\A([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\s?[0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$\z/i, :message => "Invalid post code." 

	validates :current_rent, presence: true
	validates :current_rent, :numericality => { :greater_than  => 0 }

	validates :initial_cost, presence: true
	validates :initial_cost, :numericality => { :greater_than  => 0 }

	validates :user_id,  presence: true	

	private
  def upcase_post_code!
    post_code.upcase! unless post_code.nil?
  end

end
