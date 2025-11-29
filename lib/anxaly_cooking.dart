import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

// --- 1. CONFIGURATION ---
const appConfig = {
  'NAME': "Anxaly Cooking",
  'VERSION': "v3.58 Architect",
  'ENGINE': "Gemini 3 Pro",
  'AUTHOR': "Senior AI Architect (50 YOE)",
};

const charHandles = "@anxalyphengde.li @anxalyphengdy.corgi";

// --- 2. FIXED DNA ---
const dnaBody = {
  'HOST_FACE':
      "Asian female, 20yo, porcelain skin, muted pink lips, jet-black sleek low bun hair",
  'HOST_ACCESSORIES':
      "STRICTLY NO JEWELRY. NO EARRINGS (bare ears), NO NECKLACE, NO WATCHES.",
  'HOST_HANDS': "manicured hands (STRICTLY NO RINGS)",
  'DOG': "Fluffy Corgi dog",
  'CAMERA': "POV vlog-style, iPhone 15 Pro Max, 8k, photorealistic",
};

// --- 3. CINEMATIC DESCRIPTORS ---
const cinematicVibes = {
  'LIGHTING':
      "Natural cinematic lighting, volumetric rays, soft shadows, high dynamic range.",
  'CAMERA_WORK':
      "Handheld organic movement, slight camera shake for realism, depth of field with bokeh background.",
};

// --- 5. LOGIC ENGINES ---
final List<Map<String, dynamic>> culinaryDb = [
  {
    'triggers': ["bun bo", "bún bò", "hue", "huế"],
    'culture': "Vietnamese Traditional",
    'market_default': "bustling traditional Vietnamese wet market",
    'outfit_desc': "solid white crop top",
    'bottom_desc': "loose beige linen pants",
    'apron_desc': "NO APRON",
    'vibe': "Rustic, authentic, tropical sunlight",
    'ingredients': [
      "Lemongrass stalks",
      "Beef shank",
      "Hue Shrimp Paste",
      "Thick Rice Vermicelli",
      "Spicy Chili Oil",
    ],
    'seasoning': ["Fish Sauce", "Rock Sugar", "MSG", "Chili Oil"],
    'method': "SOUP",
  },
  {
    'triggers': ["tom yum", "tomyum", "tomyung", "thai", "thái"],
    'culture': "Thai Spicy",
    'market_default': "Thai floating market or Big C",
    'outfit_desc': "solid orange tank top",
    'bottom_desc': "solid light blue denim shorts",
    'apron_desc': "brown waist apron",
    'vibe': "Colorful, zesty, energetic",
    'ingredients': [
      "Galangal root",
      "River prawns",
      "Kaffir lime leaves",
      "Thai chilies",
      "Coconut milk",
    ],
    'seasoning': [
      "Fish Sauce (Nam Pla)",
      "Palm Sugar",
      "Thai Chili Paste (Nam Prik Pao)",
      "Fresh Lime Juice",
      "MSG",
    ],
    'method': "SOUP",
  },
];

Color extractColor(String text) {
  final colors = {
    'white': Colors.white,
    'black': const Color(0xFF171717),
    'grey': Colors.grey,
    'red': Colors.red,
    'blue': Colors.blue,
    'green': Colors.green,
    'yellow': Colors.yellow,
    'orange': Colors.orange,
    'purple': Colors.purple,
    'pink': Colors.pink,
    'beige': const Color(0xFFD6D3D1),
    'brown': const Color(0xFF78350F),
    'navy': const Color(0xFF1E3A8A),
    'indigo': const Color(0xFF4338CA),
  };

  final words = text.toLowerCase().split(RegExp(r'[\s,]+'));
  for (var w in words) {
    if (colors.containsKey(w)) return colors[w]!;
  }
  return const Color(0xFF999999);
}

Map<String, dynamic> analyzeWithGemini3Pro(String input) {
  final cleanInput = input.toLowerCase().replaceAll(
    RegExp(r'[.,/#!$%^&*;:{}=\-_`~()]'),
    "",
  );
  String detectedMethod = "SEAR";
  if (cleanInput.contains("soup") ||
      cleanInput.contains("pho") ||
      cleanInput.contains("curry") ||
      cleanInput.contains("boil") ||
      cleanInput.contains("yum") ||
      cleanInput.contains("bún")) {
    detectedMethod = "SOUP";
  }

  Map<String, dynamic> result = {
    'culture': "Home Cooking",
    'market_default': "Local supermarket",
    'outfit_desc': "solid white t-shirt",
    'bottom_desc': "grey sweatpants",
    'apron_desc': "beige apron",
    'vibe': "Cozy kitchen",
    'ingredients': ["Fresh seasonal vegetables", "Meat", "Spices", "Sauce"],
    'seasoning': ["Salt", "Pepper", "Sugar", "Soy Sauce"],
    'method': detectedMethod,
    'dog_wear': "Solid Red Bandana",
  };

  for (var entry in culinaryDb) {
    if ((entry['triggers'] as List).any((t) => cleanInput.contains(t))) {
      result = {...result, ...entry};
      break;
    }
  }
  return result;
}

String generateClonePrompt(
  String top,
  String bottom,
  String apron,
  bool isCustom,
) {
  final source = isCustom ? "custom uploaded photo" : "generated vector asset";
  return "(ASSET CLONE PROMPT) Analyze the $source. Character is wearing: $top, $bottom, and $apron. IMPORTANT: All clothing items are SOLID COLOR, NO PATTERNS. Replicate this exact outfit texture, color, and fit. High fidelity, 8k.";
}

String getAuthenticSeasoningAction(List<String> seasoningList) {
  if (seasoningList.isEmpty) return "seasoning with salt and pepper";

  final actions = seasoningList.map((item) {
    final lower = item.toLowerCase();
    if (lower.contains("fish sauce") || lower.contains("soy sauce")) {
      return "pouring a tablespoon of $item for umami";
    } else if (lower.contains("palm sugar") ||
        lower.contains("sugar") ||
        lower.contains("rock sugar")) {
      return "dissolving a piece of $item to balance the heat";
    } else if (lower.contains("lime")) {
      return "squeezing fresh $item for acidity";
    } else if (lower.contains("paste")) {
      return "stirring in a spoonful of $item which turns the broth vibrant red";
    } else if (lower.contains("msg") || lower.contains("salt")) {
      return "sprinkling a pinch of $item for depth";
    } else {
      return "adding $item";
    }
  }).toList();

  return "MASTER SEASONING: She balances the flavors by ${actions.join(", then ")}. She tastes the complex broth and nods.";
}

Map<String, dynamic> generateScript(
  String dishName,
  Map<String, dynamic> lockedStyle,
  double minutes,
  int sceneDuration,
  String customLocation,
  dynamic customIngredients,
  bool customImageState,
  bool isRandomOutfit,
) {
  final totalSeconds = minutes * 60;
  final totalScenes = (totalSeconds / sceneDuration).ceil();

  int marketEnd, prepEnd;
  final isShortVideo = totalScenes <= 2;

  if (isShortVideo) {
    marketEnd = 1;
    prepEnd = 1;
  } else {
    marketEnd = math.max(2, (totalScenes * 0.35).floor());
    prepEnd = marketEnd + (totalScenes * 0.30).floor();
  }

  final scriptData = [];

  // OUTFIT LOGIC
  String outfitPromptSection = "";
  String visualAnchorTag = "";
  String refTypeFlag = "";

  if (isRandomOutfit) {
    outfitPromptSection = "ATTIRE: Casual daily wear fitting the environment.";
    visualAnchorTag = "";
    refTypeFlag = "";
  } else {
    String enforceSolid(String? text) {
      if (text == null || text.isEmpty) return "";
      String clean = text
          .replaceAll(
            RegExp(r'pattern|print|graphic|logo', caseSensitive: false),
            "",
          )
          .trim();
      if (!clean.toLowerCase().contains("solid")) clean = "solid plain $clean";
      return "$clean (matte fabric, no patterns)";
    }

    final top = enforceSolid(lockedStyle['outfit_desc']);
    final bot = enforceSolid(lockedStyle['bottom_desc']);
    final apronDesc = lockedStyle['apron_desc'].contains("NO APRON")
        ? "no apron"
        : enforceSolid(lockedStyle['apron_desc']);
    outfitPromptSection =
        "OUTFIT DESCRIPTION: Top: $top. Bottom: $bot. Apron: $apronDesc. NOTE: Clothing is SOLID COLOR, NO PATTERNS.";
    visualAnchorTag = customImageState
        ? "[VISUAL ANCHOR: Use Uploaded Image]"
        : "[VISUAL ANCHOR: Use Generated Flat Lay]";
    refTypeFlag = customImageState
        ? "--use_uploaded_image"
        : "--use_generated_ref";
  }

  final cleanDogWear = lockedStyle['dog_wear'] != null
      ? lockedStyle['dog_wear'].trim()
      : "";
  final companionString = cleanDogWear.isNotEmpty
      ? "COMPANION: Fluffy Corgi dog wearing [$cleanDogWear]."
      : "COMPANION: Fluffy Corgi dog.";
  final finalLocation = customLocation.isNotEmpty
      ? customLocation
      : lockedStyle['market_default'];

  List<String> cleanIngredients;
  if (customIngredients is List) {
    cleanIngredients = List<String>.from(customIngredients);
  } else {
    cleanIngredients = (customIngredients as String)
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  final ing1 = cleanIngredients.isNotEmpty
      ? cleanIngredients[0]
      : "Main Protein";
  final ing2 = cleanIngredients.length > 1 ? cleanIngredients[1] : "Aromatics";
  final ing3 = cleanIngredients.length > 2 ? cleanIngredients[2] : "Spices";

  // SEASONING LIST
  final List<String> seasoningList = List<String>.from(
    lockedStyle['seasoning'] ?? ["Salt", "Sugar", "Pepper"],
  );

  final cookingMethod = lockedStyle['method'] ?? "SEAR";

  String potState = cookingMethod == "SOUP"
      ? "pot of boiling water"
      : "hot empty pan";

  for (int i = 1; i <= totalScenes; i++) {
    String phase = "";
    String action = "";
    String location = "";
    String contextPrefix = "";

    // --- PHASE 1: MARKET ---
    if (i <= marketEnd) {
      phase = "MARKET";
      location = finalLocation;
      contextPrefix = "CONTEXT: Active Shopping.";
      if (i == 1) {
        if (marketEnd == 1) {
          action =
              "Cinematic Action Shot. Standing at $location, she is holding fresh $ing1 in one hand and pointing at $ing2 with the other. She smiles at the camera. Corgi is excited.";
        } else {
          action =
              "Cinematic intro. She walks into $location and picks up $ing1. She smells it and nods in approval.";
        }
      } else if (i == marketEnd && !isShortVideo) {
        action =
            "At checkout. The basket is full of $ing1, $ing2, and $ing3. Paying the vendor.";
      } else {
        final currentIng = cleanIngredients[(i - 1) % cleanIngredients.length];
        action =
            "Close-up POV. Hands (no rings) selecting the best $currentIng from the display. Inspecting freshness.";
      }
    }
    // --- PHASE 2: PREP ---
    else if (!isShortVideo && i <= prepEnd) {
      phase = "PREP";
      location = "Modern Kitchen";
      contextPrefix = "CONTEXT: Mise-en-place.";
      if (i == marketEnd + 1) {
        action =
            "MISE-EN-PLACE SHOT: Wide angle of kitchen island. All ingredients (${cleanIngredients.join(', ')}) are beautifully arranged in bowls.";
      } else {
        final currentIng =
            cleanIngredients[(i - marketEnd) % cleanIngredients.length];
        action =
            "Detail shot. Hands (no rings) precisely chopping $currentIng on a wooden board. Sound of knife cutting.";
      }
    }
    // --- PHASE 3: COOKING ---
    else {
      phase = "COOKING";
      location = "Kitchen Stove";

      if (isShortVideo && i == 2) {
        final seasoningAction = getAuthenticSeasoningAction(seasoningList);
        action =
            "HYBRID CHEF MONTAGE: 1. Close-up of hands chopping $ing1. 2. Match cut dropping $ing1 into the boiling pot. 3. $seasoningAction 4. Final shot: Holding the finished bowl.";
      } else {
        final cookStep = i - prepEnd;

        if (i == totalScenes) {
          contextPrefix =
              "CONTEXT: The $dishName (made from $potState) is now ready.";
          action =
              "Final Reveal. She holds the finished bowl. Steam curls up. She smiles radiantly.";
        } else {
          if (cookingMethod == "SOUP") {
            if (cookStep == 1) {
              contextPrefix = "CONTEXT: Close-up of $potState.";
              action =
                  "Step 1: She adds $ing2 (Aromatics) into the boiling water. The liquid bubbles aggressively.";
              potState = "bubbling aromatic broth with $ing2";
            } else if (cookStep == 2) {
              contextPrefix = "CONTEXT: Pot containing $potState.";
              action =
                  "Step 2: She gently lowers $ing1 into the $potState. The liquid changes color.";
              potState = "rich broth with $ing2 and cooking $ing1";
            } else if (cookStep == 3) {
              // *** AUTHENTIC SEASONING STEP ***
              contextPrefix = "CONTEXT: Pot containing $potState.";
              final seasoningAction = getAuthenticSeasoningAction(
                seasoningList,
              );
              action = "Step 3: $seasoningAction Stirring gently to dissolve.";
              potState = "fully seasoned soup with $ing1, $ing2, and spices";
            } else {
              contextPrefix = "CONTEXT: Pot containing $potState.";
              action =
                  "Simmering. The $potState is bubbling gently. She tastes the broth with a spoon.";
            }
          } else {
            // SEAR LOGIC
            if (cookStep == 1) {
              contextPrefix = "CONTEXT: Hot empty pan.";
              action =
                  "Step 1: She adds 1 TABLESPOON of oil to the hot pan. It shimmers.";
              potState = "hot oiled pan";
            } else if (cookStep == 2) {
              contextPrefix = "CONTEXT: Pan with $potState.";
              action =
                  "Step 2: She places $ing1 into the $potState. Loud sizzling sound.";
              potState = "pan with searing $ing1";
            } else if (cookStep == 3) {
              contextPrefix = "CONTEXT: Pan with $potState.";
              final seasoningAction = getAuthenticSeasoningAction(
                seasoningList,
              );
              action =
                  "Step 3: To the $potState, she adds chopped $ing2. Then, $seasoningAction. Tossing the food.";
              potState = "mix of browned $ing1 and $ing2";
            } else {
              contextPrefix = "CONTEXT: Pan with $potState.";
              action = "Finishing. Glazing the food. It looks glossy.";
            }
          }
        }
      }
    }

    final videoPrompt =
        """
$charHandles $refTypeFlag --duration ${sceneDuration}s
$visualAnchorTag
SUBJECT: ${dnaBody['HOST_FACE']}.
NO ACCESSORIES: ${dnaBody['HOST_ACCESSORIES']}
$outfitPromptSection
HANDS: ${dnaBody['HOST_HANDS']}.
$companionString

[SCENE]
LOCATION: $location.
VIBE: ${lockedStyle['vibe']}.
CINEMATICS: ${cinematicVibes['LIGHTING']} ${cinematicVibes['CAMERA_WORK']}
$contextPrefix
ACTION: $action
    """
            .trim();

    final imagePrompt =
        "YouTube Thumbnail, $dishName, $location, ${action.length > 50 ? action.substring(0, 50) : action}..., 8k";
    scriptData.add({
      'id': i,
      'phase': phase,
      'videoPrompt': videoPrompt,
      'imagePrompt': imagePrompt,
    });
  }
  return {'scriptData': scriptData, 'totalScenes': totalScenes};
}

class AnxalyCookingApp extends StatelessWidget {
  const AnxalyCookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appConfig['NAME'] as String,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1a0505),
        colorScheme: const ColorScheme.dark(
          primary: Colors.orange,
          secondary: Colors.red,
          surface: Color(0xFF2a0a0a),
        ),
      ),
      home: const AnxalyCookingHome(),
    );
  }
}

class AnxalyCookingHome extends StatefulWidget {
  const AnxalyCookingHome({super.key});

  @override
  State<AnxalyCookingHome> createState() => _AnxalyCookingHomeState();
}

class _AnxalyCookingHomeState extends State<AnxalyCookingHome> {
  int step = 1;
  String dish = "";
  double minutes = 2.5;
  double sceneDuration = 8;

  String editTop = "";
  String editBottom = "";
  String editApron = "";
  String editDogWear = "";
  String editLocation = "";
  String editIngredients = "";
  String editVibe = "";
  String cookingMethod = "SEAR";

  bool isRandomOutfit = false;
  Map<String, Color> visualColors = {
    'top': Colors.white,
    'bottom': Colors.grey,
    'apron': Colors.transparent,
  };
  Map<String, dynamic>? style;
  Map<String, dynamic>? result;

  bool isProcessing = false;
  bool isAnalyzingImage = false;
  bool customImage = false; // Simulating image presence

  void startEngine() {
    if (dish.isEmpty) return;
    setState(() => isProcessing = true);

    Future.delayed(const Duration(seconds: 2), () {
      final analysis = analyzeWithGemini3Pro(dish);
      setState(() {
        editTop = analysis['outfit_desc'];
        editBottom = analysis['bottom_desc'];
        editApron = analysis['apron_desc'];
        editDogWear = analysis['dog_wear'];
        editLocation = analysis['market_default'];
        editIngredients = (analysis['ingredients'] as List).join(", ");
        editVibe = analysis['vibe'];
        cookingMethod = analysis['method'] ?? "SEAR";
        updateVisuals(
          analysis['outfit_desc'],
          analysis['bottom_desc'],
          analysis['apron_desc'],
        );
        style = analysis;
        isProcessing = false;
        step = 2;
      });
    });
  }

  void updateVisuals(String t, String b, String a) {
    setState(() {
      visualColors = {
        'top': extractColor(t),
        'bottom': extractColor(b),
        'apron': a.contains("NO APRON") ? Colors.transparent : extractColor(a),
      };
    });
  }

  void handleGenerateScript() {
    final finalStyle = {
      ...style!,
      'outfit_desc': editTop,
      'bottom_desc': editBottom,
      'apron_desc': editApron,
      'dog_wear': editDogWear,
      'market_default': editLocation,
      'vibe': editVibe,
      'method': cookingMethod,
    };
    final data = generateScript(
      dish,
      finalStyle,
      minutes,
      sceneDuration.toInt(),
      editLocation,
      editIngredients,
      customImage,
      isRandomOutfit,
    );
    setState(() {
      result = data;
      step = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1514326640560-7d063ef2aed5?q=80&w=2070&auto=format&fit=crop',
              fit: BoxFit.cover,
              color: Colors.black.withValues(alpha: 0.8),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.orange, Colors.red],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appConfig['NAME'] as String,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  _buildBadge(
                                    appConfig['ENGINE'] as String,
                                    Colors.orange,
                                  ),
                                  const SizedBox(width: 8),
                                  _buildBadge("ZERO JEWELRY", Colors.red),
                                  const SizedBox(width: 8),
                                  _buildBadge(
                                    "AUTHENTIC SEASONING",
                                    Colors.green,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (step > 1)
                        TextButton.icon(
                          onPressed: () => setState(() {
                            step = 1;
                            customImage = false;
                            isRandomOutfit = false;
                          }),
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.white70,
                          ),
                          label: const Text(
                            "RESET",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 48),

                  // STEP 1
                  if (step == 1 && !isProcessing)
                    Card(
                      color: const Color(0x99450a0a),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            const Text(
                              "Initialize Chef's Table",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 32),
                            TextField(
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "TARGET DISH",
                                hintText: "e.g. Bun Bo Hue...",
                                filled: true,
                                fillColor: Colors.white10,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onChanged: (v) => dish = v,
                              onSubmitted: (_) => startEngine(),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TOTAL VIDEO: $minutes MIN",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Slider(
                                        value: minutes,
                                        min: 0.5,
                                        max: 5.0,
                                        divisions: 9,
                                        activeColor: Colors.orange,
                                        onChanged: (v) =>
                                            setState(() => minutes = v),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SCENE LENGTH: ${sceneDuration.toInt()} SEC",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Slider(
                                        value: sceneDuration,
                                        min: 5,
                                        max: 60,
                                        divisions: 55,
                                        activeColor: Colors.yellow,
                                        onChanged: (v) =>
                                            setState(() => sceneDuration = v),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: startEngine,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Text(
                                  "LAUNCH CHEF MAESTRO",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  if (isProcessing)
                    const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(color: Colors.orange),
                          SizedBox(height: 16),
                          Text(
                            "Consulting Culinary Database...",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // STEP 2
                  if (step == 2 && style != null)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Asset Viewer
                            Expanded(
                              flex: 4,
                              child: Card(
                                color: const Color(0x66450a0a),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "ASSET VIEWER",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white54,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(
                                            color: Colors.orange.withValues(
                                              alpha: 0.2,
                                            ),
                                          ),
                                        ),
                                        child: isRandomOutfit
                                            ? const Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.auto_fix_high,
                                                      size: 64,
                                                      color: Colors.white24,
                                                    ),
                                                    Text(
                                                      "AI DECIDES OUTFIT",
                                                      style: TextStyle(
                                                        color: Colors.white54,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : CustomPaint(
                                                painter: OutfitPainter(
                                                  visualColors,
                                                ),
                                                child: Container(),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Outfit DNA
                            Expanded(
                              flex: 4,
                              child: Card(
                                color: const Color(0x66450a0a),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "OUTFIT DNA",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                            ),
                                          ),
                                          TextButton.icon(
                                            onPressed: () => setState(
                                              () => isRandomOutfit =
                                                  !isRandomOutfit,
                                            ),
                                            icon: const Icon(
                                              Icons.shuffle,
                                              size: 16,
                                            ),
                                            label: Text(
                                              isRandomOutfit
                                                  ? "AI MODE"
                                                  : "MANUAL",
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (!isRandomOutfit) ...[
                                        _buildInput(
                                          "Top",
                                          editTop,
                                          (v) => setState(() => editTop = v),
                                        ),
                                        _buildInput(
                                          "Bottom",
                                          editBottom,
                                          (v) => setState(() => editBottom = v),
                                        ),
                                        _buildInput(
                                          "Apron",
                                          editApron,
                                          (v) => setState(() => editApron = v),
                                        ),
                                      ],
                                      const Divider(color: Colors.white24),
                                      _buildInput(
                                        "Companion Wear",
                                        editDogWear,
                                        (v) => setState(() => editDogWear = v),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Context
                            Expanded(
                              flex: 4,
                              child: Card(
                                color: const Color(0x66450a0a),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "CHEF'S CONTEXT",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      _buildInput(
                                        "Location",
                                        editLocation,
                                        (v) => setState(() => editLocation = v),
                                      ),
                                      _buildInput(
                                        "Ingredients",
                                        editIngredients,
                                        (v) =>
                                            setState(() => editIngredients = v),
                                        lines: 3,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        "METHOD",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white54,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildMethodBtn(
                                              "SOUP",
                                              Icons.water_drop,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: _buildMethodBtn(
                                              "SEAR",
                                              Icons.local_fire_department,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          onPressed: handleGenerateScript,
                                          icon: const Icon(Icons.play_arrow),
                                          label: const Text("GENERATE SCRIPT"),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.black,
                                            padding: const EdgeInsets.all(16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  // STEP 3
                  if (step == 3 && result != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Card(
                        color: const Color(0x99450a0a),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "CINEMATIC PRODUCTION SCRIPT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      "${sceneDuration.toInt()}s / scene",
                                    ),
                                    backgroundColor: Colors.green.withValues(
                                      alpha: 0.2,
                                    ),
                                    labelStyle: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(height: 1),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: (result!['scriptData'] as List).length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    height: 1,
                                    color: Colors.white10,
                                  ),
                              itemBuilder: (ctx, idx) {
                                final item =
                                    (result!['scriptData'] as List)[idx];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white10,
                                    child: Text("${item['id']}"),
                                  ),
                                  title: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              item['phase'].contains('MARKET')
                                              ? Colors.blue.withValues(
                                                  alpha: 0.2,
                                                )
                                              : item['phase'].contains('PREP')
                                              ? Colors.purple.withValues(
                                                  alpha: 0.2,
                                                )
                                              : Colors.orange.withValues(
                                                  alpha: 0.2,
                                                ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          item['phase'],
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: SelectableText(
                                      item['videoPrompt'],
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.copy, size: 16),
                                    onPressed: () => Clipboard.setData(
                                      ClipboardData(text: item['videoPrompt']),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: color.withValues(alpha: 0.8),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInput(
    String label,
    String value,
    Function(String) onChanged, {
    int lines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: TextEditingController(text: value)
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: value.length),
              ),
            onChanged: onChanged,
            maxLines: lines,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor: Colors.black26,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodBtn(String method, IconData icon) {
    final isSelected = cookingMethod == method;
    return GestureDetector(
      onTap: () => setState(() => cookingMethod = method),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (method == 'SOUP' ? Colors.blue : Colors.red)
              : Colors.black26,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.white10,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected ? Colors.white : Colors.white54,
            ),
            const SizedBox(width: 4),
            Text(
              method,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OutfitPainter extends CustomPainter {
  final Map<String, Color> colors;
  OutfitPainter(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final path = Path();

    // Simple T-Shirt Shape
    paint.color = colors['top'] ?? Colors.white;
    path.moveTo(size.width * 0.3, size.height * 0.2);
    path.lineTo(size.width * 0.7, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.4);
    path.lineTo(size.width * 0.7, size.height * 0.4);
    path.lineTo(size.width * 0.7, size.height * 0.6);
    path.lineTo(size.width * 0.3, size.height * 0.6);
    path.lineTo(size.width * 0.3, size.height * 0.4);
    path.lineTo(size.width * 0.2, size.height * 0.4);
    path.close();
    canvas.drawPath(path, paint);

    // Pants
    path.reset();
    paint.color = colors['bottom'] ?? Colors.grey;
    path.moveTo(size.width * 0.35, size.height * 0.6);
    path.lineTo(size.width * 0.65, size.height * 0.6);
    path.lineTo(size.width * 0.7, size.height * 0.9);
    path.lineTo(size.width * 0.55, size.height * 0.9);
    path.lineTo(size.width * 0.5, size.height * 0.7);
    path.lineTo(size.width * 0.45, size.height * 0.9);
    path.lineTo(size.width * 0.3, size.height * 0.9);
    path.close();
    canvas.drawPath(path, paint);

    // Apron
    if (colors['apron'] != Colors.transparent) {
      path.reset();
      paint.color = colors['apron'] ?? Colors.brown;
      path.moveTo(size.width * 0.35, size.height * 0.3);
      path.lineTo(size.width * 0.65, size.height * 0.3);
      path.lineTo(size.width * 0.65, size.height * 0.8);
      path.lineTo(size.width * 0.35, size.height * 0.8);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
