# Ahead of time compilation instructions

To precompile, we will use [PackageCompiler](https://github.com/JuliaLang/PackageCompiler.jl). It is recommended that you add this to your base environment (e.g. `v1.6`).

This tutorial currently works on Julia 1.6.5 (long term support branch).

There are currently known issues on the Julia 1.7 branch.

## Setting up PackageCompiler.jl

```julia
julia> Base.active_project()
"C:\\Users\\kittisopikulm\\.julia\\environments\\v1.6\\Project.toml"

julia> using Pkg

julia> pkg"add PackageCompiler"
    Updating registry at `C:\Users\kittisopikulm\.julia\registries\General`
...

julia> pkg"st PackageCompiler"
      Status `C:\Users\kittisopikulm\.julia\environments\v1.6\Project.toml`
  [9b87118b] PackageCompiler v2.0.5
```

## Activate the GaussianBeamLens project

```julia

julia> cd(raw"C:\Users\kittisopikulm\.julia\dev\GaussianBeamLens")

julia> pkg"activate ."
  Activating project at `C:\Users\kittisopikulm\.julia\dev\GaussianBeamLens`

julia> Base.active_project()
"C:\\Users\\kittisopikulm\\.julia\\dev\\GaussianBeamLens\\Project.toml"

julia> pkg"status"
     Project GaussianBeamLens v0.1.0
      Status `C:\Users\kittisopikulm\.julia\dev\GaussianBeamLens\Project.toml`
  [35d6a980] ColorSchemes v3.17.1
  [7a1cc6ca] FFTW v1.4.5
  [28b8d3ca] GR v0.57.5
  [4c0ca9eb] Gtk v1.2.0
  [27996c0f] GtkReactive v1.0.6
  [86fae568] ImageView v0.10.15
  [916415d5] Images v0.25.1
  [9b13fd28] IndirectArrays v1.0.0
  [dbb5928d] MappedArrays v0.4.1
  [c3e4b0f8] Pluto v0.18.0
  [7f904dfe] PlutoUI v0.7.34
```

```
julia> pkg"instantiate"
    Updating registry at `C:\Users\kittisopikulm\.julia\registries\General`
    Updating git-repo `https://github.com/JuliaRegistries/General.git`
   Installed TiffImages ─ v0.4.3
    Updating `C:\Users\kittisopikulm\.julia\dev\GaussianBeamLens\Project.toml`
  [35d6a980] + ColorSchemes v3.17.1
  [7a1cc6ca] + FFTW v1.4.5
  [28b8d3ca] + GR v0.57.5
  [4c0ca9eb] + Gtk v1.2.0
  [27996c0f] + GtkReactive v1.0.6
...
```

<details>
    <summary>Extended invocation of `pkg"instantiate"`</summary>

```
  [86fae568] + ImageView v0.10.15
  [916415d5] + Images v0.25.1
  [9b13fd28] + IndirectArrays v1.0.0
  [dbb5928d] + MappedArrays v0.4.1
  [c3e4b0f8] + Pluto v0.18.0
  [7f904dfe] + PlutoUI v0.7.34
    Updating `C:\Users\kittisopikulm\.julia\dev\GaussianBeamLens\Manifest.toml`
  [621f4979] + AbstractFFTs v1.1.0
  [6e696c72] + AbstractPlutoDingetjes v1.1.4
  [79e6a3ab] + Adapt v3.3.3
  [ec485272] + ArnoldiMethod v0.2.0
  [4fba245c] + ArrayInterface v4.0.3
  [13072b0f] + AxisAlgorithms v1.0.1
  [39de3d68] + AxisArrays v0.4.4
  [fa961155] + CEnum v0.4.1
  [159f3aea] + Cairo v1.0.5
  [49dc2e85] + Calculus v0.5.1
  [aafaddc9] + CatIndices v0.2.2
  [d360d2e6] + ChainRulesCore v1.12.0
  [9e997f8a] + ChangesOfVariables v0.1.2
  [aaaa29a8] + Clustering v0.14.2
  [35d6a980] + ColorSchemes v3.17.1
  [3da002f7] + ColorTypes v0.11.0
  [c3611d14] + ColorVectorSpace v0.9.8
  [5ae59095] + Colors v0.12.8
  [34da2185] + Compat v3.41.0
  [ed09eef8] + ComputationalResources v0.3.2
  [5218b696] + Configurations v0.17.3
  [150eb455] + CoordinateTransformations v0.6.2
  [dc8bdbbb] + CustomUnitRanges v1.0.2
  [9a962f9c] + DataAPI v1.9.0
  [864edb3b] + DataStructures v0.17.20
  [e2d170a0] + DataValueInterfaces v1.0.0
  [b4f34e82] + Distances v0.10.7
  [ffbed154] + DocStringExtensions v0.8.6
  [fa6b7ba4] + DualNumbers v0.6.6
  [da5c29d0] + EllipsisNotation v1.3.0
  [55351af7] + ExproniconLite v0.6.13
  [4f61f5a4] + FFTViews v0.3.2
  [7a1cc6ca] + FFTW v1.4.5
  [5789e2e9] + FileIO v1.13.0
  [53c48c17] + FixedPointNumbers v0.8.4
  [fb4132e2] + FuzzyCompletions v0.4.3
  [28b8d3ca] + GR v0.57.5
  [a2bd30eb] + Graphics v1.1.1
  [86223c79] + Graphs v1.6.0
  [4c0ca9eb] + Gtk v1.2.0
  [27996c0f] + GtkReactive v1.0.6
  [cd3eb016] + HTTP v0.9.17
  [47d2ed2b] + Hyperscript v0.0.4
  [ac1192a8] + HypertextLiteral v0.9.3
  [b5f81e59] + IOCapture v0.2.2
  [615f187c] + IfElse v0.1.1
  [2803e5a7] + ImageAxes v0.6.10
  [c817782e] + ImageBase v0.1.5
  [f332f351] + ImageContrastAdjustment v0.3.10
  [a09fc81d] + ImageCore v0.9.3
  [51556ac3] + ImageDistances v0.2.15
  [6a3955dd] + ImageFiltering v0.7.1
  [82e4d734] + ImageIO v0.6.1
  [6218d12a] + ImageMagick v1.2.1
  [bc367c6b] + ImageMetadata v0.9.8
  [787d08f9] + ImageMorphology v0.3.1
  [2996bd0c] + ImageQualityIndexes v0.3.0
  [80713f31] + ImageSegmentation v1.7.0
  [4e3cecfd] + ImageShow v0.3.3
  [02fcd773] + ImageTransformations v0.9.4
  [86fae568] + ImageView v0.10.15
  [916415d5] + Images v0.25.1
  [9b13fd28] + IndirectArrays v1.0.0
  [d25df0c9] + Inflate v0.1.2
  [83e8ac13] + IniFile v0.5.0
  [1d092043] + IntegralArrays v0.1.3
  [a98d9a8b] + Interpolations v0.13.5
  [8197267c] + IntervalSets v0.5.3
  [3587e190] + InverseFunctions v0.1.2
  [92d709cd] + IrrationalConstants v0.1.1
  [c8e1da08] + IterTools v1.4.0
  [82899510] + IteratorInterfaceExtensions v1.0.0
  [033835bb] + JLD2 v0.4.21
  [692b3bcd] + JLLWrappers v1.4.1
  [682c06a0] + JSON v0.21.3
  [b835a17e] + JpegTurbo v0.1.1
  [2ab3a3ac] + LogExpFunctions v0.3.6
  [1914dd2f] + MacroTools v0.5.9
  [dbb5928d] + MappedArrays v0.4.1
  [739be429] + MbedTLS v1.0.3
  [626554b9] + MetaGraphs v0.7.1
  [e1d29d7a] + Missings v1.0.2
  [e94cdb99] + MosaicViews v0.3.3
  [99f44e22] + MsgPack v1.1.0
  [77ba4419] + NaNMath v0.3.7
  [b8a86587] + NearestNeighbors v0.4.9
  [f09324ee] + Netpbm v1.0.2
  [6fe1bfb0] + OffsetArrays v1.10.8
  [52e1d378] + OpenEXR v0.3.2
  [bac558e1] + OrderedCollections v1.4.1
  [f57f5aa1] + PNGFiles v0.3.14
  [5432bcbf] + PaddedViews v0.5.11
  [d96e819e] + Parameters v0.12.3
  [69de0a69] + Parsers v2.2.2
  [eebad327] + PkgVersion v0.1.1
  [c3e4b0f8] + Pluto v0.18.0
  [7f904dfe] + PlutoUI v0.7.34
  [21216c6a] + Preferences v1.2.3
  [92933f4c] + ProgressMeter v1.7.1
  [4b34888f] + QOI v1.0.0
  [94ee1d12] + Quaternions v0.4.2
  [b3c3ace0] + RangeArrays v0.3.2
  [c84ed2f1] + Ratios v0.4.2
  [a223df75] + Reactive v0.8.3
  [189a3867] + Reexport v1.2.2
  [dee08c22] + RegionTrees v0.3.2
  [05181044] + RelocatableFolders v0.1.3
  [ae029012] + Requires v1.3.0
  [6038ab10] + Rotations v1.2.0
  [d5f540fe] + RoundingIntegers v1.1.0
  [6c6a2e73] + Scratch v1.1.0
  [699a6c99] + SimpleTraits v0.9.4
  [47aef6b3] + SimpleWeightedGraphs v1.2.1
  [45858cf5] + Sixel v0.1.2
  [a2af1166] + SortingAlgorithms v1.0.1
  [276daf66] + SpecialFunctions v2.1.2
  [cae243ae] + StackViews v0.1.1
  [aedffcd0] + Static v0.5.5
  [90137ffa] + StaticArrays v1.3.5
  [82ae8749] + StatsAPI v1.2.1
  [2913bbd2] + StatsBase v0.33.16
  [3783bdb8] + TableTraits v1.0.1
  [bd369af6] + Tables v1.6.1
  [62fd8b95] + TensorCore v0.1.1
  [731e570b] + TiffImages v0.4.3
  [06e1c1a7] + TiledIteration v0.3.1
  [3bb67fe8] + TranscodingStreams v0.9.6
  [5c2747f8] + URIs v1.3.0
  [3a884ed6] + UnPack v1.0.2
  [efce3f68] + WoodburyMatrices v0.5.5
  [7b86fcea] + ATK_jll v2.36.1+0
  [6e34b625] + Bzip2_jll v1.0.8+0
  [83423d85] + Cairo_jll v1.16.1+1
  [ee1fde0b] + Dbus_jll v1.12.16+3
  [2e619515] + Expat_jll v2.4.4+0
  [b22a6f82] + FFMPEG_jll v4.4.0+0
  [f5851436] + FFTW_jll v3.3.10+0
  [a3f928ae] + Fontconfig_jll v2.13.93+0
  [d7e528f0] + FreeType2_jll v2.10.4+0
  [559328eb] + FriBidi_jll v1.0.10+0
  [0656b61e] + GLFW_jll v3.3.6+0
  [d2c73de3] + GR_jll v0.64.0+0
  [77ec8976] + GTK3_jll v3.24.31+0
  [78b55507] + Gettext_jll v0.21.0+0
  [61579ee1] + Ghostscript_jll v9.55.0+0
  [7746bdde] + Glib_jll v2.68.3+2
  [3b182d85] + Graphite2_jll v1.3.14+0
  [2e76f6c2] + HarfBuzz_jll v2.8.1+1
  [c73af94c] + ImageMagick_jll v6.9.12+2
  [905a6f67] + Imath_jll v3.1.2+0
  [1d5cc7b8] + IntelOpenMP_jll v2018.0.3+2
  [aacddb02] + JpegTurbo_jll v2.1.2+0
  [c1c5ebd0] + LAME_jll v3.100.1+0
  [dd4b983a] + LZO_jll v2.10.1+0
  [42c93a91] + Libepoxy_jll v1.5.8+1
  [e9f186c6] + Libffi_jll v3.2.2+1
  [d4300ac3] + Libgcrypt_jll v1.8.7+0
  [7e76a0d4] + Libglvnd_jll v1.3.0+3
  [7add5ba3] + Libgpg_error_jll v1.42.0+0
  [94ce4f54] + Libiconv_jll v1.16.1+1
  [4b2f31a3] + Libmount_jll v2.35.0+0
  [925c91fb] + Librsvg_jll v2.52.4+0
  [89763e89] + Libtiff_jll v4.3.0+0
  [38a345b3] + Libuuid_jll v2.36.0+0
  [856f044c] + MKL_jll v2021.1.1+2
  [e7412a2a] + Ogg_jll v1.3.5+1
  [18a262bb] + OpenEXR_jll v3.1.1+0
  [458c3c95] + OpenSSL_jll v1.1.13+0
  [efe28fd5] + OpenSpecFun_jll v0.5.5+0
  [91d4177d] + Opus_jll v1.3.2+0
  [2f80f16e] + PCRE_jll v8.44.0+0
  [36c8627f] + Pango_jll v1.50.3+0
  [30392449] + Pixman_jll v0.40.1+0
  [ea2cea3b] + Qt5Base_jll v5.15.3+0
  [a2964d1f] + Wayland_jll v1.19.0+0
  [2381bf8a] + Wayland_protocols_jll v1.23.0+0
  [02c8fc9c] + XML2_jll v2.9.12+0
  [aed1982a] + XSLT_jll v1.1.34+0
  [4f6342f7] + Xorg_libX11_jll v1.6.9+4
  [0c0b7dd1] + Xorg_libXau_jll v1.0.9+4
  [3c9796d7] + Xorg_libXcomposite_jll v0.4.5+4
  [935fb764] + Xorg_libXcursor_jll v1.2.0+4
  [0aeada51] + Xorg_libXdamage_jll v1.1.5+4
  [a3789734] + Xorg_libXdmcp_jll v1.1.3+4
  [1082639a] + Xorg_libXext_jll v1.3.4+4
  [d091e8ba] + Xorg_libXfixes_jll v5.0.3+4
  [a51aa0fd] + Xorg_libXi_jll v1.7.10+4
  [d1454406] + Xorg_libXinerama_jll v1.1.4+4
  [ec84b674] + Xorg_libXrandr_jll v1.5.2+4
  [ea2f1a96] + Xorg_libXrender_jll v0.9.10+4
  [b6f176f1] + Xorg_libXtst_jll v1.2.3+4
  [14d82f49] + Xorg_libpthread_stubs_jll v0.1.0+3
  [c7cfdc94] + Xorg_libxcb_jll v1.13.0+3
  [cc61e674] + Xorg_libxkbfile_jll v1.1.0+4
  [12413925] + Xorg_xcb_util_image_jll v0.4.0+1
  [2def613f] + Xorg_xcb_util_jll v0.4.0+1
  [975044d2] + Xorg_xcb_util_keysyms_jll v0.4.0+1
  [0d47668e] + Xorg_xcb_util_renderutil_jll v0.3.9+1
  [c22f9ab0] + Xorg_xcb_util_wm_jll v0.4.1+1
  [35661453] + Xorg_xkbcomp_jll v1.4.2+4
  [33bec58e] + Xorg_xkeyboard_config_jll v2.27.0+4
  [c5fb5394] + Xorg_xtrans_jll v1.4.0+3
  [3161d3a3] + Zstd_jll v1.5.2+0
  [b437f822] + adwaita_icon_theme_jll v3.33.92+5
  [de012916] + at_spi2_atk_jll v2.34.1+4
  [0fc3237b] + at_spi2_core_jll v2.34.0+4
  [da03df04] + gdk_pixbuf_jll v2.42.6+1
  [059c91fe] + hicolor_icon_theme_jll v0.17.0+3
  [bf975903] + iso_codes_jll v4.3.0+4
  [0ac62f75] + libass_jll v0.15.1+0
  [f638f0a6] + libfdk_aac_jll v2.0.2+0
  [b53b4c65] + libpng_jll v1.6.38+0
  [075b6546] + libsixel_jll v1.8.6+1
  [f27f6e37] + libvorbis_jll v1.3.7+1
  [1270edf5] + x264_jll v2021.5.5+0
  [dfaa095f] + x265_jll v3.5.0+0
  [d8fb68d0] + xkbcommon_jll v0.9.1+5
  [0dad84c5] + ArgTools
  [56f22d72] + Artifacts
  [2a0f44e3] + Base64
  [ade2ca70] + Dates
  [8bb1440f] + DelimitedFiles
  [8ba89e20] + Distributed
  [f43a241f] + Downloads
  [7b1f6079] + FileWatching
  [b77e0a4c] + InteractiveUtils
  [4af54fe1] + LazyArtifacts
  [b27032c2] + LibCURL
  [76f85450] + LibGit2
  [8f399da3] + Libdl
  [37e2e46d] + LinearAlgebra
  [56ddb016] + Logging
  [d6f4376e] + Markdown
  [a63ad114] + Mmap
  [ca575930] + NetworkOptions
  [44cfe95a] + Pkg
  [de0858da] + Printf
  [3fa0cd96] + REPL
  [9a3f8284] + Random
  [ea8e919c] + SHA
  [9e88b42a] + Serialization
  [1a1011a3] + SharedArrays
  [6462fe0b] + Sockets
  [2f01184e] + SparseArrays
  [10745b16] + Statistics
  [fa267f1f] + TOML
  [a4e569a6] + Tar
  [8dfed614] + Test
  [cf7118a7] + UUIDs
  [4ec0a83e] + Unicode
  [e66e0078] + CompilerSupportLibraries_jll
  [deac9b47] + LibCURL_jll
  [29816b5a] + LibSSH2_jll
  [c8ffd9c3] + MbedTLS_jll
  [14a3606d] + MozillaCACerts_jll
  [05823500] + OpenLibm_jll
  [83775a58] + Zlib_jll
  [8e850ede] + nghttp2_jll
  [3f19e933] + p7zip_jll
```


```julia
julia> pkg"precompile"

julia> include("src\\GtkGUI.jl")

```

## Run Package Compiler to produce a shared library (.dll or .so)

```julia
julia> using PackageCompiler

julia> create_sysimage(; sysimage_path="gbl16.dll", precompile_execution_file="src\\GtkGUI.jl") # You may need to press enter a few times
Precompiling project...
  86 dependencies successfully precompiled in 72 seconds (137 already precompiled)
[ Info: PackageCompiler: Executing C:\Users\kittisopikulm\.julia\dev\GaussianBeamLens\src\GtkGUI.jl => C:\Users\KITTIS~1\AppData\Local\Temp\jl_packagecompiler_r5PmB2\jl_6F4A.tmp
  3.538711 seconds (5.90 M allocations: 395.121 MiB, 2.27% gc time, 28.33% compilation time)
Press any key

[ Info: PackageCompiler: Done
⠙ [00m:09s] PackageCompiler: compiling incremental system image
...
[ Info: PackageCompiler: Done
✔ [03m:22s] PackageCompiler: compiling incremental system image
```

## Run Julia with the new system image
```
PS C:\Users\kittisopikulm\.julia\dev\GaussianBeamLens> julia.exe --project=. -t auto -J gbl16.dll src\GtkGUI.jl
```
