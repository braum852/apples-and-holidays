require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july].last #.last prints last array, also works if we reference the array number like [0] or [1] in this case
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas][1] = supply
  holiday_hash[:winter][:new_years][1] = supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day][1] = supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].collect do |holiday, supplies|
   supplies
  end.flatten #flatten used here as it should condense the initial mapped array - 
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    puts "#{season.capitalize}:" #Uses string interpolation to capitalise first letter(.capitalize) of each season
    holidays.each do |holiday, supplies|
      puts "  #{holiday.to_s.split('_').map {|x| x.capitalize }.join(' ')}: #{supplies.join(", ")}" 
    end
  end
end
#LINE 68 The .to_s method on a symbol (all holidays are with the _) to convert it into a string, the .split method removes all of the "_". The .map returns the whole new array
#{|x| x.capitalize }.join(' ') - capitalises the first letter of each argument then connects all with a space ' ' through the .join method}
# Last simple - interpolates all supplies and separates with comma first then space - ", "



def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.collect do |season, holiday|
    holiday.collect do |holiday, supplies| #only includes supplies from holiday, second mapping required because we are going to target the supply named BBQ
      holiday if supplies.include?("BBQ") #however we only want to just print BBQ - this allows it
    end
  end.flatten.compact #flatten condenses all elements to one string, compact eliminates all "nil" values from the holiday key, since we are only printing BBQ, all corresponding vlues from holiday keys will also print "nil", .compact fixes that
end







