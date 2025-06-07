fx_version 'cerulean'
game 'gta5'

author 'Cornerstone Scripts'
name "Cornerstone Sell Shops"
description 'A simple sell shops script for Ox Inventory'
version '1.0.2'

shared_scripts {
    '@ox_lib/init.lua',   
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua',
}

lua54 'yes'
use_fxv2_oal 'yes'