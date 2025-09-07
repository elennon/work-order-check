; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [167 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [334 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 120
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 119
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 58
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 155
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 56
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 138
	i32 122350210, ; 7: System.Threading.Channels.dll => 0x74aea82 => 154
	i32 123514077, ; 8: EPPlus.dll => 0x75cacdd => 36
	i32 142721839, ; 9: System.Net.WebHeaderCollection => 0x881c32f => 127
	i32 159306688, ; 10: System.ComponentModel.Annotations => 0x97ed3c0 => 100
	i32 165246403, ; 11: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 70
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 88
	i32 195452805, ; 13: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 14: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 15: System.ComponentModel => 0xc38ff48 => 103
	i32 230752869, ; 16: Microsoft.CSharp.dll => 0xdc10265 => 95
	i32 246610117, ; 17: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 135
	i32 280992041, ; 18: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 19: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 20: Xamarin.AndroidX.Activity.dll => 0x13031348 => 66
	i32 336156722, ; 21: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 22: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 77
	i32 347068432, ; 23: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 62
	i32 356389973, ; 24: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 375677976, ; 25: System.Net.ServicePoint.dll => 0x16646418 => 124
	i32 379916513, ; 26: System.Threading.Thread.dll => 0x16a510e1 => 155
	i32 385762202, ; 27: System.Memory.dll => 0x16fe439a => 117
	i32 392610295, ; 28: System.Threading.ThreadPool.dll => 0x1766c1f7 => 156
	i32 395744057, ; 29: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 30: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 31: System.Collections => 0x1a61054f => 99
	i32 450948140, ; 32: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 459347974, ; 33: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 143
	i32 469710990, ; 34: System.dll => 0x1bff388e => 161
	i32 498788369, ; 35: System.ObjectModel => 0x1dbae811 => 129
	i32 500358224, ; 36: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 37: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 38: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 50
	i32 539058512, ; 39: Microsoft.Extensions.Logging => 0x20216150 => 47
	i32 546455878, ; 40: System.Runtime.Serialization.Xml => 0x20924146 => 144
	i32 592146354, ; 41: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 42: Xamarin.AndroidX.CustomView => 0x2568904f => 74
	i32 627931235, ; 43: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 44: System.Collections.Concurrent => 0x2814a96c => 96
	i32 683518922, ; 45: System.Net.Security => 0x28bdabca => 123
	i32 688181140, ; 46: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 47: System.Xml.Linq.dll => 0x29293ff5 => 158
	i32 700967580, ; 48: job number check.dll => 0x29c7ea9c => 94
	i32 706645707, ; 49: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709152836, ; 50: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 64
	i32 709557578, ; 51: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 52: System.Runtime.Loader.dll => 0x2b15ed29 => 139
	i32 748832960, ; 53: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 60
	i32 759454413, ; 54: System.Net.Requests => 0x2d445acd => 122
	i32 775507847, ; 55: System.IO.Compression => 0x2e394f87 => 113
	i32 777317022, ; 56: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 57: Microsoft.Extensions.Options => 0x2f0980eb => 49
	i32 794464650, ; 58: EPPlus.Interfaces => 0x2f5a918a => 37
	i32 804715423, ; 59: System.Data.Common => 0x2ff6fb9f => 105
	i32 823281589, ; 60: System.Private.Uri.dll => 0x311247b5 => 131
	i32 830298997, ; 61: System.IO.Compression.Brotli => 0x317d5b75 => 112
	i32 904024072, ; 62: System.ComponentModel.Primitives.dll => 0x35e25008 => 101
	i32 926902833, ; 63: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 64: Newtonsoft.Json => 0x38f24a24 => 58
	i32 967690846, ; 65: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 77
	i32 975236339, ; 66: System.Diagnostics.Tracing => 0x3a20ecf3 => 108
	i32 975874589, ; 67: System.Xml.XDocument => 0x3a2aaa1d => 160
	i32 986514023, ; 68: System.Private.DataContractSerialization.dll => 0x3acd0267 => 130
	i32 992768348, ; 69: System.Collections.dll => 0x3b2c715c => 99
	i32 999186168, ; 70: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 46
	i32 1012816738, ; 71: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 87
	i32 1019214401, ; 72: System.Drawing => 0x3cbffa41 => 110
	i32 1028951442, ; 73: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 43
	i32 1029334545, ; 74: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 75: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 67
	i32 1036536393, ; 76: System.Drawing.Primitives.dll => 0x3dc84a49 => 109
	i32 1044663988, ; 77: System.Linq.Expressions.dll => 0x3e444eb4 => 115
	i32 1052210849, ; 78: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 79
	i32 1082857460, ; 79: System.ComponentModel.TypeConverter => 0x408b17f4 => 102
	i32 1084122840, ; 80: Xamarin.Kotlin.StdLib => 0x409e66d8 => 92
	i32 1098259244, ; 81: System => 0x41761b2c => 161
	i32 1106973742, ; 82: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 40
	i32 1118262833, ; 83: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 84: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 85: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 44
	i32 1178241025, ; 86: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 84
	i32 1203215381, ; 87: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 88: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 89: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 90: SQLitePCLRaw.core.dll => 0x4d0585a0 => 61
	i32 1293217323, ; 91: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 75
	i32 1309188875, ; 92: System.Private.DataContractSerialization => 0x4e08a30b => 130
	i32 1324164729, ; 93: System.Linq => 0x4eed2679 => 116
	i32 1335329327, ; 94: System.Runtime.Serialization.Json.dll => 0x4f97822f => 142
	i32 1373134921, ; 95: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 96: Xamarin.AndroidX.SavedState => 0x52114ed3 => 87
	i32 1406073936, ; 97: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 71
	i32 1408764838, ; 98: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 141
	i32 1430672901, ; 99: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 100: System.Formats.Asn1.dll => 0x568cd628 => 111
	i32 1458022317, ; 101: System.Net.Security.dll => 0x56e7a7ad => 123
	i32 1461004990, ; 102: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 103: System.IO.Compression.dll => 0x57261233 => 113
	i32 1469204771, ; 104: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 68
	i32 1470490898, ; 105: Microsoft.Extensions.Primitives => 0x57a5e912 => 50
	i32 1479011226, ; 106: EPPlus => 0x5827eb9a => 36
	i32 1480492111, ; 107: System.IO.Compression.Brotli.dll => 0x583e844f => 112
	i32 1493001747, ; 108: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 109: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1521091094, ; 110: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 46
	i32 1543031311, ; 111: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 153
	i32 1551623176, ; 112: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1551954004, ; 113: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 51
	i32 1573704789, ; 114: System.Runtime.Serialization.Json => 0x5dccd455 => 142
	i32 1592867496, ; 115: job number check => 0x5ef13aa8 => 94
	i32 1604827217, ; 116: System.Net.WebClient => 0x5fa7b851 => 126
	i32 1622152042, ; 117: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 81
	i32 1624863272, ; 118: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 90
	i32 1632842087, ; 119: Microsoft.Extensions.Configuration.Json => 0x61533167 => 41
	i32 1636350590, ; 120: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 73
	i32 1639515021, ; 121: System.Net.Http.dll => 0x61b9038d => 118
	i32 1639986890, ; 122: System.Text.RegularExpressions => 0x61c036ca => 153
	i32 1657153582, ; 123: System.Runtime => 0x62c6282e => 145
	i32 1658251792, ; 124: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 91
	i32 1667453763, ; 125: Mopups.dll => 0x63635343 => 57
	i32 1677501392, ; 126: System.Net.Primitives.dll => 0x63fca3d0 => 121
	i32 1679769178, ; 127: System.Security.Cryptography => 0x641f3e5a => 148
	i32 1711441057, ; 128: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 62
	i32 1729485958, ; 129: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 69
	i32 1736233607, ; 130: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 131: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 132: System.Diagnostics.TraceSource.dll => 0x69239124 => 107
	i32 1766324549, ; 133: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 88
	i32 1770582343, ; 134: Microsoft.Extensions.Logging.dll => 0x6988f147 => 47
	i32 1780572499, ; 135: Mono.Android.Runtime.dll => 0x6a216153 => 165
	i32 1782862114, ; 136: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 137: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1793755602, ; 138: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 139: Xamarin.AndroidX.Loader => 0x6bcd3296 => 81
	i32 1813058853, ; 140: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 92
	i32 1813201214, ; 141: Xamarin.Google.Android.Material => 0x6c13413e => 91
	i32 1818569960, ; 142: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 85
	i32 1824175904, ; 143: System.Text.Encoding.Extensions => 0x6cbab720 => 151
	i32 1824722060, ; 144: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 141
	i32 1828688058, ; 145: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 48
	i32 1842015223, ; 146: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 147: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 148: System.Linq.Expressions => 0x6ec71a65 => 115
	i32 1870277092, ; 149: System.Reflection.Primitives => 0x6f7a29e4 => 136
	i32 1875935024, ; 150: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 151: System.Collections.NonGeneric.dll => 0x71dc7c8b => 97
	i32 1939592360, ; 152: System.Private.Xml.Linq => 0x739bd4a8 => 132
	i32 1968388702, ; 153: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 38
	i32 1968499395, ; 154: AsyncAwaitBestPractices => 0x7554eac3 => 35
	i32 2003115576, ; 155: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 156: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 79
	i32 2025202353, ; 157: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 158: System.Private.Xml => 0x79eb68ee => 133
	i32 2055257422, ; 159: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 78
	i32 2066184531, ; 160: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 161: System.Diagnostics.TraceSource => 0x7b6f419e => 107
	i32 2072397586, ; 162: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 45
	i32 2079903147, ; 163: System.Runtime.dll => 0x7bf8cdab => 145
	i32 2085039813, ; 164: System.Security.Cryptography.Xml.dll => 0x7c472ec5 => 65
	i32 2090596640, ; 165: System.Numerics.Vectors => 0x7c9bf920 => 128
	i32 2103459038, ; 166: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 63
	i32 2127167465, ; 167: System.Console => 0x7ec9ffe9 => 104
	i32 2142473426, ; 168: System.Collections.Specialized => 0x7fb38cd2 => 98
	i32 2143465592, ; 169: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 51
	i32 2159891885, ; 170: Microsoft.Maui => 0x80bd55ad => 54
	i32 2169148018, ; 171: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 172: Microsoft.Extensions.Options.dll => 0x820d22b3 => 49
	i32 2192057212, ; 173: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 48
	i32 2193016926, ; 174: System.ObjectModel.dll => 0x82b6c85e => 129
	i32 2201107256, ; 175: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 93
	i32 2201231467, ; 176: System.Net.Http => 0x8334206b => 118
	i32 2207618523, ; 177: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2265110946, ; 178: System.Security.AccessControl.dll => 0x8702d9a2 => 146
	i32 2266799131, ; 179: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 39
	i32 2270573516, ; 180: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 181: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 86
	i32 2295906218, ; 182: System.Net.Sockets => 0x88d8bfaa => 125
	i32 2303942373, ; 183: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 184: System.Private.CoreLib.dll => 0x896b7878 => 163
	i32 2340441535, ; 185: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 137
	i32 2353062107, ; 186: System.Net.Primitives => 0x8c40e0db => 121
	i32 2368005991, ; 187: System.Xml.ReaderWriter.dll => 0x8d24e767 => 159
	i32 2371007202, ; 188: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 38
	i32 2383496789, ; 189: System.Security.Principal.Windows.dll => 0x8e114655 => 149
	i32 2395872292, ; 190: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 191: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 192: System.Console.dll => 0x912896e5 => 104
	i32 2458678730, ; 193: System.Net.Sockets.dll => 0x928c75ca => 125
	i32 2465273461, ; 194: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 60
	i32 2471841756, ; 195: netstandard.dll => 0x93554fdc => 162
	i32 2475788418, ; 196: Java.Interop.dll => 0x93918882 => 164
	i32 2480646305, ; 197: Microsoft.Maui.Controls => 0x93dba8a1 => 52
	i32 2484371297, ; 198: System.Net.ServicePoint => 0x94147f61 => 124
	i32 2538310050, ; 199: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 135
	i32 2548432851, ; 200: EPPlus.Interfaces.dll => 0x97e5ffd3 => 37
	i32 2550873716, ; 201: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 202: Microsoft.CSharp => 0x98ba5a04 => 95
	i32 2585220780, ; 203: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 151
	i32 2589602615, ; 204: System.Threading.ThreadPool => 0x9a5a3337 => 156
	i32 2592341985, ; 205: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 44
	i32 2593496499, ; 206: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 207: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 93
	i32 2617129537, ; 208: System.Private.Xml.dll => 0x9bfe3a41 => 133
	i32 2620871830, ; 209: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 73
	i32 2626831493, ; 210: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 211: System.Runtime.Loader => 0x9ec4cf01 => 139
	i32 2664396074, ; 212: System.Xml.XDocument.dll => 0x9ecf752a => 160
	i32 2665622720, ; 213: System.Drawing.Primitives => 0x9ee22cc0 => 109
	i32 2676780864, ; 214: System.Data.Common.dll => 0x9f8c6f40 => 105
	i32 2686887180, ; 215: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 144
	i32 2717744543, ; 216: System.Security.Claims => 0xa1fd7d9f => 147
	i32 2724373263, ; 217: System.Runtime.Numerics.dll => 0xa262a30f => 140
	i32 2732626843, ; 218: Xamarin.AndroidX.Activity => 0xa2e0939b => 66
	i32 2735172069, ; 219: System.Threading.Channels => 0xa30769e5 => 154
	i32 2737747696, ; 220: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 68
	i32 2752995522, ; 221: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 222: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 53
	i32 2764765095, ; 223: Microsoft.Maui.dll => 0xa4caf7a7 => 54
	i32 2765824710, ; 224: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 150
	i32 2778768386, ; 225: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 89
	i32 2785988530, ; 226: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 227: Microsoft.Maui.Graphics => 0xa7008e0b => 56
	i32 2806116107, ; 228: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 229: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 71
	i32 2831556043, ; 230: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 231: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 89
	i32 2861189240, ; 232: Microsoft.Maui.Essentials => 0xaa8a4878 => 55
	i32 2909740682, ; 233: System.Private.CoreLib => 0xad6f1e8a => 163
	i32 2911054922, ; 234: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 45
	i32 2916838712, ; 235: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 90
	i32 2919462931, ; 236: System.Numerics.Vectors.dll => 0xae037813 => 128
	i32 2921417940, ; 237: System.Security.Cryptography.Xml => 0xae214cd4 => 65
	i32 2959614098, ; 238: System.ComponentModel.dll => 0xb0682092 => 103
	i32 2968338931, ; 239: System.Security.Principal.Windows => 0xb0ed41f3 => 149
	i32 2978675010, ; 240: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 75
	i32 3038032645, ; 241: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 242: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 82
	i32 3059408633, ; 243: Mono.Android.Runtime => 0xb65adef9 => 165
	i32 3059793426, ; 244: System.ComponentModel.Primitives => 0xb660be12 => 101
	i32 3077302341, ; 245: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3099732863, ; 246: System.Security.Claims.dll => 0xb8c22b7f => 147
	i32 3103600923, ; 247: System.Formats.Asn1 => 0xb8fd311b => 111
	i32 3132293585, ; 248: System.Security.AccessControl => 0xbab301d1 => 146
	i32 3147165239, ; 249: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 108
	i32 3159123045, ; 250: System.Reflection.Primitives.dll => 0xbc4c6465 => 136
	i32 3178803400, ; 251: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 83
	i32 3220365878, ; 252: System.Threading => 0xbff2e236 => 157
	i32 3258312781, ; 253: Xamarin.AndroidX.CardView => 0xc235e84d => 69
	i32 3280506390, ; 254: System.ComponentModel.Annotations.dll => 0xc3888e16 => 100
	i32 3286872994, ; 255: SQLite-net.dll => 0xc3e9b3a2 => 59
	i32 3305363605, ; 256: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 257: System.Net.Requests.dll => 0xc5b097e4 => 122
	i32 3317135071, ; 258: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 74
	i32 3346324047, ; 259: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 84
	i32 3357674450, ; 260: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 261: System.Text.Json => 0xc82afec1 => 152
	i32 3360279109, ; 262: SQLitePCLRaw.core => 0xc849ca45 => 61
	i32 3362522851, ; 263: Xamarin.AndroidX.Core => 0xc86c06e3 => 72
	i32 3366347497, ; 264: Java.Interop => 0xc8a662e9 => 164
	i32 3374999561, ; 265: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 86
	i32 3381016424, ; 266: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 267: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 42
	i32 3430777524, ; 268: netstandard => 0xcc7d82b4 => 162
	i32 3463511458, ; 269: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 270: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 102
	i32 3476120550, ; 271: Mono.Android => 0xcf3163e6 => 166
	i32 3479583265, ; 272: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 273: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 274: System.Text.Json.dll => 0xcfbaacae => 152
	i32 3509114376, ; 275: System.Xml.Linq => 0xd128d608 => 158
	i32 3580758918, ; 276: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 277: System.Linq.dll => 0xd715a361 => 116
	i32 3624195450, ; 278: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 137
	i32 3641597786, ; 279: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 78
	i32 3643446276, ; 280: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 281: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 83
	i32 3657292374, ; 282: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 39
	i32 3660523487, ; 283: System.Net.NetworkInformation => 0xda2f27df => 120
	i32 3672681054, ; 284: Mono.Android.dll => 0xdae8aa5e => 166
	i32 3697841164, ; 285: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3722202641, ; 286: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 41
	i32 3724971120, ; 287: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 82
	i32 3732100267, ; 288: System.Net.NameResolution => 0xde7354ab => 119
	i32 3748608112, ; 289: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 106
	i32 3754567612, ; 290: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 63
	i32 3758424670, ; 291: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 40
	i32 3786282454, ; 292: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 70
	i32 3792276235, ; 293: System.Collections.NonGeneric => 0xe2098b0b => 97
	i32 3793321889, ; 294: AsyncAwaitBestPractices.dll => 0xe2197fa1 => 35
	i32 3802395368, ; 295: System.Collections.Specialized.dll => 0xe2a3f2e8 => 98
	i32 3807198597, ; 296: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 64
	i32 3823082795, ; 297: System.Security.Cryptography.dll => 0xe3df9d2b => 148
	i32 3841636137, ; 298: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 43
	i32 3849253459, ; 299: System.Runtime.InteropServices.dll => 0xe56ef253 => 138
	i32 3876362041, ; 300: SQLite-net => 0xe70c9739 => 59
	i32 3885497537, ; 301: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 127
	i32 3889960447, ; 302: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 303: System.Collections.Concurrent.dll => 0xe839deed => 96
	i32 3896760992, ; 304: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 72
	i32 3928044579, ; 305: System.Xml.ReaderWriter => 0xea213423 => 159
	i32 3931092270, ; 306: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 85
	i32 3953953790, ; 307: System.Text.Encoding.CodePages => 0xebac8bfe => 150
	i32 3955647286, ; 308: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 67
	i32 3980434154, ; 309: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 310: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 311: System.Memory => 0xeff49a63 => 117
	i32 4030748638, ; 312: Mopups => 0xf04057de => 57
	i32 4046471985, ; 313: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 53
	i32 4054681211, ; 314: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 134
	i32 4068434129, ; 315: System.Private.Xml.Linq.dll => 0xf27f60d1 => 132
	i32 4073602200, ; 316: System.Threading.dll => 0xf2ce3c98 => 157
	i32 4094352644, ; 317: Microsoft.Maui.Essentials.dll => 0xf40add04 => 55
	i32 4099507663, ; 318: System.Drawing.dll => 0xf45985cf => 110
	i32 4100113165, ; 319: System.Private.Uri => 0xf462c30d => 131
	i32 4102112229, ; 320: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 321: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 322: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 42
	i32 4127667938, ; 323: System.IO.FileSystem.Watcher => 0xf60736e2 => 114
	i32 4147896353, ; 324: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 134
	i32 4150914736, ; 325: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4164802419, ; 326: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 114
	i32 4181436372, ; 327: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 143
	i32 4182413190, ; 328: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 80
	i32 4196529839, ; 329: System.Net.WebClient.dll => 0xfa21f6af => 126
	i32 4213026141, ; 330: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 106
	i32 4271975918, ; 331: Microsoft.Maui.Controls.dll => 0xfea12dee => 52
	i32 4274976490, ; 332: System.Runtime.Numerics => 0xfecef6ea => 140
	i32 4292120959 ; 333: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 80
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [334 x i32] [
	i32 120, ; 0
	i32 119, ; 1
	i32 58, ; 2
	i32 155, ; 3
	i32 33, ; 4
	i32 56, ; 5
	i32 138, ; 6
	i32 154, ; 7
	i32 36, ; 8
	i32 127, ; 9
	i32 100, ; 10
	i32 70, ; 11
	i32 88, ; 12
	i32 30, ; 13
	i32 31, ; 14
	i32 103, ; 15
	i32 95, ; 16
	i32 135, ; 17
	i32 2, ; 18
	i32 30, ; 19
	i32 66, ; 20
	i32 15, ; 21
	i32 77, ; 22
	i32 62, ; 23
	i32 14, ; 24
	i32 124, ; 25
	i32 155, ; 26
	i32 117, ; 27
	i32 156, ; 28
	i32 34, ; 29
	i32 26, ; 30
	i32 99, ; 31
	i32 76, ; 32
	i32 143, ; 33
	i32 161, ; 34
	i32 129, ; 35
	i32 13, ; 36
	i32 7, ; 37
	i32 50, ; 38
	i32 47, ; 39
	i32 144, ; 40
	i32 21, ; 41
	i32 74, ; 42
	i32 19, ; 43
	i32 96, ; 44
	i32 123, ; 45
	i32 1, ; 46
	i32 158, ; 47
	i32 94, ; 48
	i32 16, ; 49
	i32 64, ; 50
	i32 4, ; 51
	i32 139, ; 52
	i32 60, ; 53
	i32 122, ; 54
	i32 113, ; 55
	i32 25, ; 56
	i32 49, ; 57
	i32 37, ; 58
	i32 105, ; 59
	i32 131, ; 60
	i32 112, ; 61
	i32 101, ; 62
	i32 28, ; 63
	i32 58, ; 64
	i32 77, ; 65
	i32 108, ; 66
	i32 160, ; 67
	i32 130, ; 68
	i32 99, ; 69
	i32 46, ; 70
	i32 87, ; 71
	i32 110, ; 72
	i32 43, ; 73
	i32 3, ; 74
	i32 67, ; 75
	i32 109, ; 76
	i32 115, ; 77
	i32 79, ; 78
	i32 102, ; 79
	i32 92, ; 80
	i32 161, ; 81
	i32 40, ; 82
	i32 16, ; 83
	i32 22, ; 84
	i32 44, ; 85
	i32 84, ; 86
	i32 20, ; 87
	i32 18, ; 88
	i32 2, ; 89
	i32 61, ; 90
	i32 75, ; 91
	i32 130, ; 92
	i32 116, ; 93
	i32 142, ; 94
	i32 32, ; 95
	i32 87, ; 96
	i32 71, ; 97
	i32 141, ; 98
	i32 0, ; 99
	i32 111, ; 100
	i32 123, ; 101
	i32 6, ; 102
	i32 113, ; 103
	i32 68, ; 104
	i32 50, ; 105
	i32 36, ; 106
	i32 112, ; 107
	i32 10, ; 108
	i32 5, ; 109
	i32 46, ; 110
	i32 153, ; 111
	i32 25, ; 112
	i32 51, ; 113
	i32 142, ; 114
	i32 94, ; 115
	i32 126, ; 116
	i32 81, ; 117
	i32 90, ; 118
	i32 41, ; 119
	i32 73, ; 120
	i32 118, ; 121
	i32 153, ; 122
	i32 145, ; 123
	i32 91, ; 124
	i32 57, ; 125
	i32 121, ; 126
	i32 148, ; 127
	i32 62, ; 128
	i32 69, ; 129
	i32 23, ; 130
	i32 1, ; 131
	i32 107, ; 132
	i32 88, ; 133
	i32 47, ; 134
	i32 165, ; 135
	i32 17, ; 136
	i32 76, ; 137
	i32 9, ; 138
	i32 81, ; 139
	i32 92, ; 140
	i32 91, ; 141
	i32 85, ; 142
	i32 151, ; 143
	i32 141, ; 144
	i32 48, ; 145
	i32 29, ; 146
	i32 26, ; 147
	i32 115, ; 148
	i32 136, ; 149
	i32 8, ; 150
	i32 97, ; 151
	i32 132, ; 152
	i32 38, ; 153
	i32 35, ; 154
	i32 5, ; 155
	i32 79, ; 156
	i32 0, ; 157
	i32 133, ; 158
	i32 78, ; 159
	i32 4, ; 160
	i32 107, ; 161
	i32 45, ; 162
	i32 145, ; 163
	i32 65, ; 164
	i32 128, ; 165
	i32 63, ; 166
	i32 104, ; 167
	i32 98, ; 168
	i32 51, ; 169
	i32 54, ; 170
	i32 12, ; 171
	i32 49, ; 172
	i32 48, ; 173
	i32 129, ; 174
	i32 93, ; 175
	i32 118, ; 176
	i32 14, ; 177
	i32 146, ; 178
	i32 39, ; 179
	i32 8, ; 180
	i32 86, ; 181
	i32 125, ; 182
	i32 18, ; 183
	i32 163, ; 184
	i32 137, ; 185
	i32 121, ; 186
	i32 159, ; 187
	i32 38, ; 188
	i32 149, ; 189
	i32 13, ; 190
	i32 10, ; 191
	i32 104, ; 192
	i32 125, ; 193
	i32 60, ; 194
	i32 162, ; 195
	i32 164, ; 196
	i32 52, ; 197
	i32 124, ; 198
	i32 135, ; 199
	i32 37, ; 200
	i32 11, ; 201
	i32 95, ; 202
	i32 151, ; 203
	i32 156, ; 204
	i32 44, ; 205
	i32 20, ; 206
	i32 93, ; 207
	i32 133, ; 208
	i32 73, ; 209
	i32 15, ; 210
	i32 139, ; 211
	i32 160, ; 212
	i32 109, ; 213
	i32 105, ; 214
	i32 144, ; 215
	i32 147, ; 216
	i32 140, ; 217
	i32 66, ; 218
	i32 154, ; 219
	i32 68, ; 220
	i32 21, ; 221
	i32 53, ; 222
	i32 54, ; 223
	i32 150, ; 224
	i32 89, ; 225
	i32 27, ; 226
	i32 56, ; 227
	i32 6, ; 228
	i32 71, ; 229
	i32 19, ; 230
	i32 89, ; 231
	i32 55, ; 232
	i32 163, ; 233
	i32 45, ; 234
	i32 90, ; 235
	i32 128, ; 236
	i32 65, ; 237
	i32 103, ; 238
	i32 149, ; 239
	i32 75, ; 240
	i32 34, ; 241
	i32 82, ; 242
	i32 165, ; 243
	i32 101, ; 244
	i32 12, ; 245
	i32 147, ; 246
	i32 111, ; 247
	i32 146, ; 248
	i32 108, ; 249
	i32 136, ; 250
	i32 83, ; 251
	i32 157, ; 252
	i32 69, ; 253
	i32 100, ; 254
	i32 59, ; 255
	i32 7, ; 256
	i32 122, ; 257
	i32 74, ; 258
	i32 84, ; 259
	i32 24, ; 260
	i32 152, ; 261
	i32 61, ; 262
	i32 72, ; 263
	i32 164, ; 264
	i32 86, ; 265
	i32 3, ; 266
	i32 42, ; 267
	i32 162, ; 268
	i32 11, ; 269
	i32 102, ; 270
	i32 166, ; 271
	i32 24, ; 272
	i32 23, ; 273
	i32 152, ; 274
	i32 158, ; 275
	i32 31, ; 276
	i32 116, ; 277
	i32 137, ; 278
	i32 78, ; 279
	i32 28, ; 280
	i32 83, ; 281
	i32 39, ; 282
	i32 120, ; 283
	i32 166, ; 284
	i32 33, ; 285
	i32 41, ; 286
	i32 82, ; 287
	i32 119, ; 288
	i32 106, ; 289
	i32 63, ; 290
	i32 40, ; 291
	i32 70, ; 292
	i32 97, ; 293
	i32 35, ; 294
	i32 98, ; 295
	i32 64, ; 296
	i32 148, ; 297
	i32 43, ; 298
	i32 138, ; 299
	i32 59, ; 300
	i32 127, ; 301
	i32 32, ; 302
	i32 96, ; 303
	i32 72, ; 304
	i32 159, ; 305
	i32 85, ; 306
	i32 150, ; 307
	i32 67, ; 308
	i32 27, ; 309
	i32 9, ; 310
	i32 117, ; 311
	i32 57, ; 312
	i32 53, ; 313
	i32 134, ; 314
	i32 132, ; 315
	i32 157, ; 316
	i32 55, ; 317
	i32 110, ; 318
	i32 131, ; 319
	i32 22, ; 320
	i32 17, ; 321
	i32 42, ; 322
	i32 114, ; 323
	i32 134, ; 324
	i32 29, ; 325
	i32 114, ; 326
	i32 143, ; 327
	i32 80, ; 328
	i32 126, ; 329
	i32 106, ; 330
	i32 52, ; 331
	i32 140, ; 332
	i32 80 ; 333
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
