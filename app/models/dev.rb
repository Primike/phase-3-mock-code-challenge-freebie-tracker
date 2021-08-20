class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.where(item_name: item_name).exists?
    end
    def give_away(dev, freebie)
       self.freebies.find_by(item_name: freebie).update(dev_id: Dev.find_by(name: dev).id)
    end
end
