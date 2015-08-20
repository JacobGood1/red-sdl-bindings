;;NOT WORKING ATM

window: declare sdl-window!
screen-surface: declare sdl-surface!
stretched-surface: declare sdl-surface!

init: func [return: [logic!] /local success] [
	success: true

	either (sdl-init SDL_INIT_VIDEO) < 0 [
		probe ["sdl could not be initialized" sdl-get-error]
		success: false
	] [
		;create window
		window: sdl-create-window "sdl tutorial" SDL_WINDOWPOS_UNDEFINED SDL_WINDOWPOS_UNDEFINED 640 480 SDL_WINDOW_SHOWN
		either window = null [
			probe ["window could not be created " sdl-get-error]
			success: false
		] [
			;get window surface
			screen-surface: sdl-get-window-surface window
		]
	]
	success
]

load-surface: func [path [c-string!] return: [sdl-surface!] /local optimized-surface loaded-surface] [
	loaded-surface: sdl-load-bmp(path)
	either loaded-surface = null [
		probe ["unable to load image!" sdl-get-error]
	] [
		optimized-surface: sdl-convert-surface loaded-surface screen-surface/format null
	]

	sdl-free-surface loaded-surface
	
	optimized-surface
]

load-media: func [return: [logic!] /local success] [
	;Loading success flag
	success: true

	;Load stretching surface
	stretched-surface: load-surface "lazy_foo_examples\assets\stretch.bmp"
	if stretched-surface = null [
		probe ["failed to load surface" sdl-get-error]
		success: false
	]

	success
]

close: func [] [
	; free loaded image
	sdl-free-surface stretched-surface

	; destroy window
	sdl-destroy-window window

]


main: func [/local e stretch-rect] [
	
	unless init [print ["failed to init!" lf] halt]
	unless load-media [print ["media failed!" lf] halt]

	e: declare sdl-event!

	forever [
		; handle the events on the que
		while [(sdl-poll-event e) <> 0] [
			switch e/type [
				SDL_QUIT [
					close 
					quit 0
				]
				default [0]
			]
		]

		stretch-rect: declare sdl-rect!
		stretch-rect/x: 0 ;figure this crap out black screen is bs!
		stretch-rect/y: 0
		stretch-rect/w: 30
		stretch-rect/h: 40

		sdl-blit-scaled stretched-surface null screen-surface stretch-rect

		sdl-update-window-surface window
	]
]

main