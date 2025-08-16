return {
    fight_start = function(cutscene, event)
        cutscene:detachFollowers()

        cutscene:setSpeaker("susie")
        cutscene:text("Hey, Kris?", "neutral")
        cutscene:look("susie","up")
        cutscene:walkTo("susie","poi_3", 1.5)
        cutscene:text("It looks like there's some sort of machine here.", "neutral")
        cutscene:text("Is this the thing we're looking for?", "smirk")
        local susie = Game:getPartyMember("susie")
        cutscene:wait(1.5)
        cutscene:look("susie", "right")
        cutscene:walkTo("susie","poi_2", 2)
        cutscene:setSpeaker()
        cutscene:wait(2)
        cutscene:text("uhhh cutscene that separates kris and the soul which i havent made yet!")
        -- Game:removePartyMember("susie")

        Game:addPartyMember("vessel")
        Game:removePartyMember("kris")
        Game:removePartyMember("susie")
        -- susie:setActor(nil)
        cutscene:startEncounter("kris")
    end
}
