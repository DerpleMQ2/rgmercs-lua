local mq          = require('mq')
local RGMercUtils = require("utils.rgmercs_utils")

return {
    ['Modes'] = {
        [1] = 'Tank',
        [2] = 'DPS',
        [3] = 'Healer',
        [4] = 'Hybrid',
    },
    ['ItemSets'] = {
        ['Epic'] = {
            [1] = "Focus of Primal Elements",
            [2] = "Staff of Elemental Essence",
        },
    },
    ['AbilitySets'] = {
        --- Nukes
        ['SwarmPet'] = {
            -- Swarm Pet* >= LVL 70
            [1] = "Ravening Servant",
            [2] = "Roiling Servant",
            [3] = "Riotous Servant",
            [4] = "Reckless Servant",
            [5] = "Remorseless Servant",
            [6] = "Relentless Servant",
            [7] = "Ruthless Servant",
            [8] = "Ruinous Servant",
            [9] = "Rumbling Servant",
            [10] = "Rancorous Servant",
            [11] = "Rampaging Servant",
            [12] = "Raging Servant",
            [13] = "Rage of Zomm",
        },
        ['SpearNuke'] = {
            -- Spear Nuke* >= LVL 70
            [1] = "Spear of Molten Dacite",
            [2] = "Spear of Molten Luclinite",
            [3] = "Spear of Molten Komatiite",
            [4] = "Spear of Molten Arcronite",
            [5] = "Spear of Molten Shieldstone",
            [6] = "Spear of Blistersteel",
            [7] = "Spear of Molten Steel",
            [8] = "Spear of Magma",
            [9] = "Spear of Ro",
        },
        ['ChaoticNuke'] = {
            -- Chaotic Nuke with Beneficial Effect >= LVL69
            [1] = "Chaotic Magma",
            [2] = "Chaotic Calamity",
            [3] = "Chaotic Pyroclasm",
            [4] = "Chaotic Inferno",
            [5] = "Chaotic Fire",
            [6] = "Fickle Magma",
            [7] = "Fickle Flames",
            [8] = "Fickle Flare",
            [9] = "Fickle Blaze",
            [10] = "Fickle Pyroclasm",
            [11] = "Fickle Inferno",
            [12] = "Fickle Fire",
        },
        ['FireNuke'] = {
            -- Fire Nuke 1 <= LVL <= 70
            [1] = "Cremating Sands",
            [2] = "Ravaging Sands",
            [3] = "Incinerating Sands",
            [4] = "Crash of Sand",
            [5] = "Blistering Sands",
            [6] = "Searing Sands",
            [7] = "Broiling Sands",
            [8] = "Blast of Sand",
            [9] = "Burning Sands",
            [10] = "Burst of Sand",
            [11] = "Strike of Sand",
            [12] = "Torrid Sands",
            [13] = "Scorching Sands",
            [14] = "Scalding Sands",
            [15] = "Sun Vortex",
            [16] = "Star Strike",
            [17] = "Ancient: Nova Strike",
            [18] = "Burning Sand",
            [19] = "Shock of Fiery Blades",
            [20] = "Char",
            [21] = "Blaze",
            [22] = "Shock of Flame",
            [23] = "Burn",
            [24] = "Burst of Flame",
        },
        ['MagicNuke'] = {
            -- Nuke 1 <= LVL <= 69
            [1] = "Shock of Memorial Steel",
            [2] = "Shock of Carbide Steel",
            [3] = "Shock of Burning Steel",
            [4] = "Shock of Arcronite Steel",
            [5] = "Shock of Darksteel",
            [6] = "Shock of Blistersteel",
            [7] = "Shock of Argathian Steel",
            [8] = "Shock of Ethereal Steel",
            [9] = "Shock of Discordant Steel",
            [10] = "Shock of Cineral Steel",
            [11] = "Shock of Silvered Steel",
            [12] = "Blade Strike",
            [13] = "Rock of Taelosia",
            [14] = "Black Steel",
            [15] = "Shock of Steel",
            [16] = "Shock of Swords",
            [17] = "Shock of Spikes",
            [18] = "Shock of Blades",
        },
        ['FireBoltNuke'] = {
            -- Fire Bolt Nukes
            [1] = "Bolt of Molten Dacite",
            [2] = "Bolt of Molten Olivine",
            [3] = "Bolt of Molten Komatiite",
            [4] = "Bolt of Skyfire",
            [5] = "Bolt of Molten Shieldstone",
            [6] = "Bolt of Molten Magma",
            [7] = "Bolt of Molten Steel",
            [8] = "Bolt of Rhyolite",
            [9] = "Bolt of Molten Scoria",
            [10] = "Bolt of Molten Dross",
            [11] = "Bolt of Molten Slag",
            [12] = "Bolt of Jerikor",
            [13] = "Firebolt of Tallon",
            [14] = "Seeking Flame of Seukor",
            [15] = "Scars of Sigil",
            [16] = "Lava Bolt",
            [17] = "Cinder Bolt",
            [18] = "Bolt of Flame",
            [19] = "Flame Bolt",
        },
        ['MagicBoltNuke'] = {
            -- Magic Bolt Nukes
            [1] = "Luclinite Bolt",
            [2] = "Komatiite Bolt",
            [3] = "Korascian Bolt",
            [4] = "Meteoric Bolt",
            [5] = "Iron Bolt",
        },
        ['BeamNuke'] = {
            -- Beam Frontal AOE Spell*
            [1] = "Beam of Molten Dacite",
            [2] = "Beam of Molten Olivine",
            [3] = "Beam of Molten Komatiite",
            [4] = "Beam of Molten Rhyolite",
            [5] = "Beam of Molten Shieldstone",
            [6] = "Beam of Brimstone",
            [7] = "Beam of Molten Steel",
            [8] = "Beam of Rhyolite",
            [9] = "Beam of Molten Scoria",
            [10] = "Beam of Molten Dross",
            [11] = "Beam of Molten Slag",
        },
        ['RainNuke'] = {
            --- Rain AOE Spell*
            [1] = "Rain of Molten Dacite",
            [2] = "Rain of Molten Olivine",
            [3] = "Rain of Molten Komatiite",
            [4] = "Rain of Molten Rhyolite",
            [5] = "Coronal Rain",
            [6] = "Rain of Blistersteel",
            [7] = "Rain of Molten Steel",
            [8] = "Rain of Rhyolite",
            [9] = "Rain of Molten Scoria",
            [10] = "Rain of Molten Dross",
            [11] = "Rain of Molten Slag",
            [12] = "Rain of Jerikor",
            [13] = "Sun Storm",
            [14] = "Sirocco",
            [15] = "Rain of Lava",
            [16] = "Rain of Fire",
        },
        ['MagicRainNuke'] = {
            -- Magic Rain
            [1] = "rain of Kukris",
            [2] = "Rain of Falchions",
            [3] = "Rain of Blades",
            [4] = "Rain of Spikes",
            [5] = "Rain Of Swords",
            [6] = "ManaStorm",
            [7] = "Maelstrom of Electricity",
            [8] = "Maelstrom of Thunder"
        },
        ['VolleyNuke'] = {
            -- Volley Nuke - Pet buff*
            [1] = "Fusillade of Many",
            [2] = "Barrage of Many",
            [3] = "Shockwave of Many",
            [4] = "Volley of Many",
            [5] = "Storm of Many",
            [6] = "Salvo of Many",
            [7] = "Strike of Many",
            [8] = "Clash of Many",
            [9] = "Jolt of Many",
            [10] = "Shock of Many",
        },
        ['SummonedNuke'] = {
            -- Unnatural Nukes >70
            [1] = "Dismantle the Unnatural",
            [2] = "Unmend the Unnatural",
            [3] = "Obliterate the Unnatural",
            [4] = "Repudiate the Unnatural",
            [5] = "Eradicate the Unnatural",
            [6] = "Exterminate the Unnatural",
            [7] = "Abolish the Divergent",
            [8] = "Annihilate the Divergent",
            [9] = "Annihilate the Anomalous",
            [10] = "Annihilate the Aberrant",
            [11] = "Annihilate the Unnatural",
        },
        ['MaloNuke'] = {
            -- Shock/Malo Combo Line
            [1] = "Memorial Steel Malosinera",
            [2] = "Carbide Malosinetra",
            [3] = "Blistersteel Malosenia",
            [4] = "Darksteel Malosenete",
            [5] = "Arcronite Malosinata",
            [6] = "Burning Malosinara",
        },
        --- Buffs
        ['SelfShield'] = {
            [1] = "Shield of Memories",
            [2] = "Shield of Shadow",
            [3] = "Shield of Restless Ice",
            [4] = "Shield of Scales",
            [5] = "Shield of the Pellarus",
            [6] = "Shield of the Dauntless",
            [7] = "Shield of Bronze",
            [8] = "Shield of Dreams",
            [9] = "Shield of the Void",
            [10] = "Prime Guard",
            [11] = "Prime Shielding",
            [12] = "Elemental Aura",
            [13] = "Shield of Maelin",
            [14] = "Shield of the Arcane",
            [15] = "Shield of the Magi",
            [16] = "Arch Shielding",
            [17] = "Greater Shielding",
            [18] = "Major Shielding",
            [19] = "Shielding",
            [20] = "Lesser Shielding",
            [21] = "Minor Shielding",
        },
        ['ShortDurDmgShield'] = {
            -- Use at the start of the DPS loop
            [1] = "Boiling Skin",
            [2] = "Scorching Skin",
            [3] = "Burning Skin",
            [4] = "Blistering Skin",
            [5] = "Coronal Skin",
            [6] = "Infernal Skin",
            [7] = "Molten Skin",
            [8] = "Blazing Skin",
            [9] = "Torrid Skin",
            [10] = "Brimstoneskin",
            [11] = "Searing Skin",
            [12] = "Scorching Skin",
            [13] = "Ancient: Veil of Pyrilonus",
            [14] = "Pyrilen Skin",
        },
        ['LongDurDmgShield'] = {
            -- Preferring group buffs for ease. Included all Single target Now as well.
            [1] = "Circle of Forgefire Coat",
            [2] = "Forgefire Coat",
            [3] = "Circle of Emberweave Coat",
            [4] = "Emberweave Coat",
            [5] = "Circle of Igneous Skin",
            [6] = "Igneous Coat",
            [7] = "Circle of the Inferno",
            [8] = "Inferno Coat",
            [9] = "Circle of Flameweaving",
            [10] = "Flameweave Coat",
            [11] = "Circle of Flameskin",
            [12] = "Flameskin",
            [13] = "Circle of Embers",
            [14] = "Embercoat",
            [15] = "Circle of Dreamfire",
            [16] = "Dreamfire Coat",
            [17] = "Circle of Brimstoneskin",
            [18] = "Brimstoneskin",
            [19] = "Circle of Lavaskin",
            [20] = "Lavaskin",
            [21] = "Circle of Magmaskin",
            [22] = "Magmaskin",
            [23] = "Circle of Fireskin",
            [24] = "Fireskin",
            [25] = "Maelstrom of Ro",
            [26] = "FlameShield of Ro",
            [27] = "Aegis of Ro",
            [28] = "Cadeau of Flame",
            [29] = "Boon of Immolation",
            [30] = "Shield of Lava",
            [31] = "Barrier of Combustion",
            [32] = "Inferno Shield",
            [33] = "Shield of Flame",
            [34] = "Shield of Fire",
        },
        ['ManaRegenBuff'] = {
            -- LVL58 (Transon's Phantasmal Protection) and up to avoid reagent usage
            [1] = "Courageous Guardian",
            [2] = "Relentless Guardian",
            [3] = "Restless Guardian",
            [4] = "Burning Guardian",
            [5] = "Praetorian Guardian",
            [6] = "Phantasmal Guardian",
            [7] = "Splendrous Guardian",
            [8] = "Cognitive Guardian",
            [9] = "Empyrean Guardian",
            [10] = "Eidolic Guardian",
            [11] = "Phantasmal Warden",
            [12] = "Phantom Shield",
            [13] = "Xegony's Phantasmal Guard",
            [14] = "Transon's Phantasmal Protection",
        },
        ['AllianceBuff'] = {
            [1] = "Firebound Conjunction",
            [2] = "Firebound Coalition",
            [3] = "Firebound Covenant",
            [4] = "Firebound Alliance",
        },
        ['SurgeDS'] = {
            -- ShortDuration DS (Slot 4)
            [1] = "Surge of Shadow",
            [2] = "Surge of Arcanum",
            [3] = "Surge of Shadowflares",
            [4] = "Surge of Thaumacretion",
        },
        ['PetAura'] = {
            -- Mage Pet Aura
            [1] = "Arcane Distillect",
        },
        ['SingleDS'] = {
            -- Single target Dmg Shields For Pets
            [1] = "Forgefire Coat",
            [2] = "Emberweave Coat",
            [3] = "Igneous Coat",
            [4] = "Inferno Coat",
            [5] = "Flameweave Coat",
            [6] = "Flameskin",
            [7] = "Embercoat",
            [8] = "Dreamfire Coat",
            [9] = "Brimstoneskin",
            [10] = "Lavaskin",
            [11] = "Magmaskin",
            [12] = "Fireskin",
            [13] = "FlameShield of Ro",
            [14] = "Cadeau of Flame",
            [15] = "Shield of Lava",
            [16] = "Barrier of Combustion",
            [17] = "Inferno Shield",
            [18] = "Shield of Flame",
            [19] = "Shield of Fire",
        },
        ['FireShroud'] = {
            -- Defensive Proc 3-6m Buff
            [1] = "Igneous Veil",
            [2] = "Volcanic Veil",
            [3] = "Exothermic Veil",
            [4] = "Skyfire Veil",
            [5] = "Magmatic Veil",
            [6] = "Molten Veil",
            [7] = "Burning Veil",
            [8] = "Burning Pyroshroud",
            [9] = "Burning Brimbody",
            [10] = "Burning Aura",
        },
        ['PetBodyGuard'] = {
            [1] = "ValorForged Bodyguard",
            [2] = "Ophiolite Bodyguard",
            [3] = "Pyroxenite Bodyguard",
            [4] = "Rhyolitic Bodyguard",
            [5] = "Shieldstone Bodyguard",
            [6] = "Groundswell Bodyguard",
            [7] = "Steelbound Bodyguard",
            [8] = "Tellurian Bodyguard",
            [9] = "Hulking Bodyguard",
        },
        ['GatherMana'] = {
            [1] = "Gather Zeal",
            [2] = "Gather Vigor",
            [3] = "Gather Potency",
            [4] = "Gather Capability",
            [5] = "Gather Magnitude",
            [6] = "Gather Capacity",
            [7] = "Gather Potential",
        },
        -- Pet Spells Pets & Spells Affecting them
        ['MeleeGuard  '] = {
            [1] = "Shield of Inescapability",
            [2] = "Shield of Inevitability",
            [3] = "Shield of Destiny",
            [4] = "Shield of Order",
            [5] = "Shield of Consequence",
            [6] = "Shield of Fate",
        },
        ['DichoSpell'] = {
            -- Dicho Spell*
            [1] = "Ecliptic Companion",
            [2] = "Composite Companion",
            [3] = "Dissident Companion",
            [4] = "Dichotomic Companion",
        },
        ['PetHealSpell'] = {
            -- Pet Heal*
            [1] = "Renewal of Shoru",
            [2] = "Renewal of Iilivina ",
            [3] = "Renewal of Evreth",
            [4] = "Renewal of Ioulin",
            [5] = "Renewal of Calix",
            [6] = "Renewal of Hererra",
            [7] = "Renewal of Sirqo",
            [8] = "Renewal of Volark",
            [9] = "Renewal of Cadwin",
            [10] = "Revival of Aenro",
            [11] = "Renewal of Aenda",
            [12] = "Renewal of Jerikor",
            [13] = "Planar Renewal",
            [14] = "Transon's Elemental Renewal",
            [15] = "Transon's Elemental Infusion",
            [16] = "Refresh Summoning",
            [17] = "Renew Summoning",
            [18] = "Renew Elements",
        },
        ['PetPromisedSpell'] = {
            ---Pet Promised*
            [1] = "Promised Reconstitution",
            [2] = "Promised Relief",
            [3] = "Promised Healing",
            [4] = "Promised Alleviation",
            [5] = "Promised Invigoration",
            [6] = "Promised Amelioration",
            [7] = "Promised Amendment",
            [8] = "Promised Wardmending",
            [9] = "Promised Rejuvenation",
            [10] = "Promised Recovery",
        },
        ['PetStanceSpell'] = {
            ---Pet Stance*
            [1] = "Omphacite Stance",
            [2] = "Kanoite Stance",
            [3] = "Pyroxene Stance",
            [4] = "Rhyolite Stance",
            [5] = "Shieldstone Stance",
            [6] = "Groundswell Stance",
            [7] = "Steelstance",
            [8] = "Tellurian Stance",
            [9] = "Earthen Stance",
            [10] = "Grounded Stance",
            [11] = "Granite Stance",
        },
        ['PetManaConv'] = {
            [1] = "Valiant Symbiosis",
            [2] = "Relentless Symbiosis",
            [3] = "Restless Symbiosis",
            [4] = "Burning Symbiosis",
            [5] = "Dark Symbiosis",
            [6] = "Phantasmal Symbiosis",
            [7] = "Arcane Symbiosis",
            [8] = "Spectral Symbiosis",
            [9] = "Ethereal Symbiosis",
            [10] = "Prime Symbiosis",
            [11] = "Elemental Symbiosis",
            [12] = "Elemental Simulacrum",
            [13] = "Elemental Siphon",
            [141] = "Elemental Draw",
        },
        ['PetHaste'] = {
            [1] = "Burnout XVI",
            [2] = "Burnout XV",
            [3] = "Burnout XIV",
            [4] = "Burnout XIII",
            [5] = "Burnout XII",
            [6] = "Burnout XI",
            [7] = "Burnout XI",
            [8] = "Burnout IX",
            [9] = "Burnout VIII",
            [10] = "Burnout VII",
            [11] = "Burnout VI",
            [12] = "Elemental Fury",
            [13] = "Burnout V",
            [14] = "Burnout IV",
            [15] = "Elemental Empathy",
            [16] = "Burnout III",
            [17] = "Burnout II",
            [18] = "Burnout",
        },
        ['PetIceFlame'] = {
            [1] = "IceFlame Palisade",
            [2] = "Iceflame Barricade ",
            [3] = "Iceflame Rampart",
            [4] = "Iceflame Keep",
            [5] = "Iceflame Armaments",
            [6] = "Iceflame Eminence",
            [7] = "Iceflame Armor",
            [8] = "Iceflame Ward",
            [9] = "Iceflame Efflux",
            [10] = "Iceflame Tenement",
            [11] = "Iceflame Body",
            [12] = "Iceflame Guard",
        },
        ['EarthPetSpell'] = {
            [1] = "Recruitment of Earth",
            [2] = "Conscription of Earth",
            [3] = "Manifestation of Earth",
            [4] = "Embodiment of Earth",
            [5] = "Convocation of Earth",
            [6] = "Shard of Earth",
            [7] = "Facet of Earth",
            [8] = "Construct of Earth",
            [9] = "Aspect of Earth",
            [10] = "Core of Earth",
            [11] = "Essence of Earth",
            [12] = "Child of Earth",
            [13] = "Greater Vocaration: Earth",
            [14] = "Vocarate: Earth",
            [15] = "Conjuration: Earth",
            [16] = "Lesser Conjuration: Earth",
            [17] = "Minor Conjuration: Earth",
            [18] = "Greater Summoning: Earth",
            [19] = "Summoning: Earth",
            [20] = "Lesser Summoning: Earth",
            [21] = "Minor Summoning: Earth",
            [22] = "Elemental: Earth",
            [23] = "Elementaling: Earth",
            [24] = "Elementalkin: Earth",
        },
        ['WaterPetSpell'] = {
            ----- Water Pet*
            [1] = "Recruitment of Water",
            [2] = "Conscription of Water",
            [3] = "Manifestation of Water",
            [4] = "Embodiment of Water",
            [5] = "Convocation of Water",
            [6] = "Shard of Water",
            [7] = "Facet of Water",
            [8] = "Construct of Water",
            [9] = "Aspect of Water",
            [10] = "Core of Water",
            [11] = "Essence of Water",
            [12] = "Child of Water",
            [13] = "Servant of Marr",
            [14] = "Greater Vocaration: Water",
            [15] = "Vocarate: Water",
            [16] = "Greater Conjuration: Water",
            [17] = "Conjuration: Water",
            [18] = "Lesser Conjuration: Water",
            [19] = "Minor Conjuration: Water",
            [20] = "Greater Summoning: Water",
            [21] = "Summoning: Water",
            [22] = "Lesser Summoning: Water",
            [23] = "Minor Summoning: Water",
            [24] = "Elemental: Water",
            [25] = "Elementaling: Water",
            [26] = "Elementalkin: Water",
        },
        ['AirPetSpell'] = {
            ----- Air Pet*
            [1] = "Recruitment of Air",
            [2] = "Conscription of Air",
            [3] = "Manifestation of Air",
            [4] = "Embodiment of Air",
            [5] = "Convocation of Air",
            [6] = "Shard of Air",
            [7] = "Facet of Air",
            [8] = "Construct of Air",
            [9] = "Aspect of Air",
            [10] = "Core of Air",
            [11] = "Essence of Air",
            [12] = "Child of Wind",
            [13] = "Ward of Xegony",
            [14] = "Greater Vocaration: Air",
            [15] = "Vocarate: Air",
            [16] = "Greater Conjuration: Air",
            [17] = "Conjuration: Air",
            [18] = "Lesser Conjuration: Air",
            [19] = "Minor Conjuration: Air",
            [20] = "Greater Summoning: Air",
            [21] = "Summoning: Air",
            [22] = "Lesser Summoning: Air",
            [23] = "Minor Summoning: Air",
            [24] = "Elemental: Air",
            [25] = "Elementaling: Air",
            [26] = "Elementalkin: Air",
        },
        ['FirePetSpell'] = {
            [1] = "Recruitment of Fire",
            [2] = "Conscription of Fire",
            [3] = "Manifestation of Fire",
            [4] = "Embodiment of Fire",
            [5] = "Convocation of Fire",
            [6] = "Shard of Fire",
            [7] = "Facet of Fire",
            [8] = "Construct of Fire",
            [9] = "Aspect of Fire",
            [10] = "Core of Fire",
            [11] = "Essence of Fire",
            [12] = "Child of Fire",
            [13] = "Child of Ro",
            [14] = "Greater Vocaration: Fire",
            [15] = "Vocarate: Fire",
            [16] = "Greater Conjuration: Fire",
            [17] = "Conjuration: Fire",
            [18] = "Lesser Conjuration: Fire",
            [19] = "Minor Conjuration: Fire",
            [20] = "Greater Summoning: Fire",
            [21] = "Summoning: Fire",
            [22] = "Lesser Summoning: Fire",
            [23] = "Minor Summoning: Fire",
            [24] = "Elemental: Fire",
            [25] = "Elementaling: Fire",
            [26] = "Elementalkin: Fire",
        },
        ['AegisBuff'] = {
            ---Pet Aegis Shield Buff (Short Duration)*
            [1] = "Aegis of Valorforged",
            [2] = "Auspice of Valia",
            [3] = "Aegis of Rumblecrush",
            [4] = "Auspice of Kildrukaun",
            [5] = "Aegis of Orfur",
            [6] = "Auspice of Esianti",
            [7] = "Aegis of Zeklor",
            [8] = "Aegis of Japac",
            [9] = "Auspice of Eternity",
            [10] = "Aegis of Nefori",
            [11] = "Auspice of Shadows",
            [12] = "Aegis of Kildrukaun",
            [13] = "Aegis of Calliav",
            [14] = "Bulwark of Calliav",
            [15] = "Protection of Calliav",
            [16] = "Guard of Calliav",
            [17] = "Ward of Calliav",
        },
        ['PetManaNuke'] = {
            --- PetManaNuke
            [1] = "Thaumatize Pet",
        },
        -- - Summoned item Spells
        ['PetArmorSummon'] = {
            -- >=LVL71
            [1] = "Grant The Alloy's Plate",
            [2] = "Grant the Centien's Plate",
            [3] = "Grant Ocoenydd's Plate",
            [4] = "Grant Wirn's Plate",
            [5] = "Grant Thassis' Plate",
            [6] = "Grant Frightforged Plate",
            [7] = "Grant Manaforged Plate",
            [8] = "Grant Spectral Plate",
            [9] = "Summon Plate of the Prime",
            [10] = "Summon Plate of the Elements",
        },
        ['PetWeaponSummon'] = {
            [1] = "Grant Goliath's Armaments",
            [2] = "Grant Shak Dathor's Armaments",
            [3] = "Grant Yalrek's Armaments",
            [4] = "Grant Wirn's Armaments",
            [5] = "Grant Thassis' Armaments",
            [6] = "Grant Frightforged Armaments",
            [7] = "Grant Manaforged Armaments",
            [8] = "Grant Spectral Armaments",
            [9] = "Summon Ethereal Armaments",
            [10] = "Summon Prime Armaments",
            [11] = "Summon Elemental Armaments",
        },
        ['PetHeirloomSummon'] = {
            [1] = "Grant Ankexfen's Heirlooms",
            [2] = "Grant the Diabo's Heirlooms",
            [3] = "Summon Nastel's Heirlooms",
            [4] = "Summon Zabella's Heirlooms",
            [5] = "Grant Enibik's Heirlooms",
            [6] = "Grant Atleris' Heirlooms",
            [7] = "Grant Nint's Heirlooms",
            [8] = "Grant Calix's Heirlooms",
            [9] = "Grant Ioulin's Heirlooms",
            [10] = "Grant Crystasia's Heirlooms",
        },
        ['IceOrbSummon'] = {
            [1] = "Grant Frostbound Paradox",
            [2] = "Grant Icebound Paradox",
            [3] = "Grant Frostrift Paradox",
            [4] = "Grant Glacial Paradox",
            [5] = "Summon Frigid Paradox",
            [6] = "Summon Gelid Paradox",
            [7] = "Summon Wintry Paradox",
        },
        ['FireOrbSummon'] = {
            [1] = "Summon Molten Komatiite Orb",
            [2] = "Summon Firebound Orb",
            [3] = "Summon Blazing Orb",
            [4] = "Summon: Molten Orb",
            [5] = "Summon: Lava Orb",
        },
        ['EarthPetItemSummon'] = {
            [1] = "Summon Valorous Servant",
            [2] = "Summon Forbearing Servant",
            [3] = "Summon Imperative Servant",
            [4] = "Summon Insurgent Servant",
            [5] = "Summon Mutinous Servant",
            [6] = "Summon Imperious Servant",
            [7] = "Summon Exigent Servant",
        },
        ['FirePetItemSummon'] = {
            [1] = "Summon Valorous Minion",
            [2] = "Summon Forbearing Minion",
            [3] = "Summon Imperative Minion",
            [4] = "Summon Insurgent Minion",
            [5] = "Summon Mutinous Minion",
            [6] = "Summon Imperious Minion",
            [7] = "Summon Exigent Minion",
        },
        ['ManaRodSummon'] = {
            --- ManaRodSummon - Focuses on group mana rod summon for ease. _
            --  - no TOL spell?
            [1] = "Mass Dark Transvergence",
            [2] = "Mass Dark Transvergence",
            [3] = "Mass Arcane Transvergence",
            [4] = "Mass Spectral Transvergence",
            [5] = "Mass Ethereal Transvergence",
            [6] = "Mass Prime Transvergence",
            [7] = "Mass Elemental Transvergence",
            [8] = "Mass Mystical Transvergence",
            [9] = "Modulating Rod"
        },
        ['SelfManaRodSummon'] = {
            ---, - Focuses on self mana rod summon separate from other timers. >95
            [1] = "Rod of Courageous Modulation",
            [2] = "Sickle of Umbral Modulation",
            [3] = "Wand of Frozen Modulation",
            [4] = "Wand of Burning Modulation",
            [5] = "Wand of Dark Modulation",
            [6] = "Wand of Phantasmal Modulation",
        },
        -- - Debuffs
        ['MaloDebuff'] = {
            -- line < LVL 75 @ LVL75 use the AA
            [1] = "Malosinera",
            [2] = "Malosinetra",
            [3] = "Malosinara",
            [4] = "Malosinata",
            [5] = "Malosenete",
            [6] = "Malosenia",
            [7] = "Maloseneta",
            [8] = "Malosene",
            [9] = "Malosenea",
            [10] = "Malosinatia",
            [11] = "Malosinise",
            [12] = "Malosinia",
            [13] = "Mala",
            [14] = "Malosini",
            [15] = "Malosi",
            [16] = "Malaisement",
            [17] = "Malaise",
        },
    },
    ['Rotations'] = {
        ['Tank'] = {
            ['Rotation'] = {
                ['Burn'] = {
                    [1] = {},
                },
                ['Debuff'] = {
                    [1] = {},
                },
                ['Heal'] = {
                    [1] = {},
                },
                ['DPS'] = {
                    [1] = {},
                },
                ['Downtime'] = {
                    [1] = {},
                },
            },
            ['Spells'] = {
                [1] = { name = "", gem = 1 },
                [2] = { name = "", gem = 2 },
                [3] = { name = "", gem = 3 },
                [4] = { name = "", gem = 4 },
                [5] = { name = "", gem = 5 },
                [6] = { name = "", gem = 6 },
                [7] = { name = "", gem = 7 },
                [8] = { name = "", gem = 8 },
                [9] = { name = "", gem = 9 },
                [10] = { name = "", gem = 10 },
                [11] = { name = "", gem = 11 },
                [12] = { name = "", gem = 12 },
            },
        },
        ['DPS'] = {
            ['Rotation'] = {
                ['Burn'] = {
                    [1] = {},
                },
                ['Debuff'] = {
                    [1] = {},
                },
                ['Heal'] = {
                    [1] = {},
                },
                ['DPS'] = {
                    [1] = {},
                },
                ['Downtime'] = {
                    [1] = {},
                },
            },
            ['Spells'] = {
                [1] = { name = "", gem = 1 },
                [2] = { name = "", gem = 2 },
                [3] = { name = "", gem = 3 },
                [4] = { name = "", gem = 4 },
                [5] = { name = "", gem = 5 },
                [6] = { name = "", gem = 6 },
                [7] = { name = "", gem = 7 },
                [8] = { name = "", gem = 8 },
                [9] = { name = "", gem = 9 },
                [10] = { name = "", gem = 10 },
                [11] = { name = "", gem = 11 },
                [12] = { name = "", gem = 12 },
            },
        },
        ['Healer'] = {
            ['Rotation'] = {
                ['Burn'] = {
                    [1] = {},
                },
                ['Debuff'] = {
                    [1] = {},
                },
                ['Heal'] = {
                    [1] = {},
                },
                ['DPS'] = {
                    [1] = {},
                },
                ['Downtime'] = {
                    [1] = {},
                },
            },
            ['Spells'] = {
                [1] = { name = "", gem = 1 },
                [2] = { name = "", gem = 2 },
                [3] = { name = "", gem = 3 },
                [4] = { name = "", gem = 4 },
                [5] = { name = "", gem = 5 },
                [6] = { name = "", gem = 6 },
                [7] = { name = "", gem = 7 },
                [8] = { name = "", gem = 8 },
                [9] = { name = "", gem = 9 },
                [10] = { name = "", gem = 10 },
                [11] = { name = "", gem = 11 },
                [12] = { name = "", gem = 12 },
            },
        },
        ['Hybrid'] = {
            ['Rotation'] = {
                ['Burn'] = {
                    [1] = {},
                },
                ['Debuff'] = {
                    [1] = {},
                },
                ['Heal'] = {
                    [1] = {},
                },
                ['DPS'] = {
                    [1] = {},
                },
                ['Downtime'] = {
                    [1] = {},
                },
            },
            ['Spells'] = {
                [1] = { name = "", gem = 1 },
                [2] = { name = "", gem = 2 },
                [3] = { name = "", gem = 3 },
                [4] = { name = "", gem = 4 },
                [5] = { name = "", gem = 5 },
                [6] = { name = "", gem = 6 },
                [7] = { name = "", gem = 7 },
                [8] = { name = "", gem = 8 },
                [9] = { name = "", gem = 9 },
                [10] = { name = "", gem = 10 },
                [11] = { name = "", gem = 11 },
                [12] = { name = "", gem = 12 },
            },
        },
        ['DefaultConfig'] = {
            ['Mode'] = '1',
        },
    },
}
