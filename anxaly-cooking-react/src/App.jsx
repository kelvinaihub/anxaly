/**
 * ROLE: As a Senior Full-stack AI Architect with 50 years of experience, specializing in building complex multimodal applications.
 * APP MANIFEST
 * Name: Anxaly Cooking
 * Version: v3.58 (Authentic Taste Protocol)
 * Core Engine: Gemini 3 Pro + Expanded Culinary Database + Zero Jewelry
 */

import React, { useState, useRef } from 'react';
import { ChefHat, Copy, Sparkles, Film, User, Clock, Lock, CheckCircle, RefreshCcw, MapPin, Camera, Zap, Image as ImageIcon, Utensils, Palette, Shirt, Settings, Edit3, Play, ShoppingCart, List, Upload, Scan, Eye, Ban, Shuffle, Wand2, Knife, AlertTriangle, Flame, Droplets, Scale, Soup, X } from 'lucide-react';

// --- 1. CONFIGURATION ---
const APP_CONFIG = {
    NAME: "Anxaly Cooking",
    VERSION: "v3.58 Architect",
    ENGINE: "Gemini 3 Pro",
    AUTHOR: "Senior AI Architect (50 YOE)",
};

const CHAR_HANDLES = "@anxalyphengde.li @anxalyphengdy.corgi";

// --- 2. FIXED DNA ---
const DNA_BODY = {
    HOST_FACE: "Asian female, 20yo, porcelain skin, muted pink lips, jet-black sleek low bun hair",
    HOST_ACCESSORIES: "STRICTLY NO JEWELRY. NO EARRINGS (bare ears), NO NECKLACE, NO WATCHES.",
    HOST_HANDS: "manicured hands (STRICTLY NO RINGS)",
    DOG: "Fluffy Corgi dog",
    CAMERA: "POV vlog-style, iPhone 15 Pro Max, 8k, photorealistic",
};

// --- 3. CINEMATIC DESCRIPTORS ---
const CINEMATIC_VIBES = {
    LIGHTING: "Natural cinematic lighting, volumetric rays, soft shadows, high dynamic range.",
    CAMERA_WORK: "Handheld organic movement, slight camera shake for realism, depth of field with bokeh background.",
};

// --- 4. HYBRID ASSET VIEWER ---
const DigitalWardrobe = ({ colors, styleName, isRendering, customImage, isRandomMode }) => {
    if (isRandomMode) {
        return (
            <div className="w-full aspect-square bg-red-950/40 rounded-xl shadow-inner border border-orange-200/20 relative overflow-hidden group flex flex-col items-center justify-center backdrop-blur-md">
                <div className="absolute inset-0 bg-gradient-to-br from-orange-500/10 to-red-900/20 animate-pulse"></div>
                <Wand2 size={64} className="text-orange-200/20 mb-4" />
                <div className="text-orange-100/60 font-mono text-xs uppercase tracking-widest text-center px-4">
                    Sora Autonomy<br />
                    <span className="text-[9px] text-orange-100/30">(AI decides outfit)</span>
                </div>
            </div>
        );
    }
    return (
        <div className="w-full aspect-square bg-red-950/40 rounded-xl shadow-inner border border-orange-200/20 relative overflow-hidden group backdrop-blur-md">
            <div className="absolute inset-0 bg-gradient-to-tr from-red-950/80 via-transparent to-white/5"></div>
            {isRendering ? (
                <div className="absolute inset-0 flex flex-col items-center justify-center bg-red-950/90 z-20">
                    <div className="animate-spin text-orange-400 mb-2"><Scan size={48} /></div>
                    <div className="text-orange-300 text-xs font-mono animate-pulse">EXTRACTING DNA...</div>
                </div>
            ) : customImage ? (
                <div className="relative w-full h-full">
                    <img src={customImage} alt="Custom Outfit" className="w-full h-full object-cover" />
                    <div className="absolute bottom-0 left-0 right-0 bg-red-900/90 p-2 text-center text-[10px] text-white font-mono border-t border-orange-500/50 flex items-center justify-center gap-2">
                        <Eye size={12} /> ANALYZED SOURCE
                    </div>
                </div>
            ) : (
                <svg viewBox="0 0 400 400" className="w-full h-full drop-shadow-2xl transition-all duration-700 ease-out transform group-hover:scale-105">
                    <defs>
                        <filter id="clothShadow" x="-20%" y="-20%" width="140%" height="140%">
                            <feGaussianBlur in="SourceAlpha" stdDeviation="4" />
                            <feOffset dx="2" dy="4" result="offsetblur" />
                            <feComponentTransfer><feFuncA type="linear" slope="0.3" /></feComponentTransfer>
                            <feMerge><feMergeNode /><feMergeNode in="SourceGraphic" /></feMerge>
                        </filter>
                    </defs>
                    <path d="M140,220 L260,220 L270,380 L210,380 L200,280 L190,380 L130,380 Z" fill={colors.bottom} stroke="rgba(255,255,255,0.1)" strokeWidth="1" filter="url(#clothShadow)" />
                    <path d="M120,60 L150,60 Q200,80 250,60 L280,60 L280,120 L260,230 L140,230 L120,120 Z" fill={colors.top} stroke="rgba(255,255,255,0.1)" strokeWidth="1" filter="url(#clothShadow)" />
                    {colors.apron !== 'transparent' && (
                        <g transform="translate(0, 10)">
                            <path d="M140,100 L140,200 M260,100 L260,200" stroke={colors.apron} strokeWidth="6" />
                            <path d="M150,200 L250,200 L260,350 L140,350 Z" fill={colors.apron} stroke="rgba(0,0,0,0.1)" filter="url(#clothShadow)" />
                        </g>
                    )}
                    <rect x="20" y="360" width="100" height="24" rx="4" fill="#222" />
                    <text x="70" y="376" textAnchor="middle" fill="#666" fontSize="10" fontFamily="monospace">ASSET_ID: {Math.floor(Math.random() * 999)}</text>
                </svg>
            )}
            <div className="absolute top-4 left-4 bg-orange-600/90 text-white px-3 py-1 rounded text-[10px] font-bold uppercase tracking-wider shadow-lg">{styleName}</div>
        </div>
    );
};

// --- 5. LOGIC ENGINES ---
const CULINARY_DB = [
    {
        triggers: ["bun bo", "bún bò", "hue", "huế"],
        culture: "Vietnamese Traditional",
        market_default: "bustling traditional Vietnamese wet market",
        outfit_desc: "solid white crop top",
        bottom_desc: "loose beige linen pants",
        apron_desc: "NO APRON",
        vibe: "Rustic, authentic, tropical sunlight",
        ingredients: ["Lemongrass stalks", "Beef shank", "Hue Shrimp Paste", "Thick Rice Vermicelli", "Spicy Chili Oil"],
        seasoning: ["Fish Sauce", "Rock Sugar", "MSG", "Chili Oil"],
        method: "SOUP"
    },
    {
        triggers: ["tom yum", "tomyum", "tomyung", "thai", "thái"],
        culture: "Thai Spicy",
        market_default: "Thai floating market or Big C",
        outfit_desc: "solid orange tank top",
        bottom_desc: "solid light blue denim shorts",
        apron_desc: "brown waist apron",
        vibe: "Colorful, zesty, energetic",
        ingredients: ["Galangal root", "River prawns", "Kaffir lime leaves", "Thai chilies", "Coconut milk"],
        // AUTHENTIC THAI SEASONING
        seasoning: ["Fish Sauce (Nam Pla)", "Palm Sugar", "Thai Chili Paste (Nam Prik Pao)", "Fresh Lime Juice", "MSG"],
        method: "SOUP"
    },
    // ...
];

const extractColor = (text) => {
    const colors = { white: "#ffffff", black: "#171717", grey: "#6b7280", red: "#ef4444", blue: "#3b82f6", green: "#22c55e", yellow: "#eab308", orange: "#f97316", purple: "#a855f7", pink: "#ec4899", beige: "#d6d3d1", brown: "#78350f", navy: "#1e3a8a", indigo: "#4338ca" };
    const words = text.toLowerCase().split(/[\s,]+/);
    for (let w of words) if (colors[w]) return colors[w];
    return "#999999";
};

const analyzeWithGemini3Pro = (input) => {
    const cleanInput = input.toLowerCase().replace(/[.,/#!$%^&*;:{}=\-_`~()]/g, "");
    let detectedMethod = "SEAR";
    if (cleanInput.includes("soup") || cleanInput.includes("pho") || cleanInput.includes("curry") || cleanInput.includes("boil") || cleanInput.includes("yum") || cleanInput.includes("bún")) {
        detectedMethod = "SOUP";
    }
    let result = {
        culture: "Home Cooking",
        market_default: "Local supermarket",
        outfit_desc: "solid white t-shirt",
        bottom_desc: "grey sweatpants",
        apron_desc: "beige apron",
        vibe: "Cozy kitchen",
        ingredients: ["Fresh seasonal vegetables", "Meat", "Spices", "Sauce"],
        seasoning: ["Salt", "Pepper", "Sugar", "Soy Sauce"],
        method: detectedMethod,
        dog_wear: "Solid Red Bandana"
    };
    const found = CULINARY_DB.find(entry => entry.triggers.some(t => cleanInput.includes(t)));
    if (found) result = { ...result, ...found };
    return result;
};

const generateClonePrompt = (top, bottom, apron, isCustom) => {
    const source = isCustom ? "custom uploaded photo" : "generated vector asset";
    return `(ASSET CLONE PROMPT) Analyze the ${source}. Character is wearing: ${top}, ${bottom}, and ${apron}. IMPORTANT: All clothing items are SOLID COLOR, NO PATTERNS. Replicate this exact outfit texture, color, and fit. High fidelity, 8k.`.trim();
};

// *** AUTHENTIC SEASONING LOGIC ***
const getAuthenticSeasoningAction = (seasoningList) => {
    if (!seasoningList || seasoningList.length === 0) return "seasoning with salt and pepper";

    // Generate a rich narrative sequence
    const actions = seasoningList.map((item) => {
        const lower = item.toLowerCase();
        if (lower.includes("fish sauce") || lower.includes("soy sauce")) {
            return `pouring a tablespoon of ${item} for umami`;
        } else if (lower.includes("palm sugar") || lower.includes("sugar") || lower.includes("rock sugar")) {
            return `dissolving a piece of ${item} to balance the heat`;
        } else if (lower.includes("lime")) {
            return `squeezing fresh ${item} for acidity`;
        } else if (lower.includes("paste")) {
            return `stirring in a spoonful of ${item} which turns the broth vibrant red`;
        } else if (lower.includes("msg") || lower.includes("salt")) {
            return `sprinkling a pinch of ${item} for depth`;
        } else {
            return `adding ${item}`;
        }
    });

    return `MASTER SEASONING: She balances the flavors by ${actions.join(", then ")}. She tastes the complex broth and nods.`;
};

// *** THE PERFECTED SCRIPT GENERATOR ***
const generateScript = (dishName, lockedStyle, minutes, sceneDuration, customLocation, customIngredients, customImageState, isRandomOutfit) => {
    const totalSeconds = minutes * 60;
    const totalScenes = Math.ceil(totalSeconds / sceneDuration);

    let marketEnd, prepEnd;
    const isShortVideo = totalScenes <= 2;

    if (isShortVideo) {
        marketEnd = 1;
        prepEnd = 1;
    } else {
        marketEnd = Math.max(2, Math.floor(totalScenes * 0.35));
        prepEnd = marketEnd + Math.floor(totalScenes * 0.30);
    }

    const scriptData = [];

    // OUTFIT LOGIC
    let OUTFIT_PROMPT_SECTION = "";
    let VISUAL_ANCHOR_TAG = "";
    let REF_TYPE_FLAG = "";

    if (isRandomOutfit) {
        OUTFIT_PROMPT_SECTION = `ATTIRE: Casual daily wear fitting the environment.`;
        VISUAL_ANCHOR_TAG = ``;
        REF_TYPE_FLAG = ``;
    } else {
        const enforceSolid = (text) => {
            if (!text) return "";
            let clean = text.replace(/pattern|print|graphic|logo/gi, "").trim();
            if (!clean.toLowerCase().includes("solid")) clean = "solid plain " + clean;
            return `${clean} (matte fabric, no patterns)`;
        };
        const TOP = enforceSolid(lockedStyle.outfit_desc);
        const BOT = enforceSolid(lockedStyle.bottom_desc);
        const APRON_DESC = lockedStyle.apron_desc.includes("NO APRON") ? "no apron" : enforceSolid(lockedStyle.apron_desc);
        OUTFIT_PROMPT_SECTION = `OUTFIT DESCRIPTION: Top: ${TOP}. Bottom: ${BOT}. Apron: ${APRON_DESC}. NOTE: Clothing is SOLID COLOR, NO PATTERNS.`;
        VISUAL_ANCHOR_TAG = customImageState ? `[VISUAL ANCHOR: Use Uploaded Image]` : `[VISUAL ANCHOR: Use Generated Flat Lay]`;
        REF_TYPE_FLAG = customImageState ? `--use_uploaded_image` : `--use_generated_ref`;
    }

    const cleanDogWear = lockedStyle.dog_wear ? lockedStyle.dog_wear.trim() : "";
    const COMPANION_STRING = cleanDogWear ? `COMPANION: Fluffy Corgi dog wearing [${cleanDogWear}].` : `COMPANION: Fluffy Corgi dog.`;
    const finalLocation = customLocation || lockedStyle.market_default;

    const rawIngredients = Array.isArray(customIngredients) ? customIngredients : customIngredients.split(',');
    const cleanIngredients = rawIngredients.map(i => i.trim()).filter(i => i.length > 0);

    const Ing1 = cleanIngredients[0] || "Main Protein";
    const Ing2 = cleanIngredients[1] || "Aromatics";
    const Ing3 = cleanIngredients[2] || "Spices";
    const Ing4 = cleanIngredients[3] || "Sauce";

    // SEASONING LIST
    const SeasoningList = lockedStyle.seasoning || ["Salt", "Sugar", "Pepper"];

    const COOKING_METHOD = lockedStyle.method || "SEAR";

    let potState = COOKING_METHOD === "SOUP" ? "pot of boiling water" : "hot empty pan";

    for (let i = 1; i <= totalScenes; i++) {
        let phase = "";
        let action = "";
        let location = "";
        let contextPrefix = "";

        // --- PHASE 1: MARKET ---
        if (i <= marketEnd) {
            phase = "MARKET";
            location = finalLocation;
            contextPrefix = `CONTEXT: Active Shopping.`;
            if (i === 1) {
                if (marketEnd === 1) {
                    action = `Cinematic Action Shot. Standing at ${location}, she is holding fresh ${Ing1} in one hand and pointing at ${Ing2} with the other. She smiles at the camera. Corgi is excited.`;
                } else {
                    action = `Cinematic intro. She walks into ${location} and picks up ${Ing1}. She smells it and nods in approval.`;
                }
            } else if (i === marketEnd && !isShortVideo) {
                action = `At checkout. The basket is full of ${Ing1}, ${Ing2}, and ${Ing3}. Paying the vendor.`;
            } else {
                const currentIng = cleanIngredients[(i - 1) % cleanIngredients.length] || Ing2;
                action = `Close-up POV. Hands (no rings) selecting the best ${currentIng} from the display. Inspecting freshness.`;
            }
        }
        // --- PHASE 2: PREP ---
        else if (!isShortVideo && i <= prepEnd) {
            phase = "PREP";
            location = "Modern Kitchen";
            contextPrefix = `CONTEXT: Mise-en-place.`;
            if (i === marketEnd + 1) {
                action = `MISE-EN-PLACE SHOT: Wide angle of kitchen island. All ingredients (${cleanIngredients.join(', ')}) are beautifully arranged in bowls.`;
            } else {
                const currentIng = cleanIngredients[(i - marketEnd)] || Ing2;
                action = `Detail shot. Hands (no rings) precisely chopping ${currentIng} on a wooden board. Sound of knife cutting.`;
            }
        }
        // --- PHASE 3: COOKING ---
        else {
            phase = "COOKING";
            location = "Kitchen Stove";

            if (isShortVideo && i === 2) {
                const seasoningAction = getAuthenticSeasoningAction(SeasoningList);
                action = `HYBRID CHEF MONTAGE: 1. Close-up of hands chopping ${Ing1}. 2. Match cut dropping ${Ing1} into the boiling pot. 3. ${seasoningAction} 4. Final shot: Holding the finished bowl.`;
            } else {
                const cookStep = i - prepEnd;

                if (i === totalScenes) {
                    contextPrefix = `CONTEXT: The ${dishName} (made from ${potState}) is now ready.`;
                    action = `Final Reveal. She holds the finished bowl. Steam curls up. She smiles radiantly.`;
                } else {
                    if (COOKING_METHOD === "SOUP") {
                        if (cookStep === 1) {
                            contextPrefix = `CONTEXT: Close-up of ${potState}.`;
                            action = `Step 1: She adds ${Ing2} (Aromatics) into the boiling water. The liquid bubbles aggressively.`;
                            potState = `bubbling aromatic broth with ${Ing2}`;
                        } else if (cookStep === 2) {
                            contextPrefix = `CONTEXT: Pot containing ${potState}.`;
                            action = `Step 2: She gently lowers ${Ing1} into the ${potState}. The liquid changes color.`;
                            potState = `rich broth with ${Ing2} and cooking ${Ing1}`;
                        } else if (cookStep === 3) {
                            // *** AUTHENTIC SEASONING STEP ***
                            contextPrefix = `CONTEXT: Pot containing ${potState}.`;
                            const seasoningAction = getAuthenticSeasoningAction(SeasoningList);
                            action = `Step 3: ${seasoningAction} Stirring gently to dissolve.`;
                            potState = `fully seasoned soup with ${Ing1}, ${Ing2}, and spices`;
                        } else {
                            contextPrefix = `CONTEXT: Pot containing ${potState}.`;
                            action = `Simmering. The ${potState} is bubbling gently. She tastes the broth with a spoon.`;
                        }
                    } else {
                        // SEAR LOGIC
                        if (cookStep === 1) {
                            contextPrefix = `CONTEXT: Hot empty pan.`;
                            action = `Step 1: She adds 1 TABLESPOON of oil to the hot pan. It shimmers.`;
                            potState = `hot oiled pan`;
                        } else if (cookStep === 2) {
                            contextPrefix = `CONTEXT: Pan with ${potState}.`;
                            action = `Step 2: She places ${Ing1} into the ${potState}. Loud sizzling sound.`;
                            potState = `pan with searing ${Ing1}`;
                        } else if (cookStep === 3) {
                            contextPrefix = `CONTEXT: Pan with ${potState}.`;
                            const seasoningAction = getAuthenticSeasoningAction(SeasoningList);
                            action = `Step 3: To the ${potState}, she adds chopped ${Ing2}. Then, ${seasoningAction}. Tossing the food.`;
                            potState = `mix of browned ${Ing1} and ${Ing2}`;
                        } else {
                            contextPrefix = `CONTEXT: Pan with ${potState}.`;
                            action = `Finishing. Glazing the food. It looks glossy.`;
                        }
                    }
                }
            }
        }

        const videoPrompt = `
${CHAR_HANDLES} ${REF_TYPE_FLAG} --duration ${sceneDuration}s
${VISUAL_ANCHOR_TAG}
SUBJECT: ${DNA_BODY.HOST_FACE}.
NO ACCESSORIES: ${DNA_BODY.HOST_ACCESSORIES}
${OUTFIT_PROMPT_SECTION}
HANDS: ${DNA_BODY.HOST_HANDS}.
${COMPANION_STRING}

[SCENE]
LOCATION: ${location}.
VIBE: ${lockedStyle.vibe}.
CINEMATICS: ${CINEMATIC_VIBES.LIGHTING} ${CINEMATIC_VIBES.CAMERA_WORK}
${contextPrefix}
ACTION: ${action}
    `.trim().replace(/^\s*[\r\n]/gm, "");

        const imagePrompt = `YouTube Thumbnail, ${dishName}, ${location}, ${action.substring(0, 50)}..., 8k`.trim();
        scriptData.push({ id: i, phase, videoPrompt, imagePrompt });
    }
    return { scriptData, totalScenes };
};

// --- 7. REACT UI ---
export default function AnxalyCookingV358() {
    const [step, setStep] = useState(1);
    const [dish, setDish] = useState("");
    const [minutes, setMinutes] = useState(2.5);
    const [sceneDuration, setSceneDuration] = useState(8);

    const [editTop, setEditTop] = useState("");
    const [editBottom, setEditBottom] = useState("");
    const [editApron, setEditApron] = useState("");
    const [editDogWear, setEditDogWear] = useState("");
    const [editLocation, setEditLocation] = useState("");
    const [editIngredients, setEditIngredients] = useState("");
    const [editVibe, setEditVibe] = useState("");
    const [cookingMethod, setCookingMethod] = useState("SEAR");

    const [isRandomOutfit, setIsRandomOutfit] = useState(false);
    const [visualColors, setVisualColors] = useState({ top: "#fff", bottom: "#999", apron: "transparent" });
    const [style, setStyle] = useState(null);
    const [result, setResult] = useState(null);

    const [isProcessing, setIsProcessing] = useState(false);
    const [isAnalyzingImage, setIsAnalyzingImage] = useState(false);
    const [customImage, setCustomImage] = useState(null);
    const [isRenderingWardrobe, setIsRenderingWardrobe] = useState(false);
    const fileInputRef = useRef(null);

    const startEngine = () => {
        if (!dish) return;
        setIsProcessing(true);
        setTimeout(() => {
            const analysis = analyzeWithGemini3Pro(dish);
            setEditTop(analysis.outfit_desc);
            setEditBottom(analysis.bottom_desc);
            setEditApron(analysis.apron_desc);
            setEditDogWear(analysis.dog_wear);
            setEditLocation(analysis.market_default);
            setEditIngredients(analysis.ingredients.join(", "));
            setEditVibe(analysis.vibe);
            setCookingMethod(analysis.method || "SEAR");
            updateVisuals(analysis.outfit_desc, analysis.bottom_desc, analysis.apron_desc);
            setStyle(analysis);
            setIsProcessing(false);
            setStep(2);
        }, 2000);
    };

    const updateVisuals = (t, b, a) => {
        setVisualColors({
            top: extractColor(t),
            bottom: extractColor(b),
            apron: a.includes("NO APRON") ? "transparent" : extractColor(a)
        });
    };

    const handleImageAnalysis = () => {
        if (!customImage) return;
        setIsAnalyzingImage(true);
        setTimeout(() => {
            const simulatedExtraction = {
                top: "Solid custom top from upload",
                bottom: "Solid custom bottom from upload",
                apron: "Solid custom apron"
            };
            setEditTop(simulatedExtraction.top);
            setEditBottom(simulatedExtraction.bottom);
            setEditApron(simulatedExtraction.apron);
            setIsAnalyzingImage(false);
        }, 2000);
    };

    const handleImageUpload = (e) => {
        const file = e.target.files[0];
        if (file) {
            const url = URL.createObjectURL(file);
            setCustomImage(url);
        }
    };

    const handleGenerateScript = () => {
        const finalStyle = {
            ...style,
            outfit_desc: editTop,
            bottom_desc: editBottom,
            apron_desc: editApron,
            dog_wear: editDogWear,
            market_default: editLocation,
            vibe: editVibe,
            method: cookingMethod
        };
        const data = generateScript(dish, finalStyle, minutes, sceneDuration, editLocation, editIngredients, customImage, isRandomOutfit);
        setResult(data);
        setStep(3);
    };

    const copy = (txt) => navigator.clipboard.writeText(txt);

    return (
        <div
            className="min-h-screen font-sans text-white p-6 bg-cover bg-center bg-fixed bg-no-repeat relative transition-all duration-1000"
            style={{ backgroundImage: `url('https://images.unsplash.com/photo-1556910103-1c02745a30bf?q=80&w=2070&auto=format&fit=crop')` }}
        >
            <div className="absolute inset-0 bg-gradient-to-br from-red-900/90 via-orange-950/85 to-black/80 backdrop-blur-[1px]"></div>

            <div className="relative z-10 max-w-7xl mx-auto">
                <header className="flex items-center justify-between mb-10 border-b border-orange-200/20 pb-6">
                    <div className="flex items-center gap-4">
                        <div className="bg-gradient-to-br from-orange-500 to-red-600 p-3 rounded-xl shadow-lg shadow-orange-900/40"><Camera size={32} className="text-white" /></div>
                        <div>
                            <h1 className="text-3xl font-black tracking-tighter text-white drop-shadow-md">{APP_CONFIG.NAME}</h1>
                            <div className="flex gap-3 mt-2 items-center">
                                <span className="bg-orange-100/10 text-orange-100 px-2 py-0.5 rounded text-[10px] font-bold border border-orange-200/30">{APP_CONFIG.ENGINE}</span>
                                <span className="text-[10px] text-red-200 flex items-center gap-1"><Ban size={10} /> ZERO JEWELRY</span>
                                <span className="text-[10px] text-green-200 flex items-center gap-1"><Soup size={10} /> AUTHENTIC SEASONING</span>
                            </div>
                        </div>
                    </div>
                    {step > 1 && <button onClick={() => { setStep(1); setCustomImage(null); setIsRandomOutfit(false); }} className="text-xs font-bold text-white/70 hover:text-white flex items-center gap-1 hover:bg-white/10 px-3 py-2 rounded-lg transition-all"><RefreshCcw size={12} /> RESET</button>}
                </header>

                {/* STEP 1: INPUT */}
                {step === 1 && !isProcessing && (
                    <div className="max-w-xl mx-auto mt-12 bg-red-950/60 p-8 rounded-3xl border border-orange-500/20 shadow-2xl backdrop-blur-xl">
                        <h2 className="text-2xl font-bold mb-8 text-center text-white drop-shadow-sm">Initialize Chef's Table</h2>
                        <div className="space-y-8">
                            <div>
                                <label className="block text-xs font-bold text-orange-300 mb-2 uppercase tracking-widest">Target Dish</label>
                                <input className="w-full px-5 py-4 text-xl bg-white/10 border border-orange-200/20 rounded-2xl focus:border-orange-400 outline-none text-white transition-all placeholder:text-white/30" placeholder="e.g. Bun Bo Hue..." value={dish} onChange={e => setDish(e.target.value)} onKeyDown={e => e.key === 'Enter' && startEngine()} />
                            </div>
                            <div className="grid grid-cols-2 gap-6 p-4 bg-black/20 rounded-2xl border border-orange-200/10">
                                <div>
                                    <label className="flex justify-between items-center text-[10px] font-bold text-white/80 uppercase mb-2"><span>Total Video</span><span className="text-orange-300 font-mono">{minutes} min</span></label>
                                    <input type="range" min="0.5" max="5" step="0.5" value={minutes} onChange={e => setMinutes(parseFloat(e.target.value))} className="w-full h-2 bg-white/10 rounded-lg accent-orange-500 cursor-pointer" />
                                </div>
                                <div>
                                    <label className="flex justify-between items-center text-[10px] font-bold text-white/80 uppercase mb-2"><span>Scene Length</span><span className="text-yellow-300 font-mono">{sceneDuration} sec</span></label>
                                    <input type="range" min="5" max="60" step="1" value={sceneDuration} onChange={e => setSceneDuration(parseInt(e.target.value))} className="w-full h-2 bg-white/10 rounded-lg accent-yellow-500 cursor-pointer" />
                                </div>
                            </div>
                            <button onClick={startEngine} className="w-full bg-gradient-to-r from-orange-600 to-red-600 hover:from-orange-500 hover:to-red-500 text-white py-5 rounded-2xl font-bold text-lg transition-all shadow-lg shadow-orange-900/30">Launch Chef Maestro</button>
                        </div>
                    </div>
                )}

                {isProcessing && <div className="fixed inset-0 bg-red-950/90 z-50 flex items-center justify-center"><div className="animate-spin text-orange-400 mb-4"><Zap size={48} /></div><div className="text-orange-200 animate-pulse">Consulting Culinary Database...</div></div>}

                {/* STEP 2: VISION STUDIO */}
                {step === 2 && style && (
                    <div className="animate-in fade-in slide-in-from-bottom-8">
                        <div className="grid md:grid-cols-12 gap-6">
                            {/* COL 1: PREVIEW */}
                            <div className="md:col-span-4 flex flex-col gap-4">
                                <div className="bg-red-950/40 p-4 rounded-3xl border border-orange-200/20 h-full backdrop-blur-md">
                                    <div className="flex justify-between items-center mb-4">
                                        <div className="text-xs font-bold text-white/60 uppercase tracking-widest">Asset Viewer</div>
                                        <div className={`text-[9px] px-2 py-1 rounded border ${isRandomOutfit ? 'bg-purple-500/20 text-purple-200 border-purple-500/30' : customImage ? 'bg-green-500/20 text-green-200 border-green-500/30' : 'bg-orange-500/20 text-orange-200 border-orange-500/30'}`}>
                                            {isRandomOutfit ? "AI DECIDES" : customImage ? "UPLOADED" : "VECTOR"}
                                        </div>
                                    </div>
                                    <DigitalWardrobe colors={visualColors} styleName={style.culture} isRendering={isRenderingWardrobe || isAnalyzingImage} customImage={customImage} isRandomMode={isRandomOutfit} />
                                    {!isRandomOutfit && (
                                        <div className="mt-4 grid grid-cols-2 gap-2">
                                            <input type="file" ref={fileInputRef} onChange={handleImageUpload} accept="image/*" className="hidden" />
                                            <button onClick={() => fileInputRef.current.click()} className="py-3 bg-blue-600/80 hover:bg-blue-500 text-white font-bold rounded-xl flex items-center justify-center gap-2 shadow-lg text-xs backdrop-blur-sm"><Upload size={14} /> Upload Photo</button>
                                            <button onClick={handleImageAnalysis} disabled={!customImage} className={`py-3 font-bold rounded-xl flex items-center justify-center gap-2 shadow-lg text-xs ${customImage ? 'bg-purple-600/80 hover:bg-purple-500 text-white' : 'bg-white/10 text-white/20 cursor-not-allowed'}`}><Scan size={14} /> Extract DNA</button>
                                        </div>
                                    )}
                                </div>
                            </div>

                            {/* COL 2: OUTFIT DNA */}
                            <div className="md:col-span-4 bg-red-950/40 p-6 rounded-3xl border border-orange-200/20 relative backdrop-blur-md">
                                <div className="flex items-center justify-between mb-4 border-b border-white/10 pb-2">
                                    <div className="flex items-center gap-2 text-orange-300 font-bold text-xs uppercase tracking-widest"><Shirt size={14} /> Outfit</div>
                                    <button onClick={() => setIsRandomOutfit(!isRandomOutfit)} className={`flex items-center gap-2 text-[10px] px-2 py-1 rounded border ${isRandomOutfit ? 'bg-purple-600 border-purple-500 text-white' : 'bg-white/10 border-white/20 text-white/60 hover:text-white hover:bg-white/20'}`}><Shuffle size={10} /> {isRandomOutfit ? "Let AI Decide" : "Manual Mode"}</button>
                                </div>
                                <div className={`space-y-4 transition-all ${isRandomOutfit ? 'opacity-30 pointer-events-none grayscale' : ''}`}>
                                    <div><label className="text-[10px] font-bold text-white/50 block mb-1">Top</label><textarea value={editTop} onChange={e => setEditTop(e.target.value)} className="w-full bg-red-950/60 border border-white/10 rounded-xl p-3 text-sm text-white outline-none focus:border-orange-500" rows={2} /></div>
                                    <div><label className="text-[10px] font-bold text-white/50 block mb-1">Bottom</label><textarea value={editBottom} onChange={e => setEditBottom(e.target.value)} className="w-full bg-red-950/60 border border-white/10 rounded-xl p-3 text-sm text-white outline-none focus:border-orange-500" rows={2} /></div>
                                    <div><label className="text-[10px] font-bold text-white/50 block mb-1">Apron</label><input value={editApron} onChange={e => setEditApron(e.target.value)} className="w-full bg-red-950/60 border border-white/10 rounded-xl p-3 text-sm text-white outline-none focus:border-orange-500" /></div>
                                    {!isRandomOutfit && <div className="bg-red-950/60 p-3 rounded-xl border border-orange-500/30 mt-4"><div className="flex justify-between items-center mb-2"><span className="text-[9px] font-bold text-orange-300 uppercase">Clone Prompt</span><button onClick={() => copy(generateClonePrompt(editTop, editBottom, editApron, !!customImage))} className="text-white/50 hover:text-white"><Copy size={12} /></button></div><p className="text-[10px] text-white/60 font-mono line-clamp-3 select-all">{generateClonePrompt(editTop, editBottom, editApron, !!customImage)}</p></div>}
                                </div>
                                <div className="pt-4 mt-4 border-t border-white/10 relative">
                                    <div className="flex justify-between items-center mb-1">
                                        <label className="text-[10px] font-bold text-orange-400 block flex items-center gap-1"><User size={10} /> Companion Wear (Locked)</label>
                                        <button onClick={() => setEditDogWear("")} className="text-[8px] text-white/40 hover:text-white flex items-center gap-1 bg-white/5 px-2 rounded"><X size={8} /> CLEAR</button>
                                    </div>
                                    <input value={editDogWear} onChange={e => setEditDogWear(e.target.value)} className={`w-full bg-red-950/60 border border-orange-500/30 rounded-xl p-3 text-sm text-white outline-none focus:border-orange-500 ${isRandomOutfit ? 'opacity-30 pointer-events-none' : ''}`} placeholder="e.g. Solid Red Bandana" />
                                </div>
                            </div>

                            {/* COL 3: CONTEXT */}
                            <div className="md:col-span-4 bg-red-950/40 p-6 rounded-3xl border border-orange-200/20 flex flex-col justify-between backdrop-blur-md">
                                <div>
                                    <div className="flex items-center gap-2 mb-4 text-green-400 font-bold text-xs uppercase tracking-widest border-b border-white/10 pb-2"><MapPin size={14} /> Chef's Context</div>
                                    <div className="space-y-4">
                                        <div><label className="text-[10px] font-bold text-white/50 block mb-1">Location</label><textarea value={editLocation} onChange={e => setEditLocation(e.target.value)} className="w-full bg-red-950/60 border border-white/10 rounded-xl p-3 text-sm text-white outline-none focus:border-green-500" rows={2} /></div>
                                        <div><label className="text-[10px] font-bold text-white/50 block mb-1">Ingredients (Comma separated)</label><textarea value={editIngredients} onChange={e => setEditIngredients(e.target.value)} className="w-full bg-red-950/60 border border-white/10 rounded-xl p-3 text-sm text-white outline-none focus:border-green-500" rows={3} /></div>

                                        {/* COOKING METHOD TOGGLE */}
                                        <div>
                                            <label className="text-[10px] font-bold text-white/50 block mb-1">Method</label>
                                            <div className="flex gap-2">
                                                <button onClick={() => setCookingMethod("SOUP")} className={`flex-1 py-2 rounded-lg text-xs font-bold border ${cookingMethod === 'SOUP' ? 'bg-blue-600 border-blue-500' : 'bg-black/20 border-white/10 text-white/50'}`}><Droplets size={12} className="inline mr-1" /> Soup/Boil</button>
                                                <button onClick={() => setCookingMethod("SEAR")} className={`flex-1 py-2 rounded-lg text-xs font-bold border ${cookingMethod === 'SEAR' ? 'bg-red-600 border-red-500' : 'bg-black/20 border-white/10 text-white/50'}`}><Flame size={12} className="inline mr-1" /> Sear/Fry</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="mt-6 pt-6 border-t border-white/10">
                                    <button onClick={handleGenerateScript} className="w-full py-4 bg-white hover:bg-orange-100 text-red-950 font-bold rounded-xl shadow-lg flex items-center justify-center gap-2 transition-all hover:scale-105"><Play size={18} fill="currentColor" /> Generate Production Script</button>
                                </div>
                            </div>
                        </div>
                    </div>
                )}

                {/* STEP 3: SCRIPT */}
                {step === 3 && result && (
                    <div className="animate-in fade-in slide-in-from-bottom-8 duration-500 mt-12">
                        <div className="bg-red-950/40 rounded-3xl border border-orange-200/20 overflow-hidden backdrop-blur-md">
                            <div className="p-6 bg-red-900/30 border-b border-white/10 flex justify-between items-center">
                                <div className="flex items-center gap-3"><List className="text-green-400" /><span className="text-sm font-bold text-white uppercase tracking-widest">Cinematic Production Script</span></div>
                                <span className="text-green-400 text-xs font-mono border border-green-500/30 px-2 py-1 rounded">{sceneDuration}s / scene</span>
                            </div>
                            <table className="w-full text-left border-collapse">
                                <thead><tr className="bg-red-950/60 text-[10px] font-bold text-white/50 uppercase tracking-widest border-b border-white/10"><th className="p-5 w-16 text-center">#</th><th className="p-5 w-24 text-center">Phase</th><th className="p-5">Deep Descriptive Prompt</th><th className="p-5 w-24 text-center">Copy</th></tr></thead>
                                <tbody className="divide-y divide-white/10">
                                    {result.scriptData.map(s => (
                                        <tr key={s.id} className="hover:bg-white/5 group transition-colors">
                                            <td className="p-5 text-center font-bold text-white/40">{s.id}</td>
                                            <td className="p-5 text-center"><span className={`text-[9px] px-2 py-1 rounded font-bold uppercase ${s.phase.includes('MARKET') ? 'bg-blue-500/20 text-blue-200' : s.phase.includes('PREP') ? 'bg-purple-500/20 text-purple-200' : 'bg-orange-500/20 text-orange-200'}`}>{s.phase}</span></td>
                                            <td className="p-5"><p className="font-mono text-xs text-white/80 leading-relaxed select-all whitespace-pre-wrap">{s.videoPrompt}</p></td>
                                            <td className="p-5 text-center"><button onClick={() => copy(s.videoPrompt)} className="text-white/30 hover:text-orange-400 transition-colors p-2 bg-white/5 rounded hover:bg-white/10"><Copy size={18} /></button></td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
}
