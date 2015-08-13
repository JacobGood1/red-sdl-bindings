Red/System []

#switch OS [
	;-- just put the SDL2.dll into the same folder as you final binary and
	;-- you can then omit the absolute path prefix.
	Windows  [#define sdl-lib "SDL2.dll" #define calling cdecl]
] 

#define SDL_INIT_VIDEO          00000020h
#define SDL_WINDOW_SHOWN        00000004h
#define SDL_WINDOWPOS_UNDEFINED 1FFF0000h

;#define enum! integer! ;might remove this

;sdl events
#define SDL_FIRSTEVENT 0
#define SDL_RELEASED 0
#define SDL_PRESSED 1

#define SDL_QUIT                     00000100h
#define SDL_APP_TERMINATING          00000101h
#define SDL_APP_LOWMEMORY            00000102h
#define SDL_APP_WILLENTERBACKGROUND  00000103h
#define SDL_APP_DIDENTERBACKGROUND   00000104h
#define SDL_APP_WILLENTERFOREGROUND  00000105h
#define SDL_APP_DIDENTERFOREGROUND   00000106h
#define SDL_WINDOWEVENT              00000200h
#define SDL_SYSWMEVENT 				 00000201h
#define SDL_KEYDOWN 				 00000300h
#define SDL_KEYUP 				     00000301h
#define SDL_TEXTEDITING 			 00000302h
#define SDL_TEXTINPUT 			     00000303h
#define SDL_MOUSEMOTION 			 00000400h
#define SDL_MOUSEBUTTONDOWN 		 00000401h
#define SDL_MOUSEBUTTONUP 			 00000402h
#define SDL_MOUSEWHEEL 			     00000403h
#define SDL_JOYAXISMOTION 			 00000600h
#define SDL_JOYBALLMOTION 			 00000601h
#define SDL_JOYHATMOTION 			 00000602h
#define SDL_JOYBUTTONDOWN 			 00000603h
#define SDL_JOYBUTTONUP 			 00000604h
#define SDL_JOYDEVICEADDED 			 00000605h
#define SDL_JOYDEVICEREMOVED 		 00000606h
#define SDL_CONTROLLERAXISMOTION 	 00000650h
#define SDL_CONTROLLERBUTTONDOWN 	 00000651h
#define SDL_CONTROLLERBUTTONUP 		 00000652h
#define SDL_CONTROLLERDEVICEADDED    00000653h
#define SDL_CONTROLLERDEVICEREMOVED  00000654h
#define SDL_CONTROLLERDEVICEREMAPPED 00000655h
#define SDL_FINGERDOWN 				 00000700h
#define SDL_FINGERUP 				 00000701h
#define SDL_FINGERMOTION 			 00000702h
#define SDL_DOLLARGESTURE 			 00000800h
#define SDL_DOLLARRECORD 			 00000801h
#define SDL_MULTIGESTURE 			 00000802h
#define SDL_CLIPBOARDUPDATE 		 00000900h
#define SDL_DROPFILE 				 00001000h
#define SDL_AUDIODEVICEADDED 		 00001100h
#define SDL_AUDIODEVICEREMOVED 		 00001101h
#define SDL_RENDER_TARGETS_RESET 	 00002000h
#define SDL_RENDER_DEVICE_RESET 	 00002001h
#define SDL_USEREVENT 				 00008000h
#define SDL_LASTEVENT 				 0000FFFFh
 
; sdl macros
#define sdl-load-bmp (file) [sdl-load-bmp-rw sdl-rw-from-file file "rb" 1] 
#define sdl-blit-surface (src srcrect dst dstrec) [sdl-upper-blit src srcrect dst dstrec]

;-- already defined in https://github.com/red/red/blob/master/system/runtime/common.reds
;helper fn
;#define null? [null =]

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

sdl-keyboard-event!: alias struct! [
	type       [integer!]       
	time-stamp [integer!]
	window-id  [integer!]
	state      [byte!]
	repeat     [byte!]
	padding2   [byte!]
	padding3   [byte!]
	scan-code  [integer!]
	sym        [integer!]
	mod-low    [byte!]
	mod-high   [byte!]			;-- these 2 bytes are causing an unalignment which
	unused     [integer!]		;-- will force the R/S compiler to insert extra bytes
]								;-- before `unused`, so that field will map to the wrong location.
								;-- (fortunately, it's unused. ;-))
								
;-- The definition of this sdl-event! is wrong, it's a union, not a struct in C code,
;-- so all the sub-structs are overlapping in memory. Only `type` field is common to all.
;-- That said, as you reserve the memory storage for this union, we need to get its size
;-- right. In this case, the full size of the union is given explicitly by the last field.
;
;		typedef union SDL_Event
;		{
;		    Uint32 type;                    /**< Event type, shared with all events */
;			...
;			Uint8 padding[56];
;		}

sdl-event!: alias struct! [
	type      [integer!]		;-- 4 bytes
	pad1	  [integer!]		;-- 4 bytes
	pad2	  [float!]			;-- 8 bytes
	pad3	  [float!]			;-- 8 bytes
	pad4	  [float!]			;-- 8 bytes
	pad5	  [float!]			;-- 8 bytes
	pad6	  [float!]			;-- 8 bytes
	pad7	  [float!]			;-- 8 bytes
								;-- total: 56 bytes, we're good to go!
	;common    [byte-ptr!]
	;window    [byte-ptr!]
	;key       [sdl-keyboard-event!]
	;edit      [byte-ptr!]
	;text      [byte-ptr!]
	;motion    [byte-ptr!]
	;button    [byte-ptr!]
	;wheel     [byte-ptr!]
	;j-axis    [byte-ptr!]
	;jball     [byte-ptr!]
	;j-hat     [byte-ptr!]
	;j-button  [byte-ptr!] 
	;j-device  [byte-ptr!] 
	;c-axis    [byte-ptr!]
	;c-button  [byte-ptr!] 
	;c-device  [byte-ptr!] 
	;a-device  [byte-ptr!] 
	;quit      [byte-ptr!]
	;user      [byte-ptr!]
	;sys-wm    [byte-ptr!]
	;t-finger  [byte-ptr!]
	;m-gesture [byte-ptr!] 
	;d-gesture [byte-ptr!] 
	;drop      [byte-ptr!]
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
			window  [sdl-window!]
			return: [integer!]
		]
		sdl-destroy-window: "SDL_DestroyWindow" [
			window [sdl-window!]
		]
		sdl-quit: "SDL_Quit" []
		sdl-load-bmp-rw: "SDL_LoadBMP_RW" [
			src      [byte-ptr!] ;sdl-rwops which is a struct
			free-src [integer!]
			return:  [sdl-surface!]
		]
		sdl-free-surface: "SDL_FreeSurface" [
			surface [sdl-surface!]
		]
		sdl-upper-blit: "SDL_UpperBlit" [ ;do not call this directly call sdl-blit-surface
			src 	 [sdl-surface!]
			src-rect [sdl-rect!]
			dst 	 [sdl-surface!]
			dst-rect [sdl-rect!]
			return:  [integer!]
		]
		sdl-rw-from-file: "SDL_RWFromFile" [
			file    [c-string!]
			mods    [c-string!]
			return: [byte-ptr!] ;sdl-r-wops
		]
		sdl-poll-event: "SDL_PollEvent" [
			event [sdl-event!]
			return: [integer!]
		]

	]
]


;testing area




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
KEY_PRESS_SURFACE_DEFAULT:  load-surface "lazy_foo_examples\assets\press.bmp"  
KEY_PRESS_SURFACE_UP: 		load-surface "lazy_foo_examples\assets\up.bmp"
KEY_PRESS_SURFACE_DOWN:		load-surface "lazy_foo_examples\assets\down.bmp"
KEY_PRESS_SURFACE_LEFT: 	load-surface "lazy_foo_examples\assets\left.bmp"
KEY_PRESS_SURFACE_RIGHT:	load-surface "lazy_foo_examples\assets\right.bmp"

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
	;-- These lines are just setting pointers to null, they don't free any resource.
	;-- You need to use SDL_FreeSurface on each one for that.
	;deallocate surfaces
	;KEY_PRESS_SURFACE_DEFAULT: null
	;KEY_PRESS_SURFACE_UP: null
	;KEY_PRESS_SURFACE_DOWN: null
	;KEY_PRESS_SURFACE_LEFT: null
	;KEY_PRESS_SURFACE_RIGHT: null
	sdl-free-surface KEY_PRESS_SURFACE_DEFAULT
	sdl-free-surface KEY_PRESS_SURFACE_UP
	sdl-free-surface KEY_PRESS_SURFACE_DOWN
	sdl-free-surface KEY_PRESS_SURFACE_LEFT
	sdl-free-surface KEY_PRESS_SURFACE_RIGHT

	;destroy window
	sdl-destroy-window window
	;window: null					;-- unnecessary

	;quit sdl subsystems
	sdl-quit
]

main: func [
	/local quit-loop event current-surface symbol keyboard
][
	quit-loop: false
	event: declare sdl-event!

	current-surface: KEY_PRESS_SURFACE_DEFAULT
	
	;-- This following line is wrong (not sure why the compiler let it pass)
	;-- `declare` can only be used on struct! and pointer! types.
	;symbol: declare integer!
	symbol: 0

	;-- I've removed the nested EITHER blocks, the new code is flat
	;-- making the reading easier (though, it's mostly a matter of personal taste).
	unless init [print ["failed to init!" lf] halt]
	unless load-media-test [print ["media failed!" lf] halt]
	
	forever [
		while [(sdl-poll-event event) <> 0] [
			;-- uncomment the following line to examine the memory content of event
			;-- (just ensure that you compile in debug mode using the -d command-line option)
			;dump-hex4 as int-ptr! event\
		
			;-- I replaced the CASE by a SWITCH, makes it less verbose.			
			switch event/type [
				SDL_QUIT [
					close
					quit 0
				]
				SDL_KEYDOWN [
					;-- SDL_event struct is a union, so you need to map a different
					;-- struct on it for each event type.
					keyboard: as sdl-keyboard-event! event
					probe ["key pressed: " as-byte keyboard/sym " (" keyboard/sym ")"]
				]
				default [0]
			]
		]
	]
	
	;-- The following code is never reached as the exit point of the program
	;-- is now in SDL_QUIT event handling.
	;probe "never reached!!"
	;close
]

main
