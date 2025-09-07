; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [167 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [334 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 50
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 166
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 55
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 115
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 70
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 87
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 7: System.Reflection.Primitives => 0x7c6829760de3975 => 136
	i64 648449422406355874, ; 8: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 40
	i64 750875890346172408, ; 9: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 155
	i64 799765834175365804, ; 10: System.ComponentModel.dll => 0xb1956c9f18442ac => 103
	i64 849051935479314978, ; 11: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 12: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 62
	i64 872800313462103108, ; 13: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 75
	i64 1010599046655515943, ; 14: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 136
	i64 1120440138749646132, ; 15: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 91
	i64 1121665720830085036, ; 16: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 17: System.Drawing.dll => 0x119be62002c19ebb => 110
	i64 1301485588176585670, ; 18: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 61
	i64 1369545283391376210, ; 19: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 83
	i64 1404195534211153682, ; 20: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 114
	i64 1476839205573959279, ; 21: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 121
	i64 1486715745332614827, ; 22: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 52
	i64 1513467482682125403, ; 23: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 165
	i64 1518315023656898250, ; 24: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 63
	i64 1537168428375924959, ; 25: System.Threading.Thread.dll => 0x15551e8a954ae0df => 155
	i64 1556147632182429976, ; 26: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 27: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 68
	i64 1628611045998245443, ; 28: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 80
	i64 1731380447121279447, ; 29: Newtonsoft.Json => 0x18071957e9b889d7 => 58
	i64 1743969030606105336, ; 30: System.Memory.dll => 0x1833d297e88f2af8 => 117
	i64 1767386781656293639, ; 31: System.Private.Uri.dll => 0x188704e9f5582107 => 131
	i64 1795316252682057001, ; 32: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 67
	i64 1825687700144851180, ; 33: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 137
	i64 1835311033149317475, ; 34: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 35: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 87
	i64 1875417405349196092, ; 36: System.Drawing.Primitives => 0x1a06d2319b6c713c => 109
	i64 1881198190668717030, ; 37: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 38: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 53
	i64 1959996714666907089, ; 39: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 40: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 79
	i64 1983698669889758782, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 42: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2102659300918482391, ; 43: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 109
	i64 2133195048986300728, ; 44: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 58
	i64 2262844636196693701, ; 45: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 75
	i64 2287834202362508563, ; 46: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 96
	i64 2302323944321350744, ; 47: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 48: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 78
	i64 2470498323731680442, ; 49: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 71
	i64 2497223385847772520, ; 50: System.Runtime => 0x22a7eb7046413568 => 145
	i64 2547086958574651984, ; 51: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 66
	i64 2602673633151553063, ; 52: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2632269733008246987, ; 53: System.Net.NameResolution => 0x2487b36034f808cb => 119
	i64 2656907746661064104, ; 54: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 42
	i64 2662981627730767622, ; 55: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2745381263179111323, ; 56: EPPlus.dll => 0x26198db694cddb9b => 36
	i64 2777234600790290333, ; 57: EPPlus.Interfaces => 0x268ab827ae076f9d => 37
	i64 2815524396660695947, ; 58: System.Security.AccessControl => 0x2712c0857f68238b => 146
	i64 2895129759130297543, ; 59: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 60: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 91
	i64 3106852385031680087, ; 61: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 144
	i64 3289520064315143713, ; 62: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 77
	i64 3311221304742556517, ; 63: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 128
	i64 3325875462027654285, ; 64: System.Runtime.Numerics => 0x2e27e21c8958b48d => 140
	i64 3328853167529574890, ; 65: System.Net.Sockets.dll => 0x2e327651a008c1ea => 125
	i64 3344514922410554693, ; 66: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 93
	i64 3396143930648122816, ; 67: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 44
	i64 3429672777697402584, ; 68: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 55
	i64 3494946837667399002, ; 69: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 38
	i64 3522470458906976663, ; 70: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 88
	i64 3551103847008531295, ; 71: System.Private.CoreLib.dll => 0x31480e226177735f => 163
	i64 3567343442040498961, ; 72: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 73: System.Runtime.dll => 0x319037675df7e556 => 145
	i64 3638003163729360188, ; 74: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 39
	i64 3647754201059316852, ; 75: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 159
	i64 3655542548057982301, ; 76: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 38
	i64 3716579019761409177, ; 77: netstandard.dll => 0x3393f0ed5c8c5c99 => 162
	i64 3727469159507183293, ; 78: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 86
	i64 3869221888984012293, ; 79: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 47
	i64 3889433610606858880, ; 80: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 45
	i64 3890352374528606784, ; 81: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 53
	i64 3933965368022646939, ; 82: System.Net.Requests => 0x369840a8bfadc09b => 122
	i64 3966267475168208030, ; 83: System.Memory => 0x370b03412596249e => 117
	i64 4009997192427317104, ; 84: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 143
	i64 4073500526318903918, ; 85: System.Private.Xml.dll => 0x3887fb25779ae26e => 133
	i64 4120493066591692148, ; 86: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 87: System.ComponentModel => 0x39a7562737acb67e => 103
	i64 4167269041631776580, ; 88: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 156
	i64 4168469861834746866, ; 89: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 147
	i64 4187479170553454871, ; 90: System.Linq.Expressions => 0x3a1cea1e912fa117 => 115
	i64 4205801962323029395, ; 91: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 102
	i64 4337444564132831293, ; 92: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 60
	i64 4356591372459378815, ; 93: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4672453897036726049, ; 94: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 114
	i64 4679594760078841447, ; 95: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4743821336939966868, ; 96: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 100
	i64 4794310189461587505, ; 97: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 66
	i64 4795410492532947900, ; 98: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 88
	i64 4809057822547766521, ; 99: System.Drawing => 0x42bd349c3145ecf9 => 110
	i64 4814660307502931973, ; 100: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 119
	i64 4853321196694829351, ; 101: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 139
	i64 5103417709280584325, ; 102: System.Collections.Specialized => 0x46d2fb5e161b6285 => 98
	i64 5182934613077526976, ; 103: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 98
	i64 5278787618751394462, ; 104: System.Net.WebClient.dll => 0x4942055efc68329e => 126
	i64 5290786973231294105, ; 105: System.Runtime.Loader => 0x496ca6b869b72699 => 139
	i64 5423376490970181369, ; 106: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 137
	i64 5471532531798518949, ; 107: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 108: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 109: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 112
	i64 5573260873512690141, ; 110: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 148
	i64 5692067934154308417, ; 111: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 90
	i64 5979151488806146654, ; 112: System.Formats.Asn1 => 0x52fa3699a489d25e => 111
	i64 6068057819846744445, ; 113: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6182294023748435638, ; 114: AsyncAwaitBestPractices => 0x55cbeba8ce8bbeb6 => 35
	i64 6183170893902868313, ; 115: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 60
	i64 6200764641006662125, ; 116: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 117: System.Text.Json.dll => 0x565a67a0ffe264a7 => 152
	i64 6278736998281604212, ; 118: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 130
	i64 6284145129771520194, ; 119: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 134
	i64 6357457916754632952, ; 120: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 78
	i64 6478287442656530074, ; 122: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 123: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 74
	i64 6560151584539558821, ; 124: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 49
	i64 6617685658146568858, ; 125: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 150
	i64 6743165466166707109, ; 126: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 127: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 128: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 107
	i64 6814185388980153342, ; 129: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 160
	i64 6876862101832370452, ; 130: System.Xml.Linq => 0x5f6f85a57d108914 => 158
	i64 6894844156784520562, ; 131: System.Numerics.Vectors => 0x5faf683aead1ad72 => 128
	i64 7060448593242414269, ; 132: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 65
	i64 7083547580668757502, ; 133: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 132
	i64 7105430439328552570, ; 134: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 64
	i64 7220009545223068405, ; 135: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 136: System.Linq => 0x64e71ccf51a90a5a => 116
	i64 7377312882064240630, ; 137: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 102
	i64 7488575175965059935, ; 138: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 158
	i64 7489048572193775167, ; 139: System.ObjectModel => 0x67ee71ff6b419e3f => 129
	i64 7654504624184590948, ; 140: System.Net.Http => 0x6a3a4366801b8264 => 118
	i64 7708790323521193081, ; 141: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 142: System.Private.CoreLib => 0x6b0ff375198b9c17 => 163
	i64 7735176074855944702, ; 143: Microsoft.CSharp => 0x6b58dda848e391fe => 95
	i64 7735352534559001595, ; 144: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 92
	i64 7836164640616011524, ; 145: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 68
	i64 8064050204834738623, ; 146: System.Collections.dll => 0x6fe942efa61731bf => 99
	i64 8083354569033831015, ; 147: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 77
	i64 8087206902342787202, ; 148: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 106
	i64 8167236081217502503, ; 149: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 164
	i64 8185542183669246576, ; 150: System.Collections => 0x7198e33f4794aa70 => 99
	i64 8246048515196606205, ; 151: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 56
	i64 8368701292315763008, ; 152: System.Security.Cryptography => 0x7423997c6fd56140 => 148
	i64 8400357532724379117, ; 153: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 85
	i64 8410671156615598628, ; 154: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 135
	i64 8563666267364444763, ; 155: System.Private.Uri => 0x76d841191140ca5b => 131
	i64 8594639773772191234, ; 156: EPPlus.Interfaces.dll => 0x77464b5680229602 => 37
	i64 8614108721271900878, ; 157: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 158: Java.Interop => 0x77b654e585b55834 => 164
	i64 8638972117149407195, ; 159: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 95
	i64 8639588376636138208, ; 160: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 84
	i64 8677882282824630478, ; 161: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 162: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 106
	i64 8941376889969657626, ; 163: System.Xml.XDocument => 0x7c1626e87187471a => 160
	i64 8954753533646919997, ; 164: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 142
	i64 9045785047181495996, ; 165: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 166: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 90
	i64 9324707631942237306, ; 167: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 67
	i64 9650158550865574924, ; 168: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 41
	i64 9659729154652888475, ; 169: System.Text.RegularExpressions => 0x860e407c9991dd9b => 153
	i64 9678050649315576968, ; 170: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 71
	i64 9702891218465930390, ; 171: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 97
	i64 9808709177481450983, ; 172: Mono.Android.dll => 0x881f890734e555e7 => 166
	i64 9956195530459977388, ; 173: Microsoft.Maui => 0x8a2b8315b36616ac => 54
	i64 9991543690424095600, ; 174: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 175: System.Net.Http.dll => 0x8b50e941206af13b => 118
	i64 10051358222726253779, ; 176: System.Private.Xml => 0x8b7d990c97ccccd3 => 133
	i64 10092835686693276772, ; 177: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 52
	i64 10143853363526200146, ; 178: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 179: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 74
	i64 10236703004850800690, ; 180: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 124
	i64 10245369515835430794, ; 181: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 135
	i64 10364469296367737616, ; 182: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 134
	i64 10406448008575299332, ; 183: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 93
	i64 10430153318873392755, ; 184: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 72
	i64 10506226065143327199, ; 185: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10546663366131771576, ; 186: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 142
	i64 10785150219063592792, ; 187: System.Net.Primitives => 0x95ac8cfb68830758 => 121
	i64 10964653383833615866, ; 188: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 108
	i64 11002576679268595294, ; 189: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 48
	i64 11009005086950030778, ; 190: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 54
	i64 11103970607964515343, ; 191: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 192: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 89
	i64 11220793807500858938, ; 193: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 194: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 49
	i64 11340910727871153756, ; 195: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 73
	i64 11409786420476352929, ; 196: job number check.dll => 0x9e57b44c3b9199a1 => 94
	i64 11485890710487134646, ; 197: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 138
	i64 11518296021396496455, ; 198: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 199: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 89
	i64 11530571088791430846, ; 200: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 47
	i64 11597940890313164233, ; 201: netstandard => 0xa0f429ca8d1805c9 => 162
	i64 11705530742807338875, ; 202: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11739066727115742305, ; 203: SQLite-net.dll => 0xa2e98afdf8575c61 => 59
	i64 11806260347154423189, ; 204: SQLite-net => 0xa3d8433bc5eb5d95 => 59
	i64 11921434729483622790, ; 205: Mopups.dll => 0xa57171b957e05986 => 57
	i64 12040886584167504988, ; 206: System.Net.ServicePoint => 0xa719d28d8e121c5c => 124
	i64 12048689113179125827, ; 207: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 45
	i64 12058074296353848905, ; 208: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 46
	i64 12145679461940342714, ; 209: System.Text.Json => 0xa88e1f1ebcb62fba => 152
	i64 12201331334810686224, ; 210: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 143
	i64 12279246230491828964, ; 211: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 63
	i64 12321291134648533416, ; 212: Mopups => 0xaafe050186e541a8 => 57
	i64 12451044538927396471, ; 213: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 76
	i64 12466513435562512481, ; 214: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 81
	i64 12475113361194491050, ; 215: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 216: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 107
	i64 12538491095302438457, ; 217: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 69
	i64 12550732019250633519, ; 218: System.IO.Compression => 0xae2d28465e8e1b2f => 113
	i64 12681088699309157496, ; 219: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 220: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 70
	i64 12708922737231849740, ; 221: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 151
	i64 12717050818822477433, ; 222: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 144
	i64 12823819093633476069, ; 223: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 224: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 50
	i64 12859557719246324186, ; 225: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 127
	i64 13068258254871114833, ; 226: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 141
	i64 13221551921002590604, ; 227: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 228: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 229: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 165
	i64 13381594904270902445, ; 230: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13431476299110033919, ; 231: System.Net.WebClient => 0xba663087f18829ff => 126
	i64 13463706743370286408, ; 232: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 130
	i64 13465488254036897740, ; 233: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 92
	i64 13467053111158216594, ; 234: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 235: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 236: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13550417756503177631, ; 237: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 44
	i64 13572454107664307259, ; 238: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 86
	i64 13710614125866346983, ; 239: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 146
	i64 13717397318615465333, ; 240: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 101
	i64 13755568601956062840, ; 241: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 242: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 243: System.Console.dll => 0xc0a5f3cade5c6774 => 104
	i64 13959074834287824816, ; 244: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 76
	i64 14100563506285742564, ; 245: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 246: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 69
	i64 14125464355221830302, ; 247: System.Threading.dll => 0xc407bafdbc707a9e => 157
	i64 14254574811015963973, ; 248: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 151
	i64 14390169238844270433, ; 249: AsyncAwaitBestPractices.dll => 0xc7b426ae2b10e761 => 35
	i64 14461014870687870182, ; 250: System.Net.Requests.dll => 0xc8afd8683afdece6 => 122
	i64 14464374589798375073, ; 251: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 252: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14622043554576106986, ; 253: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 141
	i64 14669215534098758659, ; 254: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 42
	i64 14705122255218365489, ; 255: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 256: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14832630590065248058, ; 257: System.Security.Claims => 0xcdd816ef5d6e873a => 147
	i64 14852515768018889994, ; 258: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 73
	i64 14860392635077829057, ; 259: EPPlus => 0xce3ab85e2ca521c1 => 36
	i64 14892012299694389861, ; 260: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 261: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14912225920358050525, ; 262: System.Security.Principal.Windows => 0xcef2de7759506add => 149
	i64 14935719434541007538, ; 263: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 150
	i64 14954917835170835695, ; 264: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 43
	i64 14984936317414011727, ; 265: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 127
	i64 14987728460634540364, ; 266: System.IO.Compression.dll => 0xcfff1ba06622494c => 113
	i64 15015154896917945444, ; 267: System.Net.Security.dll => 0xd0608bd33642dc64 => 123
	i64 15076659072870671916, ; 268: System.ObjectModel.dll => 0xd13b0d8c1620662c => 129
	i64 15111608613780139878, ; 269: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 270: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 112
	i64 15133485256822086103, ; 271: System.Linq.dll => 0xd204f0a9127dd9d7 => 116
	i64 15227001540531775957, ; 272: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 39
	i64 15239230410363279762, ; 273: job number check => 0xd37c9f513c089992 => 94
	i64 15370334346939861994, ; 274: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 72
	i64 15391712275433856905, ; 275: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 43
	i64 15527772828719725935, ; 276: System.Console => 0xd77dbb1e38cd3d6f => 104
	i64 15536481058354060254, ; 277: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15557562860424774966, ; 278: System.Net.Sockets => 0xd7e790fe7a6dc536 => 125
	i64 15582737692548360875, ; 279: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 80
	i64 15609085926864131306, ; 280: System.dll => 0xd89e9cf3334914ea => 161
	i64 15661133872274321916, ; 281: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 159
	i64 15664356999916475676, ; 282: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 283: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 284: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15827202283623377193, ; 285: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 41
	i64 15847085070278954535, ; 286: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 154
	i64 16018552496348375205, ; 287: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 120
	i64 16154507427712707110, ; 288: System => 0xe03056ea4e39aa26 => 161
	i64 16219561732052121626, ; 289: System.Net.Security => 0xe1177575db7c781a => 123
	i64 16288847719894691167, ; 290: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 291: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 48
	i64 16337011941688632206, ; 292: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 149
	i64 16454459195343277943, ; 293: System.Net.NetworkInformation => 0xe459fb756d988f77 => 120
	i64 16649148416072044166, ; 294: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 56
	i64 16677317093839702854, ; 295: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 85
	i64 16755018182064898362, ; 296: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 61
	i64 16856067890322379635, ; 297: System.Data.Common.dll => 0xe9ecc87060889373 => 105
	i64 16890310621557459193, ; 298: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 153
	i64 16942731696432749159, ; 299: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 300: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 83
	i64 17008137082415910100, ; 301: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 97
	i64 17031351772568316411, ; 302: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 82
	i64 17047433665992082296, ; 303: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 40
	i64 17062143951396181894, ; 304: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 101
	i64 17089008752050867324, ; 305: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17118171214553292978, ; 306: System.Threading.Channels => 0xed8ff6060fc420b2 => 154
	i64 17187273293601214786, ; 307: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 100
	i64 17205988430934219272, ; 308: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 46
	i64 17230721278011714856, ; 309: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 132
	i64 17260702271250283638, ; 310: System.Data.Common => 0xef8a5543bba6bc76 => 105
	i64 17333249706306540043, ; 311: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 108
	i64 17342750010158924305, ; 312: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 313: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 314: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17608862831326185980, ; 315: Microsoft.IO.RecyclableMemoryStream.dll => 0xf45f3f7307c6c9fc => 51
	i64 17623389608345532001, ; 316: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 317: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 318: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 81
	i64 17710060891934109755, ; 319: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 79
	i64 17712670374920797664, ; 320: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 138
	i64 17777860260071588075, ; 321: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 140
	i64 17958341848870185232, ; 322: Microsoft.IO.RecyclableMemoryStream => 0xf938d8c3a0f06910 => 51
	i64 18025913125965088385, ; 323: System.Threading => 0xfa28e87b91334681 => 157
	i64 18099568558057551825, ; 324: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 325: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 82
	i64 18146411883821974900, ; 326: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 111
	i64 18203743254473369877, ; 327: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 64
	i64 18225059387460068507, ; 328: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 156
	i64 18245806341561545090, ; 329: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 96
	i64 18305135509493619199, ; 330: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 84
	i64 18324163916253801303, ; 331: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18370042311372477656, ; 332: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 62
	i64 18428404840311395189 ; 333: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 65
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [334 x i32] [
	i32 50, ; 0
	i32 166, ; 1
	i32 55, ; 2
	i32 115, ; 3
	i32 70, ; 4
	i32 87, ; 5
	i32 7, ; 6
	i32 136, ; 7
	i32 40, ; 8
	i32 155, ; 9
	i32 103, ; 10
	i32 10, ; 11
	i32 62, ; 12
	i32 75, ; 13
	i32 136, ; 14
	i32 91, ; 15
	i32 18, ; 16
	i32 110, ; 17
	i32 61, ; 18
	i32 83, ; 19
	i32 114, ; 20
	i32 121, ; 21
	i32 52, ; 22
	i32 165, ; 23
	i32 63, ; 24
	i32 155, ; 25
	i32 16, ; 26
	i32 68, ; 27
	i32 80, ; 28
	i32 58, ; 29
	i32 117, ; 30
	i32 131, ; 31
	i32 67, ; 32
	i32 137, ; 33
	i32 6, ; 34
	i32 87, ; 35
	i32 109, ; 36
	i32 28, ; 37
	i32 53, ; 38
	i32 28, ; 39
	i32 79, ; 40
	i32 2, ; 41
	i32 20, ; 42
	i32 109, ; 43
	i32 58, ; 44
	i32 75, ; 45
	i32 96, ; 46
	i32 24, ; 47
	i32 78, ; 48
	i32 71, ; 49
	i32 145, ; 50
	i32 66, ; 51
	i32 27, ; 52
	i32 119, ; 53
	i32 42, ; 54
	i32 2, ; 55
	i32 36, ; 56
	i32 37, ; 57
	i32 146, ; 58
	i32 7, ; 59
	i32 91, ; 60
	i32 144, ; 61
	i32 77, ; 62
	i32 128, ; 63
	i32 140, ; 64
	i32 125, ; 65
	i32 93, ; 66
	i32 44, ; 67
	i32 55, ; 68
	i32 38, ; 69
	i32 88, ; 70
	i32 163, ; 71
	i32 22, ; 72
	i32 145, ; 73
	i32 39, ; 74
	i32 159, ; 75
	i32 38, ; 76
	i32 162, ; 77
	i32 86, ; 78
	i32 47, ; 79
	i32 45, ; 80
	i32 53, ; 81
	i32 122, ; 82
	i32 117, ; 83
	i32 143, ; 84
	i32 133, ; 85
	i32 33, ; 86
	i32 103, ; 87
	i32 156, ; 88
	i32 147, ; 89
	i32 115, ; 90
	i32 102, ; 91
	i32 60, ; 92
	i32 30, ; 93
	i32 114, ; 94
	i32 0, ; 95
	i32 100, ; 96
	i32 66, ; 97
	i32 88, ; 98
	i32 110, ; 99
	i32 119, ; 100
	i32 139, ; 101
	i32 98, ; 102
	i32 98, ; 103
	i32 126, ; 104
	i32 139, ; 105
	i32 137, ; 106
	i32 26, ; 107
	i32 29, ; 108
	i32 112, ; 109
	i32 148, ; 110
	i32 90, ; 111
	i32 111, ; 112
	i32 23, ; 113
	i32 35, ; 114
	i32 60, ; 115
	i32 23, ; 116
	i32 152, ; 117
	i32 130, ; 118
	i32 134, ; 119
	i32 34, ; 120
	i32 78, ; 121
	i32 11, ; 122
	i32 74, ; 123
	i32 49, ; 124
	i32 150, ; 125
	i32 19, ; 126
	i32 22, ; 127
	i32 107, ; 128
	i32 160, ; 129
	i32 158, ; 130
	i32 128, ; 131
	i32 65, ; 132
	i32 132, ; 133
	i32 64, ; 134
	i32 26, ; 135
	i32 116, ; 136
	i32 102, ; 137
	i32 158, ; 138
	i32 129, ; 139
	i32 118, ; 140
	i32 17, ; 141
	i32 163, ; 142
	i32 95, ; 143
	i32 92, ; 144
	i32 68, ; 145
	i32 99, ; 146
	i32 77, ; 147
	i32 106, ; 148
	i32 164, ; 149
	i32 99, ; 150
	i32 56, ; 151
	i32 148, ; 152
	i32 85, ; 153
	i32 135, ; 154
	i32 131, ; 155
	i32 37, ; 156
	i32 21, ; 157
	i32 164, ; 158
	i32 95, ; 159
	i32 84, ; 160
	i32 21, ; 161
	i32 106, ; 162
	i32 160, ; 163
	i32 142, ; 164
	i32 31, ; 165
	i32 90, ; 166
	i32 67, ; 167
	i32 41, ; 168
	i32 153, ; 169
	i32 71, ; 170
	i32 97, ; 171
	i32 166, ; 172
	i32 54, ; 173
	i32 6, ; 174
	i32 118, ; 175
	i32 133, ; 176
	i32 52, ; 177
	i32 3, ; 178
	i32 74, ; 179
	i32 124, ; 180
	i32 135, ; 181
	i32 134, ; 182
	i32 93, ; 183
	i32 72, ; 184
	i32 1, ; 185
	i32 142, ; 186
	i32 121, ; 187
	i32 108, ; 188
	i32 48, ; 189
	i32 54, ; 190
	i32 12, ; 191
	i32 89, ; 192
	i32 15, ; 193
	i32 49, ; 194
	i32 73, ; 195
	i32 94, ; 196
	i32 138, ; 197
	i32 13, ; 198
	i32 89, ; 199
	i32 47, ; 200
	i32 162, ; 201
	i32 9, ; 202
	i32 59, ; 203
	i32 59, ; 204
	i32 57, ; 205
	i32 124, ; 206
	i32 45, ; 207
	i32 46, ; 208
	i32 152, ; 209
	i32 143, ; 210
	i32 63, ; 211
	i32 57, ; 212
	i32 76, ; 213
	i32 81, ; 214
	i32 34, ; 215
	i32 107, ; 216
	i32 69, ; 217
	i32 113, ; 218
	i32 14, ; 219
	i32 70, ; 220
	i32 151, ; 221
	i32 144, ; 222
	i32 27, ; 223
	i32 50, ; 224
	i32 127, ; 225
	i32 141, ; 226
	i32 1, ; 227
	i32 15, ; 228
	i32 165, ; 229
	i32 9, ; 230
	i32 126, ; 231
	i32 130, ; 232
	i32 92, ; 233
	i32 29, ; 234
	i32 30, ; 235
	i32 13, ; 236
	i32 44, ; 237
	i32 86, ; 238
	i32 146, ; 239
	i32 101, ; 240
	i32 8, ; 241
	i32 11, ; 242
	i32 104, ; 243
	i32 76, ; 244
	i32 3, ; 245
	i32 69, ; 246
	i32 157, ; 247
	i32 151, ; 248
	i32 35, ; 249
	i32 122, ; 250
	i32 24, ; 251
	i32 5, ; 252
	i32 141, ; 253
	i32 42, ; 254
	i32 16, ; 255
	i32 32, ; 256
	i32 147, ; 257
	i32 73, ; 258
	i32 36, ; 259
	i32 33, ; 260
	i32 0, ; 261
	i32 149, ; 262
	i32 150, ; 263
	i32 43, ; 264
	i32 127, ; 265
	i32 113, ; 266
	i32 123, ; 267
	i32 129, ; 268
	i32 17, ; 269
	i32 112, ; 270
	i32 116, ; 271
	i32 39, ; 272
	i32 94, ; 273
	i32 72, ; 274
	i32 43, ; 275
	i32 104, ; 276
	i32 4, ; 277
	i32 125, ; 278
	i32 80, ; 279
	i32 161, ; 280
	i32 159, ; 281
	i32 4, ; 282
	i32 12, ; 283
	i32 5, ; 284
	i32 41, ; 285
	i32 154, ; 286
	i32 120, ; 287
	i32 161, ; 288
	i32 123, ; 289
	i32 18, ; 290
	i32 48, ; 291
	i32 149, ; 292
	i32 120, ; 293
	i32 56, ; 294
	i32 85, ; 295
	i32 61, ; 296
	i32 105, ; 297
	i32 153, ; 298
	i32 25, ; 299
	i32 83, ; 300
	i32 97, ; 301
	i32 82, ; 302
	i32 40, ; 303
	i32 101, ; 304
	i32 32, ; 305
	i32 154, ; 306
	i32 100, ; 307
	i32 46, ; 308
	i32 132, ; 309
	i32 105, ; 310
	i32 108, ; 311
	i32 10, ; 312
	i32 25, ; 313
	i32 8, ; 314
	i32 51, ; 315
	i32 20, ; 316
	i32 31, ; 317
	i32 81, ; 318
	i32 79, ; 319
	i32 138, ; 320
	i32 140, ; 321
	i32 51, ; 322
	i32 157, ; 323
	i32 19, ; 324
	i32 82, ; 325
	i32 111, ; 326
	i32 64, ; 327
	i32 156, ; 328
	i32 96, ; 329
	i32 84, ; 330
	i32 14, ; 331
	i32 62, ; 332
	i32 65 ; 333
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
