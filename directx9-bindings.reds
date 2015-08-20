Red/System []
#define directx9-wrapper "C:\Users\Ariel\Documents\Visual Studio 2015\Projects\directx9-wrapper\Debug\directx9-wrapper.dll"
; #define 
#define calling cdecl
 
#define HWND! byte-ptr!
#define DWORD! float!
#define BOOL! integer!

#define D3D_SDK_VERSION   32

#define D3DADAPTER_DEFAULT 0
#define D3DCREATE_SOFTWARE_VERTEXPROCESSING 32.0
#define D3DCREATE_HARDWARE_VERTEXPROCESSING 64.0

#define ZERO-MEMORY(destination length) [mem-set destination 0 length]

#define MAKEFOURCC(ch0 ch1 ch2 ch3)  [                            
    (as-integer ch0)         or 
    ((as-integer ch1) << 8)  or 
    ((as-integer ch1) << 16) or 
    ((as-integer ch3) << 24)
]

;directx enums

#enum D3DDEVTYPE! [
	D3DDEVTYPE_HAL:         1
    D3DDEVTYPE_REF:         2
    D3DDEVTYPE_SW:          3
	D3DDEVTYPE_NULLREF:     4
	D3DDEVTYPE_FORCE_DWORD: 7FFFFFFFh
]

 
#enum D3DFORMAT! [
	D3DFMT_UNKNOWN:             0
	D3DFMT_R8G8B8:              20
    D3DFMT_A8R8G8B8:            21
    D3DFMT_X8R8G8B8:            22
    D3DFMT_R5G6B5:              23
    D3DFMT_X1R5G5B5:            24
    D3DFMT_A1R5G5B5:            25
    D3DFMT_A4R4G4B4:            26
    D3DFMT_R3G3B2:              27
    D3DFMT_A8:                  28
    D3DFMT_A8R3G3B2:            29
    D3DFMT_X4R4G4B4:            30
    D3DFMT_A2B10G10R10:         31
    D3DFMT_A8B8G8R8:            32
    D3DFMT_X8B8G8R8:            33
    D3DFMT_G16R16:              34
    D3DFMT_A2R10G10B10:         35
    D3DFMT_A16B16G16R16:        36
	D3DFMT_A8P8:                40
    D3DFMT_P8:                  41
	D3DFMT_L8:                  50
    D3DFMT_A8L8:                51
    D3DFMT_A4L4:                52
	D3DFMT_V8U8:                60
    D3DFMT_L6V5U5:              61
    D3DFMT_X8L8V8U8:            62
    D3DFMT_Q8W8V8U8:            63
    D3DFMT_V16U16:              64
    D3DFMT_A2W10V10U10:         67

    D3DFMT_UYVY:                1498831189

    D3DFMT_R8G8_B8G8:           1195525970
    D3DFMT_YUY2:                844715353
    D3DFMT_G8R8_G8B8:           1111970375
    D3DFMT_DXT1:                827611204
    D3DFMT_DXT2:                844388420
    D3DFMT_DXT3:                861165636
    D3DFMT_DXT4:                877942852
    D3DFMT_DXT5:                894720068
    D3DFMT_D16_LOCKABLE:        70
    D3DFMT_D32:                 71
    D3DFMT_D15S1:               73
    D3DFMT_D24S8:               75
    D3DFMT_D24X8:               77
    D3DFMT_D24X4S4:             79
    D3DFMT_D16:                 80

    D3DFMT_D32F_LOCKABLE:       82
    D3DFMT_D24FS8:              83

	
    D3DFMT_D32_LOCKABLE:        84
    D3DFMT_S8_LOCKABLE:         85




    D3DFMT_L16:                 81

    D3DFMT_VERTEXDATA:          100
    D3DFMT_INDEX16:             101
    D3DFMT_INDEX32:             102

    D3DFMT_Q16W16V16U16:        110

    D3DFMT_MULTI2_ARGB8:        827606349

    ; Floating point surface formats

    ; s10e5 formats (16-bits per channel)
    D3DFMT_R16F:                111
    D3DFMT_G16R16F:             112
    D3DFMT_A16B16G16R16F:       113

    ; IEEE s23e8 formats (32-bits per channel)
    D3DFMT_R32F:                114
    D3DFMT_G32R32F:             115
    D3DFMT_A32B32G32R32F:       116

    D3DFMT_CxV8U8:              117


 

    ; Monochrome 1 bit per pixel format
    D3DFMT_A1:                  118

    ; 2.8 biased fixed point
    D3DFMT_A2B10G10R10_XR_BIAS: 119


    ; Binary format indicating that the data has no inherent type
    D3DFMT_BINARYBUFFER:        199
    



    D3DFMT_FORCE_DWORD:         7FFFFFFFh
]



#enum D3DMULTISAMPLE_TYPE! [
	D3DMULTISAMPLE_NONE:        0
    D3DMULTISAMPLE_NONMASKABLE: 1
    D3DMULTISAMPLE_2_SAMPLES:   2
    D3DMULTISAMPLE_3_SAMPLES:   3
    D3DMULTISAMPLE_4_SAMPLES:   4
    D3DMULTISAMPLE_5_SAMPLES:   5
    D3DMULTISAMPLE_6_SAMPLES:   6
    D3DMULTISAMPLE_7_SAMPLES:   7
    D3DMULTISAMPLE_8_SAMPLES:   8
    D3DMULTISAMPLE_9_SAMPLES:   9
    D3DMULTISAMPLE_10_SAMPLES:  10
    D3DMULTISAMPLE_11_SAMPLES:  11
    D3DMULTISAMPLE_12_SAMPLES:  12
    D3DMULTISAMPLE_13_SAMPLES:  13
    D3DMULTISAMPLE_14_SAMPLES:  14
    D3DMULTISAMPLE_15_SAMPLES:  15
    D3DMULTISAMPLE_16_SAMPLES:  16

    D3DMULTISAMPLE_FORCE_DWORD: 7FFFFFFFh
]

#enum D3DSWAPEFFECT! [
	D3DSWAPEFFECT_DISCARD:     1
    D3DSWAPEFFECT_FLIP:        2
    D3DSWAPEFFECT_COPY:        3
    D3DSWAPEFFECT_OVERLAY:     4
    D3DSWAPEFFECT_FLIPEX:      5
    D3DSWAPEFFECT_FORCE_DWORD: 7FFFFFFFh
]



;directx functions
query-interface!: alias function! [
	pad1    [byte-ptr!]
	pad2    [byte-ptr!]
	return: [byte-ptr!]
]

d3d-presentation-parameters!: alias struct! [
	back-buffer-width              [integer!]
    back-buffer-height             [integer!]
    back-buffer-format             [D3DFORMAT!]
	back-buffer-count              [integer!]
    multi-sample-type              [D3DMULTISAMPLE_TYPE!]
	multi-sample-quality           [DWORD!]
	swap-effect                    [D3DSWAPEFFECT!]       
    h-device-window                [HWND!]
    windowed                       [BOOL!]
    enable-auto-depth-stencil      [BOOL!]
    auto-depth-stencil-format      [D3DFORMAT!]
	flags                          [DWORD!]
    full-screen-refresh-rate-in-hz [integer!]
	presentation-interval          [integer!]
]





;directx structs


direct3d-device!: alias struct! [
	query-interface             [function! []]
	add-ref                     [function! []]
	release                     [function! []]
	TestCooperativeLevel        [function! []]
    GetAvailableTextureMem      [function! []]
    EvictManagedResources       [function! []]
    GetDirect3D                 [function! []]
    GetDeviceCaps               [function! []]
    GetDisplayMode              [function! []]
    GetCreationParameters       [function! []]
    SetCursorProperties         [function! []]
    SetCursorPosition           [function! []]
    ShowCursor                  [function! []]
    CreateAdditionalSwapChain   [function! []]
    GetSwapChain                [function! []]
    GetNumberOfSwapChains       [function! []]
    Reset                       [function! []]
    Present                     [function! []]
    GetBackBuffer               [function! []]
    GetRasterStatus             [function! []]
    SetDialogBoxMode            [function! []]
    SetGammaRamp                [function! []]
    GetGammaRamp                [function! []]
    CreateTexture               [function! []]
    CreateVolumeTexture         [function! []]
    CreateCubeTexture           [function! []]
    CreateVertexBuffer          [function! []]
    CreateIndexBuffer           [function! []]
    CreateRenderTarget          [function! []]
    CreateDepthStencilSurface   [function! []]
    UpdateSurface               [function! []]
    UpdateTexture               [function! []]
    GetRenderTargetData         [function! []]
    GetFrontBufferData          [function! []]
    StretchRect                 [function! []]
    ColorFill                   [function! []]
    CreateOffscreenPlainSurface [function! []]
    SetRenderTarget             [function! []]
    GetRenderTarget             [function! []]
    SetDepthStencilSurface      [function! []]
    GetDepthStencilSurface      [function! []]
    BeginScene                  [function! []]
    EndScene                    [function! []]
    Clear                       [function! []]
    SetTransform                [function! []]
    GetTransform                [function! []]
    MultiplyTransform           [function! []]
    SetViewport                 [function! []]
    GetViewport                 [function! []]
    SetMaterial                 [function! []]
    GetMaterial                 [function! []]
    SetLight                    [function! []]
    GetLight                    [function! []]
    LightEnable                 [function! []]
    GetLightEnable              [function! []]
    SetClipPlane                [function! []]
    GetClipPlane                [function! []]
    SetRenderState              [function! []]
    GetRenderState              [function! []]
    CreateStateBlock            [function! []]
    BeginStateBlock             [function! []]
    EndStateBlock               [function! []]
    SetClipStatus               [function! []]
    GetClipStatus               [function! []]
    GetTexture                  [function! []]
    SetTexture                  [function! []]
    GetTextureStageState        [function! []]
    SetTextureStageState        [function! []]
    GetSamplerState             [function! []]
    SetSamplerState             [function! []]
    ValidateDevice              [function! []]
    SetPaletteEntries           [function! []]
    GetPaletteEntries           [function! []]
    SetCurrentTexturePalette    [function! []]
    GetCurrentTexturePalette    [function! []]
    SetScissorRect              [function! []]
    GetScissorRect              [function! []]
    SetSoftwareVertexProcessing [function! []]
    GetSoftwareVertexProcessing [function! []]
    SetNPatchMode               [function! []]
    GetNPatchMode               [function! []]
    DrawPrimitive               [function! []]
    DrawIndexedPrimitive        [function! []]
    DrawPrimitiveUP             [function! []]
    DrawIndexedPrimitiveUP      [function! []]
    ProcessVertices             [function! []]
    CreateVertexDeclaration     [function! []]
    SetVertexDeclaration        [function! []]
    GetVertexDeclaration        [function! []]
    SetFVF                      [function! []]
    GetFVF                      [function! []]
    CreateVertexShader          [function! []]
    SetVertexShader             [function! []]
    GetVertexShader             [function! []]
    SetVertexShaderConstantF    [function! []]
    GetVertexShaderConstantF    [function! []]
    SetVertexShaderConstantI    [function! []]
    GetVertexShaderConstantI    [function! []]
    SetVertexShaderConstantB    [function! []]
    GetVertexShaderConstantB    [function! []]
    SetStreamSource             [function! []]
    GetStreamSource             [function! []]
    SetStreamSourceFreq         [function! []]
    GetStreamSourceFreq         [function! []]
    SetIndices                  [function! []]
    GetIndices                  [function! []]
    CreatePixelShader           [function! []]
    SetPixelShader              [function! []]
    GetPixelShader              [function! []]
    SetPixelShaderConstantF     [function! []]
    GetPixelShaderConstantF     [function! []]
    SetPixelShaderConstantI     [function! []]
    GetPixelShaderConstantI     [function! []]
    SetPixelShaderConstantB     [function! []]
    GetPixelShaderConstantB     [function! []]
    DrawRectPatch               [function! []]
    DrawTriPatch                [function! []]
    DeletePatch                 [function! []]
    CreateQuery                 [function! []]
]


direct3d!: alias struct! [
	query-interface             [function! []]
	add-ref                     [function! []]
	release                     [function! []]

	RegisterSoftwareDevice      [function! []]
	GetAdapterCount             [function! []]
	GetAdapterIdentifier        [function! []]
	GetAdapterModeCount         [function! []]
	EnumAdapterModes            [function! []]
	GetAdapterDisplayMode       [function! []]
	CheckDeviceType             [function! []]
	CheckDeviceFormat           [function! []]
	CheckDeviceMultiSampleType  [function! []]
	CheckDepthStencilMatch      [function! []]
	CheckDeviceFormatConversion [function! []]
	GetDeviceCaps               [function! []]
	GetAdapterMonitor           [function! []]
	create-device               [function! [
			adapter                   [integer!]
	        device-type               [D3DDEVTYPE!]
	        focus-window              [HWND!]
	        behavior-flags            [DWORD!]
	        presentation-parameters   [d3d-presentation-parameters!]
	        returned-device-interface [direct3d-device!]
	        return: [float!]
		]
	]
]

#import [
	directx9-wrapper calling [
		directx-create: "directXCreate" [
			return: [direct3d!]
		]
		directx-create-device: "directXCreateDevice" [
			window      [byte-ptr!]
			adapter     [integer!]
			device-type [D3DDEVTYPE!]
			behaviour   [DWORD!]
		]
		directx-destroy: "destroy_directx" [
			device  [direct3d-device!]
			directx [direct3d!]
		]
		set-presentation-parameters-is-windowed: "set_present_parameters_windowed" [
			logic [logic!]
		]
		set-presentation-parameters-swap-effect: "set_present_parameters_swap_effect" [
			swap-effect [D3DSWAPEFFECT!]
		]
		set-presentation-parameters-enable-auto-depth-stencil: "set_present_parameters_enable_auto_depth_stencil" [
			logic [logic!]
		]
		set-presentation-parameters-auto-depth-stencil-format: "set_present_parameters_auto_depth_stencil_format" [
			format [D3DFORMAT!]
		]
		set-presentation-parameters-back-buffer-width: "set_present_parameters_back_buffer_width" [
			int [integer!]
		]
		set-presentation-parameters-back-buffer-height: "set_present_parameters_back_buffer_height" [
			int [integer!]
		]
		set-presentation-parameters-back-buffer-format: "set_present_parameters_back_buffer_format" [
			format [D3DFORMAT!]
		]
		set-presentation-parameters-multi-sample-type: "set_present_parameters_multi_sample_type" [
			type [D3DMULTISAMPLE_TYPE!]
		]
		set-presentation-parameters-h-device-window: "set_present_parameters_h_device_window" [
			window [HWND!]
		]

		get-presentation-parameters: "get_presentation_parameters" [
			return: [d3d-presentation-parameters!]
		]
		get-direct-3d-device:        "get_direct_3d_device" [
			return: [direct3d-device!]
		]
		get-direct-3d:               "get_direct_3d" [
			return: [direct3d!]
		]
		;misc calls
		init-presentation-parameters: "zero_memory" []
		

		;windows sys calls
		get-active-window: "get_active_window" [
			return: [byte-ptr!]
		]

		;D3DCREATE_SOFTWARE_VERTEXPROCESSING: "d3dcreate_software_vertex_processing" [
		;	return: [float!]
		;]
	]
]



