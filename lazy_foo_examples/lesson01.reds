Red/System []

#include %../red-sdl-bindings.reds

SCREEN-WIDTH: 640
SCREEN-HEIGHT: 480



window: declare sdl-window!
screen-surface: declare sdl-surface!

either (sdl-init SDL-INIT-VIDEO) < 0 [
	print "sdl could not be initialized!"	
] [
	window: sdl-create-window "Title of window" 100 100 SCREEN-WIDTH SCREEN-HEIGHT SDL-WINDOW-SHOWN
	either window = null [
		print ["Window could not be created! sdl-error: " sdl-get-error]
	] [
		;get the window surface
		screen-surface: sdl-get-window-surface window

		;fill the surface white
		sdl-fill-rect screen-surface null sdl-map-rgb screen-surface/format FFh FFh FFh

		;update the surface
		sdl-update-window-surface window
		
		;wait two seconds
		sdl-delay 2000

		sdl-destroy-window window

		sdl-quit
	]
]