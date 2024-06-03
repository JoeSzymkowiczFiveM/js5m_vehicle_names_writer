fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'client/main.lua',
    'vehicle_names.lua'
}

server_scripts {
	'server/main.lua'
}