-- Enhancements

local hazard = {
   key = "hazard",
   atlas = "AtlasEnhancementsBasic",
   pos = { x = 0, y = 0 },
   config = {num = 1, dem = 6},
   loc_vars = function(self, info_queue, center)
     local num, dem = SMODS.get_probability_vars(center, self.config.num, self.config.dem, 'hazard')
     return {vars = {num, dem}}
   end,
   no_rank = true,
   no_suit = true,
   always_scores = true,
   replace_base_card = true,
   weight = 0,
   in_pool = function(self, args) return false end,
   calculate = function(self, card, context)
    if context.end_of_round and not context.individual and not context.repetition then
      if SMODS.pseudorandom_probability(card, 'hazard', self.config.num, self.config.dem, 'hazard') then
        poke_remove_card(card, card)
      end
    end
   end,
}

return {
   name = "Enhancements",
   list = { hazard, }
}
