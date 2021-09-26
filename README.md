# Computercraft
TODO:

inventoryManagement.lua: 

    + Pregenerated search for Iron, Copper, Gold, and other common ore types
    
    +̶ C̶r̶e̶a̶t̶e̶ a̶ l̶o̶o̶k̶u̶p̶ t̶a̶b̶l̶e̶ t̶h̶a̶t̶ c̶o̶n̶t̶a̶i̶n̶s̶ k̶e̶y̶ v̶a̶r̶i̶a̶b̶l̶e̶ i̶t̶e̶m̶N̶a̶m̶e̶ a̶n̶d̶ v̶a̶l̶u̶e̶ v̶a̶r̶i̶a̶b̶l̶e̶ "̶t̶i̶l̶e̶_̶t̶h̶e̶r̶m̶a̶l̶e̶x̶p̶a̶n̶s̶i̶o̶n̶_̶c̶a̶c̶h̶e̶_̶r̶e̶s̶o̶n̶a̶n̶t̶_̶n̶a̶m̶e̶n̶_̶"̶.̶.̶i̶ a̶n̶d̶  c̶o̶m̶p̶a̶r̶e̶s̶ s̶e̶a̶r̶c̶h̶ s̶t̶r̶i̶n̶g̶ v̶a̶r̶ "̶s̶e̶a̶r̶c̶h̶"̶
    T̶h̶e̶ l̶o̶o̶k̶u̶p̶ t̶a̶b̶l̶e̶ w̶i̶l̶l̶ r̶e̶d̶u̶c̶e̶ C̶P̶U̶ c̶y̶c̶l̶e̶s̶ a̶n̶d̶ m̶a̶k̶e̶ t̶h̶e̶ p̶r̶o̶g̶r̶a̶m̶ f̶a̶s̶t̶e̶r̶

    (PARTIALLY DONE, numberofObjects var has been created, but not dynamic table generation.)
    + create a scan() function to generate lookup tables of dynamic architectures.

    + Create a "fuzzy search" algorithm for the lookup table using either Levenshtein distance
    or Cosine similarity

    +̶ I̶m̶p̶r̶o̶v̶e̶ u̶p̶o̶n̶ t̶h̶e̶ p̶a̶g̶i̶n̶a̶t̶e̶d̶ s̶e̶a̶r̶c̶h̶ f̶u̶n̶c̶t̶i̶o̶n̶ s̶o̶ t̶h̶a̶t̶ t̶h̶e̶ r̶e̶s̶u̶l̶t̶s̶ a̶r̶e̶ d̶y̶n̶a̶m̶i̶c̶a̶l̶l̶y̶ g̶e̶n̶e̶r̶a̶t̶e̶d̶
    i̶n̶s̶t̶e̶a̶d̶ o̶f̶ h̶a̶r̶d̶c̶o̶d̶e̶d̶

    +̶ R̶e̶d̶u̶c̶e̶ t̶h̶e̶ a̶m̶o̶u̶n̶t̶ o̶f̶ l̶i̶n̶e̶s̶ u̶s̶e̶d̶ f̶o̶r̶ e̶a̶c̶h̶ p̶a̶g̶i̶n̶a̶t̶e̶d̶ r̶e̶c̶o̶r̶d̶

    + Create a push-pull system to satisfy item requests across the network and
    initiate the chain of production

    + Create a map of all intermediate crafting items and a complex crafting algorithm that will
    dynamically satisfy requests to eliminate wasteful automation

    + Create a wireless protocol that will interact with turtles for automatic crafting
    requests

ftpclient.lua:
ftpserver.lua:


What are the common ores?
    Vanilla:
        + Coal
        + Iron
        + Gold
        + Diamond
        + Emerald
        + Redstone
        + Glowstone
    Thermal Expansion:
        + Platinum "Shiny Ore" -> Platinum Ingot
        + Nickel "Ferrous Ore" -> Invar Ingot
        + Copper - > Copper Ingot
        + Tin -> Tin Ingot
        + Silver -> Silver Ingot
        + Lead -> Lead Ingot
        + Aluminum -> Aluminum Ingot
        + Iridium
        + Electrum Ingot
        + Bronze Ingot
        + Lumium
        + Signalum
        + Enderium
    libVulpes:
        + Copper
        I don't fucking know because there's no list lol
    Orespawn:
        + Titanium
        + Uranium
        + Ruby
        + Amethyst
        
        

What other common search categories would there be?
    + Logistics (piping wiring etc)
    + Machines/Production
    + Intermediate products
    + Tools
    + Combat
    + Utility

    goal: figure out which modem number corresponds to each item
