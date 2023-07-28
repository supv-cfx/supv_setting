fx_version 'cerulean'
games {'gta5', 'rdr3'} -- not tested on rdr3

lua54 'yes'
use_experimental_fxv2_oal 'yes'

version '0.0.0'

author 'SUP2Ak#3755'
link 'https://github.com/SUP2Ak/supv_setting'
github 'https://github.com/SUP2Ak'

shared_script '@supv_core/obj.lua'

files {
    'modules/client/*.lua',
    'data/client.json',
    'data/client/*.json',
}

shared_scripts {
    'config.lua',
    'moduleHandlers.lua'
}

server_script 'version.lua'