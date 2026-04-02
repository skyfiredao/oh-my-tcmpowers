# Oh My TCM Powers (oh-my-tcmpowers)

**[中文文档](README_zh.md)**

An AI skill set + agent orchestration layer for **analyzing Traditional Chinese Medicine (TCM) formulas, symptoms, pulse patterns, and acupoints** through the *Fuxingjue* (辅行诀) five-phase (wuxing) framework. 3 agents handle entry routing, context isolation, and parallel dispatch; 14 specialized skills provide pure domain knowledge covering core theory, formula composition rules, acupuncture point selection rules, pulse diagnosis, and analysis methods. Symptom analysis simultaneously derives herbal formulas and acupuncture point combinations, forming dual-path cross-validation; pulse diagnosis provides an independent reverse-validation channel.

## What It Does

Oh My TCM Powers provides a structured, rule-driven framework for analyzing herbal formulas, acupoint combinations, and clinical symptoms using the *Fuxingjue* theory system. It deduces therapeutic mechanisms through five-phase relationships, ti-yong-hua (body-function-transformation) layering, and quantified composition rules.

- **3 agents + 14 skills**: agents handle routing and orchestration, skills provide pure domain knowledge
- **Three-layer architecture**: agent (routing/orchestration/archive) → skill (core theory/rules/analysis methods) → data (herb tables/acupoint tables/symptom data)
- **Parallel dual-path analysis**: symptom analysis simultaneously derives herbal formula and acupuncture point combination, with convergence and divergence comparison
- **Bidirectional analysis**: formula→symptom and symptom→formula, cross-validating each other
- **Five-phase mutual containment table**: 60 medicinals (25 herbal + 30 mineral + 5 supplementary) mapped to 25 positions in a 5×5 matrix
- **10-position ti-yong expansion sequence**: cyclic mapping of body (ti) and function (yong) flavors across five phases
- **Verified composition rules** for supplement (bu) and drain (xie) formulas, validated against all 24 classical five-organ formulas
- **Synthesized hua-flavor**: ti-flavor + yong-flavor can synthesize hua-flavor at reduced potency (<50%), a core-level mechanism applicable to all rule branches
- **Dosage ratio patterns**: 3:1 sovereign-to-minister (jun:chen) ratio for supplement formulas (sovereign dose is 3× minister dose), organ-specific ratios for drain formulas
- **Heart-spirit (xinshen) special logic**: virtual organ independent of five phases, with inverted supplement/drain semantics and solvent participation
- **External-contraction formulas (erldan liushen)**: 16 formulas treating external contraction through six directional positions (four cardinal + central upper/lower), independent of the five-organ supplement/drain system
- **Dual-layer flavor system**: each medicinal has two flavor layers, both usable for expansion sequence matching
- **Three-branch routing**: automatic selection of five-organ, heart-spirit, or external-contraction rules based on five-phase structural analysis
- **Six-channel (liujing) pattern differentiation**: six-channel theory integrated into acupuncture core, with channel-to-formula mapping for Shanghan (cold-damage) staging
- **Wei-Qi-Ying-Xue (defense-qi-nutrient-blood) staging**: four-level warm-disease depth staging framework for diagnostic differentiation (pure diagnostic tool, independent of formula selection)
- **Sanjiao (triple-burner) staging**: three-burner warm-disease spatial staging framework for diagnostic differentiation (pure diagnostic tool, independent of formula selection)
- **Acupuncture subsystem**: 3 additional skills for meridian-organ analysis and acupoint selection using 12 classical point selection methods
- **20 acupoint data files**: 12 regular meridians + 8 extraordinary meridians with point names, five-phase attributes, and special point classifications
- **Pulse diagnosis (maizhen) module**: 27-pulse classification system based on Wang Shuhe's *Maijing* and Li Shizhen's *Binhu Maixue*, providing reverse-validation of symptom-based diagnosis through pulse-to-organ-pathology mapping
- **Analysis archive**: each analysis session writes input, analysis process, and results to timestamped directories for research traceability

## Agent Overview

| Agent | Role |
|---|---|
| `omtp-agent-BianQue`（扁鹊） | General practitioner, strongest in diagnosis. Entry routing, dispatch, archive management, result summary |
| `omtp-agent-TaoHongJing`（陶弘景） | Herbal medicine expert. Loads core-fxj, routes to rule branch, executes complete derivation chain |
| `omtp-agent-HuangFuMi`（皇甫谧） | Acupuncture expert. Loads core-zj + rules-zj + rules-ziwu-liuzhu, organ-to-meridian mapping, 12-method point selection + chronoacupuncture |

## Skill Overview

### Core Layer

| Skill | Purpose |
|---|---|
| `omtp-core-fxj` | Core theory: five-phase relationships, organ-flavor mapping, ti-yong-hua structure, 10-position expansion sequence, 60-medicinal mutual containment table, synthesized hua-flavor rules |

### Rule Layer (loaded by agents based on analysis results)

| Skill | Purpose |
|---|---|
| `omtp-rules-fxj5z` | Five-organ supplement/drain formula rules: composition rules for small/large supplement and drain formulas, dosage ratio patterns, cross-phase pairings |
| `omtp-rules-fxj1xz` | Heart-spirit (xinshen) formula rules: virtual organ independent of five phases, inverted supplement/drain logic, solvent participation, unique formula structures |
| `omtp-rules-fxj2d6s` | External-contraction formula rules: two-dawn (erldan) and six-spirit (liushen) formulas, six directional positions, herb-symptom fitting for 16 classical formulas |
| `omtp-rules-wei-qi-ying-xue` | Wei-Qi-Ying-Xue (defense-qi-nutrient-blood) warm-disease staging: four-level diagnostic staging framework for warm-disease depth differentiation |
| `omtp-rules-sanjiao` | Sanjiao (triple-burner) warm-disease staging: three-burner diagnostic staging framework for warm-disease spatial differentiation |

### Analysis Method Layer (loaded by agents, providing domain methods without routing logic)

| Skill | Loaded by | Purpose |
|---|---|---|
| `omtp-analyze-fangji` | omtp-agent-TaoHongJing | Herb five-phase positioning + whole-formula statistical feature methods |
| `omtp-analyze-zhengzhuang` | omtp-agent-BianQue | Symptom extraction + organ mapping + convergence + generation-control chain verification methods |
| `omtp-analyze-maizhen` | omtp-agent-BianQue | Pulse pattern extraction + organ-pathology mapping + cross-validation against symptom analysis (conditionally loaded when pulse data present) |

### Acupuncture Core Layer

| Skill | Purpose |
|---|---|
| `omtp-core-zj` | Acupuncture core theory: five-phase basics (independent of herbal flavor system), zang-fu interior-exterior pairing, meridian five-phase attribution, five-shu-point five-phase properties, special point classification |

### Acupuncture Rule Layer

| Skill | Purpose |
|---|---|
| `omtp-rules-zj` | Acupoint selection rules: 12 methods (five-shu-point selection, mother-child tonification/sedation, interior-exterior pairing, yuan-luo pairing, shu-mu pairing, xi-cleft points, eight influential points, lower he-sea points, four/eight general points, miu-ci cross needling, meeting point selection (huixue), general selection principles) |
| `omtp-rules-ziwu-liuzhu` | Chronoacupuncture (ziwu liuzhu) point selection: complete derivation algorithms for four classical methods (nazi, najia, lingui bafa, feiteng bafa), including stem-branch calculation, lookup tables, and worked examples |

### Acupuncture Analysis Method Layer

| Skill | Loaded by | Purpose |
|---|---|---|
| `omtp-analyze-zhenjiu` | omtp-agent-HuangFuMi | Acupoint analysis + meridian attribution identification + point selection method matching (research-oriented) |

## Architecture

### Layered Overview

```
User Input
  ↓
Agent Layer (routing + orchestration + archive)
  BianQue (扁鹊)             # general practitioner, diagnosis, dispatch, summary
    ├── TaoHongJing (陶弘景) # herbal medicine expert
    └── HuangFuMi (皇甫谧)  # acupuncture expert

  ↓ loads

Skill Layer (pure domain knowledge, no routing)

  Analysis Methods
    analyze-fangji          # herb positioning + statistics
    analyze-zhengzhuang     # symptom extraction + organ map
    analyze-maizhen         # pulse diagnosis + cross-validation
    analyze-zhenjiu         # acupoint analysis + matching

  Core Theory
    core-fxj                # five-phase, ti-yong-hua, 60 herbs
    core-zj                 # meridians, five-shu-points

  Rules
    rules-fxj5z             # five-organ supplement/drain
    rules-fxj1xz            # heart-spirit virtual organ
    rules-fxj2d6s           # external-contraction (2dawn+6spirit)
    rules-wei-qi-ying-xue   # warm-disease depth staging
    rules-sanjiao           # warm-disease spatial staging
    rules-zj                # 12 point selection methods
    rules-ziwu-liuzhu       # chronoacupuncture (ziwu liuzhu)

  ↓ symlinks to archive

Data Layer (read-only, symlinked per session)
  fxj-zhengzhuang.md        # symptom baseline data
  fxj-maixiang.md            # pulse diagnosis reference data (27 pulses)
  shanghan-liujing.md        # six-channel to formula mapping
  wenbing-wei-qi-ying-xue.md # warm-disease four-level staging data
  wenbing-sanjiao.md         # warm-disease three-burner data
  zj-12zj-*.md              # 12 regular meridian acupoints
  zj-qj8m-*.md              # 8 extraordinary meridian points
```

### Agent Layer

Agent definitions are platform-agnostic Markdown files describing roles, skill loading manifests, routing rules, and input/output protocols. Any platform supporting an agent mechanism can load and use them.

| Agent | Responsibility |
|---|---|
| `omtp-agent-BianQue`（扁鹊） | General practitioner, strongest in diagnosis. Determines entry type by **input format**, creates archive, dispatches experts, summarizes results |
| `omtp-agent-TaoHongJing`（陶弘景） | Herbal medicine expert: loads core-fxj, routes to one rule branch (fxj5z/fxj1xz/fxj2d6s), executes derivation chain |
| `omtp-agent-HuangFuMi`（皇甫谧） | Acupuncture expert: loads core-zj + rules-zj + rules-ziwu-liuzhu, organ-to-meridian mapping, 12-method point selection + chronoacupuncture |

Context isolation: omtp-agent-TaoHongJing is prohibited from loading any zj-related resources; omtp-agent-HuangFuMi is prohibited from loading any fxj-related resources. The two experts complete their derivations independently, and the router collects and cross-checks their conclusions.

### Routing Design

Three entry points, routed by input format (not content-driven):

| Entry | Trigger | Dispatch |
|---|---|---|
| **zhengzhuang (symptom)** | Chief complaint, symptom descriptions, illness narrative | Generate shared analysis contract, then dispatch TaoHongJing + HuangFuMi **in parallel** |
| **fangji (formula)** | Herb name list, dosages, preparation instructions | **Single-path** to TaoHongJing |
| **zhenjiu (acupoint)** | Acupoint name list, point combinations | **Single-path** to HuangFuMi |

### Analysis Archive

Each analysis creates a `docs/YYMMDD-hhmmss/` timestamped directory. All input, intermediate artifacts, and result files are written to that directory. File prefixes identify entry type (`zz-`/`fj-`/`zj-`); the `shared-` prefix identifies files shared across multiple agents. Each file header contains HTML comment metadata (entry type, producer, timestamp).

Expert agents symlink required data files from `data/` into the archive directory during analysis. Downstream rule branches read data exclusively from the archive directory, never directly from `data/`. This makes each archive self-contained and traceable.

`shared-zhengzhuang-analyze.md` is the key shared contract for the symptom entry, and must contain 5 mandatory sections (symptom extraction, organ mapping, convergence results, generation-control chain verification, eight-principle pattern synthesis) plus an optional 6th section (pulse cross-validation) when pulse data is present in the input.

### Skill Layer

Skills are pure domain knowledge files with no routing logic or workflow orchestration. They are loaded by agents on demand.

## Prerequisites

- [OpenCode](https://opencode.ai) with [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) installed

## Installation

```bash
# Clone or copy the oh-my-tcmpowers directory
cd oh-my-tcmpowers

# Install skills and agents
chmod +x install.sh
./install.sh
```

This creates symlinks for all `omtp-*` skills to `~/.config/opencode/skills/` and all `omtp-agent-*` agents to `~/.config/opencode/agents/`. If oh-my-openagent is detected, agents are also linked to `~/.claude/agents/`.

## Uninstallation

```bash
./uninstall.sh
```

Removes all `omtp-*` symlinks from `~/.config/opencode/skills/`, `~/.config/opencode/agents/`, and `~/.claude/agents/`.

## Usage

### Analyzing a Formula

```
分析方剂：桂枝三两、芍药三两、甘草二两、生姜二两、大枣十二枚
```

```
User Input (formula)
  1. BianQue identifies input type
  2. dispatch TaoHongJing
     2a. load core-fxj          (five-phase lookup)
     2b. load analyze-fangji    (structural analysis)
     2c. route to rule branch   (output derivation chain)
```

### Analyzing Symptoms

```
患者心下痞满，食欲不振，四肢倦怠，大便溏薄
```

```
User Input (symptoms)
  → BianQue
      1. load analyze-zhengzhuang (extract symptoms, map to organs)
      2. parallel dispatch:
         → TaoHongJing (herbal formula derivation)
         → HuangFuMi   (acupoint combination derivation)
      3. convergence check: compare therapeutic targets from both paths
```

### Analyzing Acupoint Combinations

```
分析配穴：合谷、太冲、足三里、三阴交
```

```
User Input (acupoints)
  1. BianQue identifies input type
  2. dispatch HuangFuMi
     2a. load core-zj           (meridian-organ mapping)
     2b. load analyze-zhenjiu   (structural analysis)
     2c. match rules-zj methods (output therapeutic target)
```

### Cross-Validation

The three entry points support cross-validation:

1. **Formula → Symptom**: deduce what symptoms a known formula should treat
2. **Symptom → Formula + Acupoint**: derive both herbal formula and acupoint combination in parallel
3. **Acupoint → Therapeutic Target**: deduce therapeutic target from an acupoint combination

Convergence across paths validates the analysis; divergence reveals areas for further investigation.

> **Notes**:
> - Formula output provides **composition ratios only**, not absolute dosages, unless the user anchors one herb's weight
> - This system uses *Fuxingjue* flavor assignments, which differ from mainstream TCM; do not mix frameworks
> - Medicinals with disputed five-phase classification are marked (存疑) in sub-tables

## Project Structure

```
oh-my-tcmpowers/
├── install.sh                                  # Symlink installer
├── uninstall.sh                                # Symlink remover
├── README.md                                   # English documentation
├── README_zh.md                                # Chinese documentation
├── agents/
│   ├── omtp-agent-BianQue.md                   # BianQue (扁鹊) general practitioner + diagnosis + routing
│   ├── omtp-agent-TaoHongJing.md               # TaoHongJing (陶弘景) herbal medicine expert
│   └── omtp-agent-HuangFuMi.md                 # HuangFuMi (皇甫谧) acupuncture expert
├── data/
│   ├── fxj-zhengzhuang.md                      # Symptom analysis baseline data
│   ├── fxj-maixiang.md                          # Pulse diagnosis reference data (27 pulses)
│   ├── shanghan-liujing.md                      # Six-channel to erldan-liushen formula mapping
│   ├── wenbing-wei-qi-ying-xue.md               # Warm-disease four-level staging data
│   ├── wenbing-sanjiao.md                       # Warm-disease three-burner staging data
│   ├── zj-12zj-*.md                            # 12 regular meridian acupoint data files
│   └── zj-qj8m-*.md                            # 8 extraordinary meridian acupoint data files
├── docs/
│   └── YYMMDD-hhmmss/                          # Analysis archives (input, process, results)
└── skills/
    ├── omtp-core-fxj/                           # Core theory (five-phase, ti-yong-hua, 60 medicinals, synthesized hua-flavor)
    ├── omtp-core-zj/                            # Acupuncture core theory (meridian attribution, five-shu-point properties)
    ├── omtp-rules-fxj5z/                        # Five-organ supplement/drain rules
    ├── omtp-rules-fxj1xz/                       # Heart-spirit virtual organ rules
    ├── omtp-rules-fxj2d6s/                      # External-contraction formula rules (two-dawn + six-spirit)
    ├── omtp-rules-wei-qi-ying-xue/              # Warm-disease depth staging rules (wei-qi-ying-xue)
    ├── omtp-rules-sanjiao/                      # Warm-disease spatial staging rules (triple-burner)
    ├── omtp-rules-zj/                           # Acupoint selection rules (12 methods)
    ├── omtp-rules-ziwu-liuzhu/                  # Chronoacupuncture point selection (ziwu liuzhu four methods)
    ├── omtp-analyze-fangji/                     # Herb positioning + whole-formula statistical methods
    ├── omtp-analyze-zhengzhuang/                # Symptom extraction + organ mapping methods
    ├── omtp-analyze-maizhen/                    # Pulse diagnosis + cross-validation methods
    └── omtp-analyze-zhenjiu/                    # Acupoint analysis + point selection method matching
```

## Coexistence with Other Skills

Oh My TCM Powers is completely independent of other skill sets. All skills are prefixed with `omtp-` and installed via symlinks, ensuring no interference with coding skills (Superpowers) or writing skills (Dreampowers).

## Classical Text References

The system references the following classical texts:

| Text | Author | Dynasty | Usage |
|------|--------|---------|-------|
| 《脉经》(*Maijing*) | 王叔和 (Wang Shuhe) | Jin (晋) | 24-pulse classification baseline, cun-guan-chi (寸关尺) six-position organ mapping, five-phase pulse circulation sequence |
| 《濒湖脉学》(*Binhu Maixue*) | 李时珍 (Li Shizhen) | Ming (明) | 27-pulse classification system (added 长/短/牢, replaced 软 with 濡), pulse body-state poems, similar-pulse poems, disease-indication poems |
| 《伤寒论》(*Shanghan Lun*) | 张仲景 (Zhang Zhongjing) | Han (汉) | Six-channel (六经) pattern differentiation: stage definitions, transmission models, channel-formula correspondence |
| 《温热论》(*Wenre Lun*) | 叶天士 (Ye Tianshi) | Qing (清) | Wei-Qi-Ying-Xue four-level staging system for warm diseases |
| 《温病条辨》(*Wenbing Tiaobian*) | 吴鞠通 (Wu Jutong) | Qing (清) | Triple-burner (三焦) spatial staging system for warm diseases |

## License

GPL-3.0
