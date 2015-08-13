Red/System []

#include %../red-sdl-bindings.reds

window: declare sdl-window!
screen-surface: declare sdl-surface!
g-x-out: declare sdl-surface!

init: func [return: [logic!]] [
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

load-media: func [return: [logic!]] [
	success: true
	path: "C:\Users\Ariel\Documents\GitHub\red-sdl-bindings\lazy_foo_examples\assets\x.bmp" ;replace this with your own path
	;load splash image
	g-x-out: sdl-load-bmp(path) ; macro call
	if g-x-out = null [
		print ["unable to load image! sdl-error: " sdl-get-error]
		success: false
	]
	success
]

close: func [] [
	;deallocate surface
	sdl-free-surface g-x-out
	g-x-out: null

	;destroy window
	sdl-destroy-window window
	window: null

	;quit sdl subsystems
	sdl-quit
]

main: func [] [
	quit-loop: false
	event: declare sdl-event!

	either not init [
		print "failed to init!"
	] [
		;load media
		either not load-media [
			print "failed to load media"
		] [
			
			while [not quit-loop] [
				while [not (sdl-poll-event event) = 0] [
					if event/type = SDL_QUIT [
						quit-loop: true
					]
					print "events are working!"
				]
				
				;apply the image
				sdl-blit-surface(g-x-out null screen-surface null) ;macro call

				;update the surface 
				sdl-update-window-surface window 
			]

		]
	]

	close
]

main