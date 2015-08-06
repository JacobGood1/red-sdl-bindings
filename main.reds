Red/System []

#switch OS [
	Windows  [#define sdl-lib "C:\Users\Ariel\Desktop\RED\SDL2.dll" #define calling cdecl]
] 

;elimate cyclic deps notes
{
	#define b-struct!  [struct! [b [hi!]]]

	hi!: alias struct! [
    	a [b-struct!]
	]

	hey!: alias b-struct!
}


#define SDL_INIT_VIDEO   00000020h
#define SDL_WINDOW_SHOWN 00000004h

#enum sdl-bool! [
	SDL_TRUE: 0
	SDL_FALSE: 1
]

#enum window-shape-mode! [
	shape-mode-default
	shape-mode-binarize-alpha
	shape-mode-reverse-binarize-alpha
	shape-mode-color-key
] 

sdl-rect!: alias struct! [
 	h 	[integer!]
 	w 	[integer!]
 	x 	[integer!]
	y 	[integer!]
]

sdl-color!: alias struct! [
	r [byte!]
	g [byte!]
	b [byte!]
	a [byte!] 
]

sdl-palette!: alias struct! [
	colors 		[sdl-color!]
	version 	[integer!]
	refcount 	[integer!]
]

sdl-pixel-format!: alias struct! [
	a-loss 			[byte!]
	a-mask 			[integer!]
	a-shift 		[byte!]
	bits-per-pixel 	[byte!]
	b-loss 			[byte!]
	b-mask 			[integer!]
	b-shift 		[byte!]
	bytes-per-pixel [byte!]
	format 			[integer!]
	g-loss 			[byte!]
	g-mask 			[integer!]
	g-shift 		[byte!]
	next 			[sdl-pixel-format!]
	padding 		[byte!]
	pallet 		    [sdl-palette!]
	ref-count 		[integer!]
	r-loss 			[byte!]
	r-mask 			[integer!]
	r-shift 		[byte!]
]

sdl-blit-info!: alias struct! [
	a 	    	[integer!]
	b			[integer!]
	color-key	[int-ptr!]
	dst			[sdl-pixel-format!]
	dst-fmt		[integer!]
	dst-h		[integer!]
	dst-pitch	[integer!]
	dst-skip	[integer!]
	dst-w		[integer!]
	flags		[integer!]
	g			[integer!]
	r			[int-ptr!]
	src			[integer!]
	src-fmt		[sdl-pixel-format!]
	src-h		[integer!]
	src-pitch	[integer!]
	src-skip	[integer!]
	src-w		[int-ptr!]
	table		[integer!]
]

sdl-window-shape-parems!: alias struct! [
	binarization-cut-off [integer!]
	color-key            [sdl-color!]
]


sdl-window-shape-mode!: alias struct! [
	mode       [window-shape-mode!]
	parameters [sdl-window-shape-parems!]	
]

sdl-window-shaper!: alias struct! [
	driverdata 	  [byte-ptr!]
 	has-shape?    [sdl-bool!]
 	mode 	      [sdl-window-shape-mode!]
 	userx 	      [integer!]
 	usery 	      [integer!]
 	window 	      [byte-ptr!] ;sdl-window!
]

sdl-blit-map!: alias struct! [
	blit 	                  [byte-ptr!] ;sdl-blit!
	data 	                  [byte-ptr!]
	dst 	                  [byte-ptr!] ;sdl-surface!
	dst-palette-version 	  [integer!]
	identity 				  [integer!]  
	info 					  [sdl-blit-info!]
	src-palette-version 	  [integer!] 
]

sdl-surface!: alias struct! [
 	flags 		[integer!]
 	format 		[sdl-pixel-format!]
 	w 			[integer!]
 	h 			[integer!]
 	pitch 		[integer!]
 	pixels 		[byte-ptr!]
 	user-data 	[byte-ptr!]
 	locked 		[integer!]
 	lock-data 	[byte-ptr!]
	clip-rect 	[sdl-rect!]
 	map 		[sdl-blit-map!]
 	ref-count 	[integer!]
]

sdl-blit!: alias function! [
	src       [sdl-surface!]
	src-rect  [sdl-rect!]
	dst       [sdl-surface!]
	dst-rect  [sdl-rect!]
]

sdl-window-user-data!: alias struct! [
 	data 	[byte-ptr!] 
	name 	[c-string!]
	next 	[sdl-window-user-data!] 
]

sdl-display-mode!: alias struct! [
	driver-data  [byte-ptr!]	 
	format 		 [integer!]
	h 			 [integer!]
	refresh-rate [integer!]
	w 			 [integer!] 
]

sdl-window!: alias struct! [
	brightness 		[float!]
	data 			[sdl-window-user-data!]
	driver-data 	[byte-ptr!]
 	flags 			[integer!]
	fullscreen-mode [sdl-display-mode!]
	gamma 			[int-ptr!]
	h 				[integer!]
	icon 	        [sdl-surface!]
	id 				[integer!]
	magic 			[byte-ptr!]
	max-h 			[integer!]
	max-w 			[integer!] 
	min-h 			[integer!]
	min-w 			[integer!]
	prev 			[sdl-window!]
	next 			[sdl-window!]
	saved-gamma  	[int-ptr!]
	shaper 	        [sdl-window-shaper!]
	surface 		[sdl-surface!]
	surface-valid   [sdl-bool!]
	title 			[c-string!]
	w 				[integer!]
	windowed 		[sdl-rect!]
	x 				[integer!]
	y 				[integer!]
] 

#import [ 
	sdl-lib calling [
		sdl-init: "SDL_Init" [
			flags   [integer!]
			return: [integer!]
		]
		sdl-create-window: "SDL_CreateWindow" [
			title   [c-string!]
			x       [integer!]
			y       [integer!]
			w       [integer!]
			h       [integer!]
			flags   [integer!]
			return: [sdl-window!]
		]
		sdl-delay: "SDL_Delay"[
			ms [integer!]
		]
		sdl-get-window-surface: "SDL_GetWindowSurface"[
			window  [sdl-window!]
			return: [sdl-surface!]
		]
		sdl-get-error: "SDL_GetError" [
			return: [c-string!]
		]
		sdl-fill-rect: "SDL_FillRect" [
			dst   [sdl-surface!]
			rect  [sdl-rect!]
			color [integer!]
		]
		sdl-map-rgb: "SDL_MapRGB" [
			format  [sdl-pixel-format!]
			r 		[integer!]
			g 		[integer!]
			b 		[integer!]
			return: [integer!]
		]
		sdl-update-window-surface: "SDL_UpdateWindowSurface" [
			window [sdl-window!]
			return: [integer!]
		]
		sdl-destroy-window: "SDL_DestroyWindow" [
			window [sdl-window!]
		]
		sdl-quit: "SDL_Quit" []
	]
]

SCREEN_WIDTH: 640
SCREEN_HEIGHT: 480



window: declare sdl-window!
screen-surface: declare sdl-surface!

either (sdl-init SDL_INIT_VIDEO) < 0 [
	print "sdl could not be initialized!"	
] [
	window: sdl-create-window "Title of window" 100 100 1000 1000 SDL_WINDOW_SHOWN
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








