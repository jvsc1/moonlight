--[[
'*
'* Copyright (c) Moonlight, LLC. All rights reserved.
'*
'* File Name:      fxmanifest.lua
'*
'* Abstract:       Defines client and server-sided modifications
'*
--]]

IS_DEBUG, IS_DEV, IS_ROOT, IS_ENV = true, true, false, true

fx_version 'cerulean'
games 'common'

author 'Moonlight, LLC'
description 'Moonlight, LLC - Modifications of Grand Theft Auto V'
version '1.0.0'

lua54 'yes'

version_label [[version=1.0.0 || production_tag=MSE-06122021-B0X25KSLC || state=beta]]
authorized [[{"discord": "Rubidium#1864", "email": "egeturkerapple@gmail.com", "authorization_level": 99}]]

project_scripts [['C:\Users\90530\Desktop\mle\kernel\moonlight.vpc']]
misc_scripts [['.clang-format', '.mailmap', '.moonlight-ext.conf', '.pre-commit-config.yaml']]


-- Comment<egeturkerapple@gmail.com>: '*' completes source directories automatically.
-- Comment<egeturkerapple@gmail.com>: 'c' means client-side, 'av' means shared files (average), 's' means server-side.
client_scripts {
	'game_engine/c_*.lua',
	'game_engine/c_*.js',
	'game_engine/c_*.dll',

	'game_engine/**/c_*.lua',
	'game_engine/**/c_*.js',
	'game_engine/**/c_*.dll',

	'game_engine/**/**/c_*.lua',
	'game_engine/**/**/c_*.js',
	'game_engine/**/**/c_*.dll',

	'game_engine/**/**/**/c_*.lua',
	'game_engine/**/**/**/c_*.js',
	'game_engine/**/**/**/c_*.dll',

	'game_engine/**/**/**/**/c_*.lua',
	'game_engine/**/**/**/**/c_*.js',
	'game_engine/**/**/**/**/c_*.dll',

	'game_engine/**/**/**/**/**/c_*.lua',
	'game_engine/**/**/**/**/**/c_*.js',
	'game_engine/**/**/**/**/**/c_*.dll',

	'game_engine/**/**/**/**/**/**/c_*.lua',
	'game_engine/**/**/**/**/**/**/c_*.js',
	'game_engine/**/**/**/**/**/**/c_*.dll',

	'game_engine/**/**/**/**/**/**/**/c_*.lua',
	'game_engine/**/**/**/**/**/**/**/c_*.js',
	'game_engine/**/**/**/**/**/**/**/c_*.dll',
}

shared_scripts {
	'game_engine/av_*.lua',
	'game_engine/av_*.js',
	'game_engine/av_*.dll',

	'game_engine/**/av_*.lua',
	'game_engine/**/av_*.js',
	'game_engine/**/av_*.dll',

	'game_engine/**/**/av_*.lua',
	'game_engine/**/**/av_*.js',
	'game_engine/**/**/av_*.dll',

	'game_engine/**/**/**/av_*.lua',
	'game_engine/**/**/**/av_*.js',
	'game_engine/**/**/**/av_*.dll',

	'game_engine/**/**/**/**/av_*.lua',
	'game_engine/**/**/**/**/av_*.js',
	'game_engine/**/**/**/**/av_*.dll',

	'game_engine/**/**/**/**/**/av_*.lua',
	'game_engine/**/**/**/**/**/av_*.js',
	'game_engine/**/**/**/**/**/av_*.dll',

	'game_engine/**/**/**/**/**/**/av_*.lua',
	'game_engine/**/**/**/**/**/**/av_*.js',
	'game_engine/**/**/**/**/**/**/av_*.dll',

	'game_engine/**/**/**/**/**/**/**/av_*.lua',
	'game_engine/**/**/**/**/**/**/**/av_*.js',
	'game_engine/**/**/**/**/**/**/**/av_*.dll',
}

server_scripts {
	'game_engine/s_*.lua',
	'game_engine/s_*.js',
	'game_engine/s_*.dll',

	'game_engine/**/s_*.lua',
	'game_engine/**/s_*.js',
	'game_engine/**/s_*.dll',

	'game_engine/**/**/s_*.lua',
	'game_engine/**/**/s_*.js',
	'game_engine/**/**/s_*.dll',

	'game_engine/**/**/**/s_*.lua',
	'game_engine/**/**/**/s_*.js',
	'game_engine/**/**/**/s_*.dll',

	'game_engine/**/**/**/**/s_*.lua',
	'game_engine/**/**/**/**/s_*.js',
	'game_engine/**/**/**/**/s_*.dll',

	'game_engine/**/**/**/**/**/s_*.lua',
	'game_engine/**/**/**/**/**/s_*.js',
	'game_engine/**/**/**/**/**/s_*.dll',

	'game_engine/**/**/**/**/**/**/s_*.lua',
	'game_engine/**/**/**/**/**/**/s_*.js',
	'game_engine/**/**/**/**/**/**/s_*.dll',

	'game_engine/**/**/**/**/**/**/**/s_*.lua',
	'game_engine/**/**/**/**/**/**/**/s_*.js',
	'game_engine/**/**/**/**/**/**/**/s_*.dll',

	'game_engine/*.lua',
	'game_engine/*.js',
	'game_engine/*.dll',

	'game_engine/**/*.lua',
	'game_engine/**/*.js',
	'game_engine/**/*.dll',

	'game_engine/**/**/*.lua',
	'game_engine/**/**/*.js',
	'game_engine/**/**/*.dll',

	'game_engine/**/**/**/*.lua',
	'game_engine/**/**/**/*.js',
	'game_engine/**/**/**/*.dll',

	'game_engine/**/**/**/**/*.lua',
	'game_engine/**/**/**/**/*.js',
	'game_engine/**/**/**/**/*.dll',

	'game_engine/**/**/**/**/**/*.lua',
	'game_engine/**/**/**/**/**/*.js',
	'game_engine/**/**/**/**/**/*.dll',

	'game_engine/**/**/**/**/**/**/*.lua',
	'game_engine/**/**/**/**/**/**/*.js',
	'game_engine/**/**/**/**/**/**/*.dll',

	'game_engine/**/**/**/**/**/**/**/*.lua',
	'game_engine/**/**/**/**/**/**/**/*.js',
	'game_engine/**/**/**/**/**/**/**/*.dll',
}
