module CalculatorsHelper

	def self.yearly_yield(current_rent, initial_cost)
		return (current_rent / initial_cost) * 100
	end

end
