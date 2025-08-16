return {
    susie_entry = function(cutscene, event)
        -- make kris walk to the "room_center" marker, taking 1 second, and wait until they're done\
        cutscene:detachCamera()
        cutscene:detachFollowers()
        cutscene:wait(cutscene:walkTo("susie", "poi_1", 1))
        cutscene:setSpeaker("susie")
        cutscene:text("Here we are, Kris...", "neutral")
        cutscene:text("This place seems kinda... [wait:5] off.", "annoyed_down")
        cutscene:wait(1)
        cutscene:attachCamera()
        cutscene:alignFollowers()
        cutscene:attachFollowers()
        cutscene:wait(1)
        cutscene:text("Let's go.", "small_smile")
    end
}