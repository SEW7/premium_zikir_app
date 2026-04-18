import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const PremiumZikirApp());
}

class PremiumZikirApp extends StatelessWidget {
  const PremiumZikirApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F7F2),
        primaryColor: const Color(0xFF2E7D32),
        useMaterial3: true,
      ),
      home: const AnaSayfaPremium(),
    );
  }
}

// --- CEMİLE: METİNLER %100 ORİJİNAL ---
final List<Map<String, dynamic>> hazirZikirler = const [
  {
    'baslik': 'Salavat-ı Şerife',
    'arapca': 'اَللَّهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ',
    'hedef': 100,
    'okunus': 'Allâhumme salli alâ seyyidinâ Muhammed.',
    'anlam': "Allah'ım! Efendimiz Muhammed'e salât eyle.",
  },
  {
    'baslik': 'Necm Suresi 58. Ayet',
    'arapca': 'لَيْسَ لَهَا مِنْ دُونِ اللَّهِ كَاشِفَةٌ',
    'hedef': 70000,
    'okunus': 'Leyse lehâ min dûnillâhi kâşifeh.',
    'anlam': "O'nu Allah'tan başkası açığa çıkaramaz.",
  },
  {
    
    'baslik': 'Salat-ı Tefriciye',
    'arapca': 'اللَّهُمَّ صَلِّ صَلَاةً كَامِلَةً ❁ وَسَلِّمْ سَلَامًا تَامًّا ❁ عَلَىٰ سَيِّدِنَا مُحَمَّدٍ الَّذِي تَنْحَلُّ بِهِ الْعُقَدُ ❁ وَتَنْفَرِجُ بِهِ الْكُرَبُ ❁ وَتُقْضَىٰ بِهِ الْحَوَائِجُ ❁ وَتُنَالُ بِهِ الرَّغَائِبُ وَحُسْنُ الْخَوَاتِمِ ❁ وَيُسْتَسْقَى الْغَمَامُ بِوَجْهِهِ الْكَرِيمِ ❁ وَعَلىٰ آلِهِ وَصَحْبِهِ ❁ فِي كُلِّ لَمْحَةٍ وَنَفَسٍ بِعَدَدِ كُلِّ مَعْلُومٍ لَكَ',
    'hedef': 4444,
    'okunus': "Allâhumme salli salaten kâmileten ve sellim selamen tâmmen ala Seyyidinâ Muhammedinillezi tenhallü bihil ukadü ve tenfericu bihil-kürebü ve tukda bihil-havaicu ve tünalü bihir-reğâibü ve hüsnül-havatimi ve yustaskal ğamamu bivechihil Kerim ve ala âlihi ve sahbihi fi külli lemhatin ve nefesin bi adedi külli ma’lumin lek.",
    'anlam': "Allah’ım! Efendimiz Muhammed’e kâmil bir salât ile salât ve selâm eyle! O öyle bir zâttır ki, kendisiyle düğümler çözülür, sıkıntılar kolaylaşır, ihtiyaçlar hallolur, arzulara kavuşulur ve güzel sonuçlara ulaşılır. Kendisinin yüzü suyu hürmetine yağmur istenir. Her göz açıp kapamada ve her nefeste tarafından bilinen varlıklar sayısınca O’nun âline ve ashâbına da salât ve selâm olsun.",},
  {
    'baslik': 'Şifa Salavatı',
    'arapca': 'اللَّهُمَّ صَلِّ عَلَىٰ سَيِّدِنَا مُحَمَّدٍ طِبِّ الْقُلُوبِ وَدَوَائِهَا ❁ وَعَافِيَةِ الْأَبدَانِ وَشِفَائِهَا ❁ وَنُورِ الْأَبصَارِ وَضِيَائِهَا ❁ وَعَلَىٰ آلِهِ وَصَحْبِهِ وَسَلِّمْ ❁',
    'hedef': 2000,
    'okunus': "Allahümme salli alâ Seyyidinâ Muhammedin tıbbil kulubi ve devaiha, ve âfiyetil-ebdâni ve şifâiha, ve nûril-ebsâri ve ziyâiha, ve alâ âlihi ve sahbihi ve sellim.",
    'anlam': "Allah’ım, Efendimiz Muhammed’e salât ve selam eyle, kalplerin ilacı ve tedavisi, bedenlerin sıhhati ve şifası, basiretin nuru ve aydınlatması.",
  },
  {
    'baslik': 'Büyük Salavat',
    'arapca':' اللَّهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ عَبْدِكَ وَنَبِيِّكَ وَرَسُولِكَ النَّبِيِّ لْاُمِّيِّ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلِّمْ تَسْلِيمًا بِقَدَرِ عَظَمَةِ ذَاتِكَ، وَفِي كُلِّ وَقْتٍ وَحِينٍ',
    'hedef': 100,
    'okunus': "Allahümme salli alâ Seyyidinâ Muhammedin abdike ve nebiyyike verasuliken nebiyyil ummiyyi ve ala alihi ve sahbihi ve sellim. Tesliman bi gadari Azameti Zatike ve fi kulli Vagtin ve Hinin.",
    'anlam': "Ey Allâh! Kulun, Peygamberin ve Rasûlün olan o Nebiyy-i Ümmi Efendimiz Muhammed'e ve âli ashâbına, her an ve zaman Senin Zâtının büyüklüğü kadar salât ve selâm eyle.",
  },
  {
    'baslik': '1000 Ihlas',
    'arapca':'قُلْ هُوَ اللّٰهُ اَحَدٌۚ ❁ اَللّٰهُ الصَّمَدُۚ ❁ لَمْ يَلِدْۙ وَلَمْ يُولَدْۙ ❁ وَلَمْ يَكُنْ لَهُ كُفُوًا اَحَدٌ  b بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ',
    'hedef': 1000,
    'okunus': "Kul hüvellâhü ehad. Allâhüssamed. Lem yelid ve lem yûled. Ve lem yekün lehû küfüven ehad.",
    'anlam': "De ki: O Allah birdir. Allah sameddir. O'ndan çocuk olmamıştır. Kendisi de doğmamıştır. Hiçbir şey O'na denk ve benzer değildir.",
  },
];

class AnaSayfaPremium extends StatelessWidget {
  const AnaSayfaPremium({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zikir Halkalarım", style: GoogleFonts.lora(fontWeight: FontWeight.bold, color: const Color(0xFF2E7D32))),
        backgroundColor: Colors.transparent, centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('zikirler').orderBy('tarih', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final docs = snapshot.data!.docs;
          return GridView.builder(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.85,
            ),
            itemCount: docs.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) return _yeniOlusturKarti(context);
              var data = docs[index - 1].data() as Map<String, dynamic>;
              return _zikirKarti(context, docs[index - 1].id, data);
            },
          );
        },
      ),
    );
  }

  Widget _yeniOlusturKarti(BuildContext context) {
    return GestureDetector(
      onTap: () => _yeniZikirMenusu(context),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2E7D32).withOpacity(0.08),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFF2E7D32), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_rounded, color: Color(0xFF2E7D32), size: 40),
            const SizedBox(height: 10),
            Text("Yeni Oluştur", textAlign: TextAlign.center, style: GoogleFonts.lora(fontWeight: FontWeight.bold, fontSize: 16, color: const Color(0xFF2E7D32))),
          ],
        ),
      ),
    );
  }

  Widget _zikirKarti(BuildContext context, String docId, Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ZikirmatikSayfasi(docId: docId, data: data))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFFE5E0D5), width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(data['baslik'] ?? "Zikir", textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.lora(fontWeight: FontWeight.bold, fontSize: 15)),
              if (data['niyet'] != null && data['niyet'] != "") ...[
                const SizedBox(height: 8),
                Text(data['niyet'], textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.lora(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.blueGrey)),
              ],
              const SizedBox(height: 12),
              Text("${data['count'] ?? 0} / ${data['hedef'] ?? 0}", textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF2E7D32))),
            ],
          ),
        ),
      ),
    );
  }

  void _yeniZikirMenusu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Zikir Seçin", style: GoogleFonts.lora(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            ...hazirZikirler.map((z) => ListTile(
              leading: const Icon(Icons.auto_awesome, color: Color(0xFF2E7D32)),
              title: Text(z['baslik']),
              onTap: () { Navigator.pop(context); _duzenlemeDiyalogu(context, z, false); },
            )).toList(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit_note_rounded, color: Colors.orange),
              title: const Text("Kendin Oluştur", style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () { Navigator.pop(context); _duzenlemeDiyalogu(context, {}, true); },
            ),
          ],
        ),
      ),
    );
  }

  void _duzenlemeDiyalogu(BuildContext context, Map<String, dynamic> initialData, bool isCustom) {
    TextEditingController baslikCtrl = TextEditingController(text: initialData['baslik'] ?? "");
    TextEditingController niyetCtrl = TextEditingController(text: ""); 
    TextEditingController arapcaCtrl = TextEditingController(text: initialData['arapca'] ?? "");
    TextEditingController anlamCtrl = TextEditingController(text: initialData['anlam'] ?? "");
    TextEditingController okunusCtrl = TextEditingController(text: initialData['okunus'] ?? "");
    TextEditingController hedefCtrl = TextEditingController(text: initialData['hedef']?.toString() ?? "100");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCustom ? "Zikrini Tasarla" : initialData['baslik']),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isCustom) TextField(controller: baslikCtrl, decoration: const InputDecoration(labelText: "Zikir Başlığı")),
              TextField(
                controller: niyetCtrl, 
                decoration: const InputDecoration(labelText: "Açıklama / Niyet", hintText: "Örn: Şifa niyetine..", floatingLabelBehavior: FloatingLabelBehavior.always), 
                maxLines: 2
              ),
              if (isCustom) ...[
                TextField(controller: arapcaCtrl, decoration: const InputDecoration(labelText: "Arapça Metin"), maxLines: 2),
                TextField(controller: anlamCtrl, decoration: const InputDecoration(labelText: "Anlamı"), maxLines: 2),
                TextField(controller: okunusCtrl, decoration: const InputDecoration(labelText: "Türkçe Okunuşu"), maxLines: 2),
              ],
              TextField(controller: hedefCtrl, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], decoration: const InputDecoration(labelText: "Hedef Sayı")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("İptal")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32)),
            onPressed: () {
              FirebaseFirestore.instance.collection('zikirler').add({
                'baslik': baslikCtrl.text,
                'niyet': niyetCtrl.text,
                'arapca': arapcaCtrl.text,
                'anlam': anlamCtrl.text,
                'okunus': okunusCtrl.text,
                'hedef': int.tryParse(hedefCtrl.text) ?? 100,
                'count': 0,
                'dongu': 1,
                'kurucuId': 'sarah_admin',
                'tarih': FieldValue.serverTimestamp(),
              });
              Navigator.pop(context);
            },
            child: const Text("Başlat", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class ZikirmatikSayfasi extends StatefulWidget {
  final String docId;
  final Map<String, dynamic> data;
  const ZikirmatikSayfasi({super.key, required this.docId, required this.data});
  @override
  State<ZikirmatikSayfasi> createState() => _ZikirmatikSayfasiState();
}

class _ZikirmatikSayfasiState extends State<ZikirmatikSayfasi> {
  late int localCount;
  late int localDongu;
  bool buttonsConfirmed = false;

  @override
  void initState() {
    super.initState();
    localCount = widget.data['count'] ?? 0;
    localDongu = widget.data['dongu'] ?? 1;
  }

  void _guncelle(int miktar) {
    int hedef = widget.data['hedef'] ?? 100;
    int toplam = localCount + miktar;
    int yeniSayi = toplam % hedef;
    int ekDongu = toplam ~/ hedef;
    setState(() { localCount = yeniSayi; localDongu += ekDongu; });
    HapticFeedback.mediumImpact();
    FirebaseFirestore.instance.collection('zikirler').doc(widget.docId).update({'count': yeniSayi, 'dongu': localDongu});
  }

  Future<void> _checkAndAdd(int miktar) async {
    if (buttonsConfirmed) {
      _guncelle(miktar);
    } else {
      bool? confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Emin misiniz?"),
          content: Text("+$miktar eklemek istediğinize emin misiniz? Bir kez onay verdiğinizde tüm hızlı ekleme butonları serbest kalacaktır."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("İptal")),
            TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("Evet", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))),
          ],
        ),
      );
      if (confirm == true) {
        setState(() { buttonsConfirmed = true; });
        _guncelle(miktar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded, color: Color(0xFF2E7D32)),
            onPressed: () => Share.share("🤲 Duaya Ortak Olun\n✨ Niyet: ${widget.data['niyet'] ?? 'Genel'}\n📌 Zikir: ${widget.data['baslik']}\n🔗 https://ortaktesbih.web.app/zikir/${widget.docId}"),
          ),
          if (widget.data['kurucuId'] == "sarah_admin")
            IconButton(icon: const Icon(Icons.delete_outline_rounded, color: Colors.red), onPressed: () {
              FirebaseFirestore.instance.collection('zikirler').doc(widget.docId).delete();
              Navigator.pop(context);
            })
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 320), // Padding overflow için optimize edildi
              child: Column(
                children: [
                  Text(widget.data['baslik'] ?? "Zikir", textAlign: TextAlign.center, style: GoogleFonts.lora(fontSize: 26, fontWeight: FontWeight.bold, color: const Color(0xFF2E7D32))),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFF2E7D32).withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
                    child: Text("${localDongu}. Döngüdesiniz", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF2E7D32))),
                  ),
                  if (widget.data['niyet'] != null && widget.data['niyet'] != "") ...[
                    const SizedBox(height: 15),
                    Text(widget.data['niyet'], textAlign: TextAlign.center, style: GoogleFonts.lora(fontStyle: FontStyle.italic, color: Colors.blueGrey)),
                  ],
                  const SizedBox(height: 40),
                  if (widget.data['arapca'] != null && widget.data['arapca'] != "")
                    Text(
                      widget.data['arapca'], 
                      textAlign: TextAlign.center, 
                      textDirection: TextDirection.rtl, 
                      style: GoogleFonts.notoNaskhArabic(fontSize: 32, height: 2.3, letterSpacing: 0.5)
                    ),
                  const SizedBox(height: 30),
                  Text(widget.data['okunus'] ?? "", textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 16, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 20),
                  Text(widget.data['anlam'] ?? "", textAlign: TextAlign.center, style: GoogleFonts.lora(fontSize: 16, color: Colors.grey[800], height: 1.5)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => _guncelle(1),
                    child: Container(
                      width: 150, height: 150, // Overflow hatasını çözen kritik küçültme
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(
                          color: const Color(0xFF2E7D32).withOpacity(0.4),
                          width: 4,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$localCount", style: GoogleFonts.inter(fontSize: 45, fontWeight: FontWeight.bold, color: const Color(0xFF2E7D32))),
                            Text("Hedef: ${widget.data['hedef']}", style: GoogleFonts.inter(fontSize: 12, color: Colors.blueGrey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _hizliButonLabel("+10", 10),
                      const SizedBox(width: 30),
                      _hizliButonLabel("+100", 100),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hizliButonLabel(String label, int miktar) {
    return ElevatedButton(
      onPressed: () => _checkAndAdd(miktar),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF2E7D32).withOpacity(0.7),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), 
          side: BorderSide(color: const Color(0xFF2E7D32).withOpacity(0.2))
        ),
      ),
      child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
    );
  }
}