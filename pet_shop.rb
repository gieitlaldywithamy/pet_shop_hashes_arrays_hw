def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets_sold)
  pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  pets_of_breed = []
  for pet in pet_shop[:pets]
    if (pet[:breed] == breed)
      pets_of_breed << pet
    end
  end
  return pets_of_breed
end


def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
    return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, pet_name))
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets] << pet
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  customer_cash_to_spend = customer[:cash]
  new_pet_cost = pet[:price]
  return customer_cash_to_spend >= new_pet_cost
end

def sell_pet_to_customer(pet_shop, pet, customer)

  #check the pet exists
  #check customer can afford the pet
  if pet_shop[:pets].include? pet
      
    if customer_can_afford_pet(customer, pet)
      #take cash away from customer
      customer[:cash] -= pet[:price]
      #put the cash in the shop till
      add_or_remove_cash(pet_shop, pet[:price])
      #remove pet from stock (to continue metaphor...take the pet outside)
      remove_pet_by_name(pet_shop, pet[:name])
      increase_pets_sold(pet_shop, 1)
      #give the pet to the customer
      add_pet_to_customer(customer, pet)

      #why do i have to update the customer pet length?
    #when it's being accessed in test, i have already modified it?
    end
  end
end
