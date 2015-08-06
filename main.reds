Red/System []

#switch OS [
	Windows  [#define sdl-lib "C:\Users\Ariel\Desktop\RED\SDL2.dll" #define calling cdecl]
] 


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
	a [integer!] 
	b [integer!]
	g [integer!]
	r [integer!]
]

sdl-palette!: alias struct! [
	colors 		[sdl-color!]
	ncolors 	[integer!]
	refcount 	[integer!]
	version 	[integer!]
]

sdl-pixel-format!: alias struct! [
	a-loss 			[integer!]
	a-mask 			[integer!]
	a-shift 		[integer!]
	bits-per-pixel 	[integer!]
	bloss 			[integer!]
	b-mask 			[integer!]
	b-shift 		[integer!]
	bytes-per-pixel [integer!]
	format 			[integer!]
	gloss 			[integer!]
	g-mask 			[integer!]
	g-shift 		[integer!]
	next 			[sdl-pixel-format!]
	padding 		[integer!]
	pallet 		    [sdl-palette!]
	ref-count 		[integer!]
	r-loss 			[integer!]
	r-mask 			[integer!]
	r-shift 		[sdl-pixel-format!]
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
	clip-rect 	[sdl-rect!]
 	flags 		[integer!]
 	format 		[sdl-pixel-format!]
 	h 			[integer!]
 	lock-data 	[byte-ptr!]
 	locked 		[integer!]
 	map 		[sdl-blit-map!]
 	pitch 		[integer!]
 	pixels 		[byte-ptr!]
 	ref-count 	[integer!]
 	user-data 	[byte-ptr!]
 	w 			[integer!]
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
	]
]

SCREEN_WIDTH: 640
SCREEN_HEIGHT: 480



window: declare sdl-window!
screen-surface: declare sdl-surface!

either (sdl-init SDL_INIT_VIDEO) < 0 [
	print "sdl could not be initialized!"	
] [
	window: sdl-create-window "HI THERE I WINZ" 100 100 1000 1000 SDL_WINDOW_SHOWN
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
	]
]








