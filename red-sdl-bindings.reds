Red/System []

#switch OS [
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


;sdl key bindings
#define SDLK_UNKNOWN            00000000h                                                                    
#define SDLK_BACKSPACE          00000008h                                                            
#define SDLK_TAB                00000009h                                                                                    
#define SDLK_RETURN             0000000Dh                                                                        
#define SDLK_ESCAPE             0000001Bh                                                                        
#define SDLK_SPACE              00000020h                                                                            
#define SDLK_EXCLAIM            00000021h                                                                    
#define SDLK_QUOTEDBL           00000022h                                                                
#define SDLK_HASH               00000023h                                                                                
#define SDLK_DOLLAR             00000024h                                                                        
#define SDLK_PERCENT            00000025h                                                                    
#define SDLK_AMPERSAND          00000026h                                                            
#define SDLK_QUOTE              00000027h                                                                            
#define SDLK_LEFTPAREN          00000028h                                                            
#define SDLK_RIGHTPAREN         00000029h                                                        
#define SDLK_ASTERISK           0000002Ah                                                                
#define SDLK_PLUS               0000002Bh                                                                                
#define SDLK_COMMA              0000002Ch                                                                            
#define SDLK_MINUS              0000002Dh                                                                            
#define SDLK_PERIOD             0000002Eh                                                                        
#define SDLK_SLASH              0000002Fh                                                                            
#define SDLK_0                  00000030h                                                                        
#define SDLK_1                  00000031h                                                                        
#define SDLK_2                  00000032h                                                                        
#define SDLK_3                  00000033h                                                                        
#define SDLK_4                  00000034h                                                                        
#define SDLK_5                  00000035h                                                                        
#define SDLK_6                  00000036h                                                                        
#define SDLK_7                  00000037h                                                                        
#define SDLK_8                  00000038h                                                                        
#define SDLK_9                  00000039h                                                                        
#define SDLK_COLON              0000003Ah                                                                            
#define SDLK_SEMICOLON          0000003Bh                                                            
#define SDLK_LESS               0000003Ch                                                                                
#define SDLK_EQUALS             0000003Dh                                                                        
#define SDLK_GREATER            0000003Eh                                                                    
#define SDLK_QUESTION           0000003Fh                                                                
#define SDLK_AT                 00000040h                                                                                        
#define SDLK_LEFTBRACKET        0000005Bh                                                    
#define SDLK_BACKSLASH          0000005Ch                                                            
#define SDLK_RIGHTBRACKET       0000005Dh                                                
#define SDLK_CARET              0000005Eh                                                                            
#define SDLK_UNDERSCORE         0000005Fh                                                        
#define SDLK_BACKQUOTE          00000060h                                                            
#define SDLK_a                  00000061h                                                                                            
#define SDLK_b                  00000062h                                                                                            
#define SDLK_c                  00000063h                                                                                            
#define SDLK_d                  00000064h                                                                                            
#define SDLK_e                  00000065h                                                                                            
#define SDLK_f                  00000066h                                                                                            
#define SDLK_g                  00000067h                                                                                            
#define SDLK_h                  00000068h                                                                                            
#define SDLK_i                  00000069h                                                                                            
#define SDLK_j                  0000006Ah                                                                                            
#define SDLK_k                  0000006Bh                                                                                            
#define SDLK_l                  0000006Ch                                                                                            
#define SDLK_m                  0000006Dh                                                                                            
#define SDLK_n                  0000006Eh                                                                                            
#define SDLK_o                  0000006Fh                                                                                            
#define SDLK_p                  00000070h                                                                                            
#define SDLK_q                  00000071h                                                                                            
#define SDLK_r                  00000072h                                                                                            
#define SDLK_s                  00000073h                                                                                            
#define SDLK_t                  00000074h                                                                                            
#define SDLK_u                  00000075h                                                                                            
#define SDLK_v                  00000076h                                                                                            
#define SDLK_w                  00000077h                                                                                            
#define SDLK_x                  00000078h                                                                                            
#define SDLK_y                  00000079h                                                                                            
#define SDLK_z                  0000007Ah                                                                                            
#define SDLK_DELETE             0000007Fh                                                                        
#define SDLK_CAPSLOCK           40000039h                                        
#define SDLK_F1                 4000003Ah                                                                
#define SDLK_F2                 4000003Bh                                                                
#define SDLK_F3                 4000003Ch                                                                
#define SDLK_F4                 4000003Dh                                                                
#define SDLK_F5                 4000003Eh                                                                
#define SDLK_F6                 4000003Fh                                                                
#define SDLK_F7                 40000040h                                                                
#define SDLK_F8                 40000041h                                                                
#define SDLK_F9                 40000042h                                                                
#define SDLK_F10                40000043h                                                            
#define SDLK_F11                40000044h                                                            
#define SDLK_F12                40000045h                                                            
#define SDLK_PRINTSCREEN        40000046h                            
#define SDLK_SCROLLLOCK         40000047h                                
#define SDLK_PAUSE              40000048h                                                    
#define SDLK_INSERT             40000049h                                                
#define SDLK_HOME               4000004Ah                                                        
#define SDLK_PAGEUP             4000004Bh                                                
#define SDLK_END                4000004Dh                                                            
#define SDLK_PAGEDOWN           4000004Eh                                        
#define SDLK_RIGHT              4000004Fh                                                    
#define SDLK_LEFT               40000050h                                                        
#define SDLK_DOWN               40000051h                                                        
#define SDLK_UP                 40000052h                                                                
#define SDLK_NUMLOCKCLEAR       40000053h                        
#define SDLK_KP_DIVIDE          40000054h                                    
#define SDLK_KP_MULTIPLY        40000055h                            
#define SDLK_KP_MINUS           40000056h                                        
#define SDLK_KP_PLUS            40000057h                                            
#define SDLK_KP_ENTER           40000058h                                        
#define SDLK_KP_1               40000059h                                                        
#define SDLK_KP_2               4000005Ah                                                        
#define SDLK_KP_3               4000005Bh                                                        
#define SDLK_KP_4               4000005Ch                                                        
#define SDLK_KP_5               4000005Dh                                                        
#define SDLK_KP_6               4000005Eh                                                        
#define SDLK_KP_7               4000005Fh                                                        
#define SDLK_KP_8               40000060h                                                        
#define SDLK_KP_9               40000061h                                                        
#define SDLK_KP_0               40000062h                                                        
#define SDLK_KP_PERIOD          40000063h                                    
#define SDLK_APPLICATION        40000065h                            
#define SDLK_POWER              40000066h                                                    
#define SDLK_KP_EQUALS          40000067h                                    
#define SDLK_F13                40000068h                                                            
#define SDLK_F14                40000069h                                                            
#define SDLK_F15                4000006Ah                                                            
#define SDLK_F16                4000006Bh                                                            
#define SDLK_F17                4000006Ch                                                            
#define SDLK_F18                4000006Dh                                                            
#define SDLK_F19                4000006Eh                                                            
#define SDLK_F20                4000006Fh                                                            
#define SDLK_F21                40000070h                                                            
#define SDLK_F22                40000071h                                                            
#define SDLK_F23                40000072h                                                            
#define SDLK_F24                40000073h                                                            
#define SDLK_EXECUTE            40000074h                                            
#define SDLK_HELP               40000075h                                                        
#define SDLK_MENU               40000076h                                                        
#define SDLK_SELECT             40000077h                                                
#define SDLK_STOP               40000078h                                                        
#define SDLK_AGAIN              40000079h                                                    
#define SDLK_UNDO               4000007Ah                                                        
#define SDLK_CUT                4000007Bh                                                            
#define SDLK_COPY               4000007Ch                                                        
#define SDLK_PASTE              4000007Dh                                                    
#define SDLK_FIND               4000007Eh                                                        
#define SDLK_MUTE               4000007Fh                                                        
#define SDLK_VOLUMEUP           40000080h                                        
#define SDLK_VOLUMEDOWN         40000081h                                
#define SDLK_KP_COMMA           40000085h                                        
#define SDLK_KP_EQUALSAS400     40000086h                
#define SDLK_ALTERASE           40000099h                                        
#define SDLK_SYSREQ             4000009Ah                                                
#define SDLK_CANCEL             4000009Bh                                                
#define SDLK_CLEAR              4000009Ch                                                    
#define SDLK_PRIOR              4000009Dh                                                    
#define SDLK_RETURN2            4000009Eh                                            
#define SDLK_SEPARATOR          4000009Fh                                    
#define SDLK_OUT                400000A0h                                                            
#define SDLK_OPER               400000A1h                                                        
#define SDLK_CLEARAGAIN         400000A2h                                
#define SDLK_CRSEL              400000A3h                                                    
#define SDLK_EXSEL              400000A4h                                                    
#define SDLK_KP_00              400000B0h                                                    
#define SDLK_KP_000             400000B1h                                                
#define SDLK_THOUSANDSSEPARATOR 400000B2h
#define SDLK_DECIMALSEPARATOR   400000B3h        
#define SDLK_CURRENCYUNIT       400000B4h                        
#define SDLK_CURRENCYSUBUNIT    400000B5h            
#define SDLK_KP_LEFTPAREN       400000B6h                        
#define SDLK_KP_RIGHTPAREN      400000B7h                    
#define SDLK_KP_LEFTBRACE       400000B8h                        
#define SDLK_KP_RIGHTBRACE      400000B9h                    
#define SDLK_KP_TAB             400000BAh                                                
#define SDLK_KP_BACKSPACE       400000BBh                        
#define SDLK_KP_A               400000BCh                                                        
#define SDLK_KP_B               400000BDh                                                        
#define SDLK_KP_C               400000BEh                                                        
#define SDLK_KP_D               400000BFh                                                        
#define SDLK_KP_E               400000C0h                                                        
#define SDLK_KP_F               400000C1h                                                        
#define SDLK_KP_XOR             400000C2h                                                
#define SDLK_KP_POWER           400000C3h                                        
#define SDLK_KP_PERCENT         400000C4h                                
#define SDLK_KP_LESS            400000C5h                                            
#define SDLK_KP_GREATER         400000C6h                                
#define SDLK_KP_AMPERSAND       400000C7h                        
#define SDLK_KP_DBLAMPERSAND    400000C8h            
#define SDLK_KP_VERTICALBAR     400000C9h                
#define SDLK_KP_DBLVERTICALBAR  400000CAh    
#define SDLK_KP_COLON           400000CBh                                        
#define SDLK_KP_HASH            400000CCh                                            
#define SDLK_KP_SPACE           400000CDh                                        
#define SDLK_KP_AT              400000CEh                                                    
#define SDLK_KP_EXCLAM          400000CFh                                    
#define SDLK_KP_MEMSTORE        400000D0h                            
#define SDLK_KP_MEMRECALL       400000D1h                        
#define SDLK_KP_MEMCLEAR        400000D2h                            
#define SDLK_KP_MEMADD          400000D3h                                    
#define SDLK_KP_MEMSUBTRACT     400000D4h                
#define SDLK_KP_MEMMULTIPLY     400000D5h                
#define SDLK_KP_MEMDIVIDE       400000D6h                        
#define SDLK_KP_PLUSMINUS       400000D7h                        
#define SDLK_KP_CLEAR           400000D8h                                        
#define SDLK_KP_CLEARENTRY      400000D9h                    
#define SDLK_KP_BINARY          400000DAh                                    
#define SDLK_KP_OCTAL           400000DBh                                        
#define SDLK_KP_DECIMAL         400000DCh                                
#define SDLK_KP_HEXADECIMAL     400000DDh                
#define SDLK_LCTRL              400000E0h                                                    
#define SDLK_LSHIFT             400000E1h                                                
#define SDLK_LALT               400000E2h                                                        
#define SDLK_LGUI               400000E3h                                                        
#define SDLK_RCTRL              400000E4h                                                    
#define SDLK_RSHIFT             400000E5h                                                
#define SDLK_RALT               400000E6h                                                        
#define SDLK_RGUI               400000E7h                                                        
#define SDLK_MODE               40000101h                                                        
#define SDLK_AUDIONEXT          40000102h                                    
#define SDLK_AUDIOPREV          40000103h                                    
#define SDLK_AUDIOSTOP          40000104h                                    
#define SDLK_AUDIOPLAY          40000105h                                    
#define SDLK_AUDIOMUTE          40000106h                                    
#define SDLK_MEDIASELECT        40000107h                            
#define SDLK_WWW                40000108h                                                            
#define SDLK_MAIL               40000109h                                                        
#define SDLK_CALCULATOR         4000010Ah                                
#define SDLK_COMPUTER           4000010Bh                                        
#define SDLK_AC_SEARCH          4000010Ch                                    
#define SDLK_AC_HOME            4000010Dh                                            
#define SDLK_AC_BACK            4000010Eh                                            
#define SDLK_AC_FORWARD         4000010Fh                                
#define SDLK_AC_STOP            40000110h                                            
#define SDLK_AC_REFRESH         40000111h                                
#define SDLK_AC_BOOKMARKS       40000112h                        
#define SDLK_BRIGHTNESSDOWN     40000113h                
#define SDLK_BRIGHTNESSUP       40000114h                        
#define SDLK_DISPLAYSWITCH      40000115h                    
#define SDLK_KBDILLUMTOGGLE     40000116h                
#define SDLK_KBDILLUMDOWN       40000117h                        
#define SDLK_KBDILLUMUP         40000118h                                
#define SDLK_EJECT              40000119h                                                    
#define SDLK_SLEEP              4000011Ah                                                    
 
; sdl macros
#define sdl-load-bmp (file) [sdl-load-bmp-rw sdl-rw-from-file file "rb" 1] 
#define sdl-blit-surface (src srcrect dst dstrec) [sdl-upper-blit src srcrect dst dstrec]


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
								
;-- The definition of this sdl-event! is a union, so all the sub-structs are overlapping in memory. 
;-- Only `type` field is common to all. That said, as you reserve the memory storage for this union, 
;-- we need to get its size right. In this case, the full size of the union is given explicitly by 
;-- the last field.
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




