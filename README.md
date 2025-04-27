# Cornerstone: Sell Shops

## Configs

### cl_congfig.lua
- This config handles the ped location and basic client side information about the buyer.

### sv_config.lua
- This config handles the validation of the the items and handles the payout. 

The buyer name in client config must match the table name in sever config in order to properly pair a buyer to his items.   

## Dependencies
- Ox lib
- Ox Target
- Ox Inventory

A simple script to create peds who will buy items from players. You can create as many buyers as you want, each with unique list of items they will purchase. Can even get creative and pay the players using special items or set up some kind of pyschotic scavenger hunt where you go from buyer to buyer to trade. 

The script assumes you have money set as an item. You can reward any item to the player that you want. If you are not using money as an item you will need to code that logic in yourself.

## Support

There is no support for this script. It was written for use with Ox inventory on a QBox server and will not be updated to support other inventories of frameworks. You are free to make those changes yourself. 

It's crap code, created to serve a singular purpose.
