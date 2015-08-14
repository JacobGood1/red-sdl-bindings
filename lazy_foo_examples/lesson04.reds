Red/System []

#include %../red-sdl-bindings.reds

window: declare sdl-window!
screen-surface: declare sdl-surface!
current-surface: declare sdl-surface!

load-surface: func [path [c-string!] return: [sdl-surface!]] [
	loaded-surface: sdl-load-bmp(path)
	if loaded-surface = null [
		print "unable to load image!"
	]
	loaded-surface
]

init: func [return: [logic!] /local success] [
	success: true

	either (sdl-init SDL_INIT_VIDEO) < 0 [
		print "sdl could not be initialised!"
		success: false
	] [
		;create window
		window: sdl-create-window "sdl tut" SDL_WINDOWPOS_UNDEFINED SDL_WINDOWPOS_UNDEFINED 640 480 SDL_WINDOW_SHOWN
		either window = null [
			print ["window could not be created! sdl-error: " sdl-get-error]
			success: false 
		] [
			;get window surface
			screen-surface: sdl-get-window-surface window
		]
	]

	success
]


;load the assets
KEY_PRESS_SURFACE_DEFAULT:  load-surface "assets\press.bmp"  
KEY_PRESS_SURFACE_UP: 		load-surface "assets\up.bmp"
KEY_PRESS_SURFACE_DOWN:		load-surface "assets\down.bmp"
KEY_PRESS_SURFACE_LEFT: 	load-surface "assets\left.bmp"
KEY_PRESS_SURFACE_RIGHT:	load-surface "assets\right.bmp"

load-media-test: func [return: [logic!] /local success] [
	success: true

    case [
    	null? KEY_PRESS_SURFACE_DEFAULT [print "failed to load default image!" success: false] 
    	null? KEY_PRESS_SURFACE_UP      [print "failed to load up image!" success: false]
    	null? KEY_PRESS_SURFACE_DOWN    [print "failed to load down image!" success: false]
    	null? KEY_PRESS_SURFACE_RIGHT   [print "failed to load right image!" success: false]
    	null? KEY_PRESS_SURFACE_LEFT    [print "failed to load left image!" success: false]
    	true                            [print "success"]
    ]

	success
]

close: func [] [
	; free all resources, no need to make them null as in the tutorial
	sdl-free-surface KEY_PRESS_SURFACE_DEFAULT
	sdl-free-surface KEY_PRESS_SURFACE_UP
	sdl-free-surface KEY_PRESS_SURFACE_DOWN
	sdl-free-surface KEY_PRESS_SURFACE_LEFT
	sdl-free-surface KEY_PRESS_SURFACE_RIGHT

	;destroy window
	sdl-destroy-window window

	;quit sdl subsystems
	sdl-quit
]

main: func [
	/local quit-loop event current-surface symbol keyboard
][
	quit-loop: false
	event: declare sdl-event!

	current-surface: KEY_PRESS_SURFACE_DEFAULT
	
	unless init [print ["failed to init!" lf] halt]
	unless load-media-test [print ["media failed!" lf] halt]
	
	forever [
		while [(sdl-poll-event event) <> 0] [
			;-- uncomment the following line to examine the memory content of event
			;-- (just ensure that you compile in debug mode using the -d command-line option)
			;dump-hex4 as int-ptr! event\
				
			switch event/type [
				SDL_QUIT [
					close
					quit 0
				]
				SDL_KEYDOWN [
					keyboard: as sdl-keyboard-event! event
					switch as-byte keyboard/sym [
						SDLK_a [
							current-surface: KEY_PRESS_SURFACE_LEFT
						]
						SDLK_w [
							current-surface: KEY_PRESS_SURFACE_UP
						]
						SDLK_s [
							current-surface: KEY_PRESS_SURFACE_DOWN
						]
						SDLK_d [
							current-surface: KEY_PRESS_SURFACE_RIGHT
						]
						default [current-surface: KEY_PRESS_SURFACE_DEFAULT]
					]
				]
				default [0]
			]
		]
		sdl-blit-surface(current-surface null screen-surface null)
		sdl-update-window-surface window
	]
]

main