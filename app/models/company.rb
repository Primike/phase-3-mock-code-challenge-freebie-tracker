class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: Dev.find_by(name: dev).id)
    end

    def self.oldest_company
        self.minimum(:founding_year)
    end
        
end
