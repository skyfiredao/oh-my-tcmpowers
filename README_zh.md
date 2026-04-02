# Oh My TCM Powers (oh-my-tcmpowers)

**[English](README.md)**

一套 AI 技能集 + agent 编排层，基于**辅行诀五行五味五脏**理论体系，对中医方剂、症状、脉象与针灸穴位进行结构化分析。3 个 agent 负责入口路由、上下文隔离与并行调度，14 个 skill 提供纯领域知识，覆盖核心理论、组方规则、针灸取穴规则、脉象诊断和分析方法。症状分析时同时推导草药方剂和针灸取穴组合，形成双路径交叉验证；脉诊提供独立的逆向验证通道。

## 功能

Oh My TCM Powers 提供了一套结构化、规则驱动的分析框架，用辅行诀理论体系分析方剂、临床症状和针灸取穴。通过五行生克、体用化分层和量化组方规则来推导治疗机理。

- **3 个 agent + 14 个 skill**，agent 负责路由和编排，skill 负责纯领域知识
- **三层架构**：agent（路由/编排/档案）→ skill（核心理论/规则/分析方法）→ data（药物表/穴位表/症状数据）
- **并行双链路分析**：辨症分析同时推导草药方剂和针灸取穴组合，收敛/分歧对比
- **双向分析**：方剂→症状 和 症状→方剂，互为交叉验证
- **五行互含总表**：60 味药（草药 25 味 + 金石 30 味 + 补遗 5 味）映射到 5×5 矩阵的 25 个位置
- **10 位体用展开序列**：五行体味和用味交替排列的循环序列
- **已验证的组方规则**：补方和泻方的组方规则，经全部 24 首五脏经方验证通过
- **化味合成**：体味 + 用味可合成化味（效果 <50%），核心层通用机制，适用于所有规则分支
- **剂量比例规律**：补方君臣 3:1（君药剂量为臣药的 3 倍），泻方因脏腑而异
- **心神虚脏特殊逻辑**：独立于五行的虚脏，补泻语义反转，溶剂参与组方
- **外感方二旦六神**：16 首外感方，二旦为阴阳（日月），六神为六个方位（东西南北+中央上下），独立于五脏补泻体系
- **双层味体系**：每味药具有两层味属性，匹配展开序列时两层均可用
- **三分支路由**：根据五行结构分析结果自动选择五脏、心神或外感方规则
- **六经辨证**：六经理论整合于针灸核心层，含六经→辅行诀二旦六神方剂的对应映射，用于伤寒分期
- **卫气营血辨证**：四级温病深度分期框架，用于诊断辨证（纯诊断工具，独立于方剂选择）
- **三焦辨证**：三焦温病空间分期框架，用于诊断辨证（纯诊断工具，独立于方剂选择）
- **针灸子系统**：3 个技能用于经络脏腑分析和取穴选配，包含 12 种经典取穴法
- **20 个穴位数据文件**：十二正经 12 个 + 奇经八脉 8 个，含穴名、五行属性和特定穴分类
- **脉诊模块**：基于王叔和《脉经》与李时珍《濒湖脉学》的 27 脉分类体系，通过脉象-脏腑-病机映射为症状诊断提供逆向验证通道
- **分析档案**：每次分析写入时间戳目录，记录输入、分析过程和结果，便于研究追溯

## Agent 一览

| Agent | 角色 |
|---|---|
| `omtp-agent-BianQue`（扁鹊） | 全科专家，最擅长诊断。入口路由、派发、档案管理、结果汇总 |
| `omtp-agent-TaoHongJing`（陶弘景） | 中药专家。加载 core-fxj，按分析结果路由到规则分支，执行完整推导链 |
| `omtp-agent-HuangFuMi`（皇甫谧） | 针灸专家。加载 core-zj + rules-zj + rules-ziwu-liuzhu，脏→经络映射，12 法取穴 + 子午流注取穴 |

## 技能一览

### 核心层

| 技能 | 用途 |
|---|---|
| `omtp-core-fxj` | 核心理论：五行生克、脏味对应、体用化结构、10 位展开序列、60 味五行互含范例表、化味合成规则 |

### 规则层（由 agent 按分析结果路由加载）

| 技能 | 用途 |
|---|---|
| `omtp-rules-fxj5z` | 五脏补泻组方规则：小/大补泻方的组方规则、剂量比例、跨行配伍 |
| `omtp-rules-fxj1xz` | 心神虚脏组方规则：独立于五行的虚脏、补泻逻辑反转、溶剂参与、特殊方剂结构 |
| `omtp-rules-fxj2d6s` | 外感方组方规则：二旦六神大小汤、六方位对治、16 首经方的药症拟合 |
| `omtp-rules-wei-qi-ying-xue` | 卫气营血温病分期：四级诊断分期框架，用于温病深浅辨证 |
| `omtp-rules-sanjiao` | 三焦温病分期：上中下三焦诊断分期框架，用于温病空间辨证 |

### 分析方法层（被 agent 加载后提供领域方法，不含路由逻辑）

| 技能 | 被谁加载 | 用途 |
|---|---|---|
| `omtp-analyze-fangji` | omtp-agent-TaoHongJing | 药物五行定位 + 全方统计特征方法 |
| `omtp-analyze-zhengzhuang` | omtp-agent-BianQue | 症状提取 + 脏腑映射 + 汇聚 + 生克链验证方法 |
| `omtp-analyze-maizhen` | omtp-agent-BianQue | 脉象提取 + 脏腑病机映射 + 与症状分析交叉验证（输入含脉象时条件加载） |

### 针灸核心层

| 技能 | 用途 |
|---|---|
| `omtp-core-zj` | 针灸核心理论：五行基础（独立于草药五味体系）、五脏六腑表里关系、经络五行归属、五俞穴五行属性、特定穴分类 |

### 针灸规则层

| 技能 | 用途 |
|---|---|
| `omtp-rules-zj` | 取穴规则：12 种取穴法（五俞穴取穴、子母补泻、表里经配穴、原络配穴、俞募配穴、郄穴取穴、八会穴取穴、下合穴取穴、八总穴/四总穴、缪刺、会穴取穴、选穴原则） |
| `omtp-rules-ziwu-liuzhu` | 子午流注取穴法：纳子法、纳甲法、灵龟八法、飞腾八法四种时间取穴法的完整推导算法，含干支计算、查表规则和验算范例 |

### 针灸分析方法层

| 技能 | 被谁加载 | 用途 |
|---|---|---|
| `omtp-analyze-zhenjiu` | omtp-agent-HuangFuMi | 穴位分析 + 经络归属识别 + 取穴法匹配方法（研究型入口） |

## 架构

### 分层总览

```
用户输入
  ↓
Agent 层 (路由 + 编排 + 档案管理)
  扁鹊 (BianQue)             # 全科专家、诊断、派发、汇总
    ├── 陶弘景 (TaoHongJing) # 中药专家
    └── 皇甫谧 (HuangFuMi)  # 针灸专家

  ↓ 加载

Skill 层 (纯领域知识，无路由逻辑)

  分析方法
    analyze-fangji          # 药物定位 + 全方统计
    analyze-zhengzhuang     # 症状提取 + 脏腑映射
    analyze-maizhen         # 脉象诊断 + 交叉验证
    analyze-zhenjiu         # 穴位分析 + 取穴法匹配

  核心理论
    core-fxj                # 五行、体用化、60味药表
    core-zj                 # 经络脏腑、五俞穴属性

  规则
    rules-fxj5z             # 五脏补泻规则
    rules-fxj1xz            # 心神虚脏规则
    rules-fxj2d6s           # 外感方规则 (二旦六神)
    rules-wei-qi-ying-xue   # 温病深度分期规则
    rules-sanjiao           # 温病空间分期规则
    rules-zj                # 取穴规则 (12法)
    rules-ziwu-liuzhu       # 子午流注取穴法

  ↓ 按需 symlink 到档案目录

Data 层 (只读，按次 symlink)
  fxj-zhengzhuang.md        # 症状匹配基准数据
  fxj-maixiang.md            # 脉象诊断参考数据（27脉）
  shanghan-liujing.md        # 六经→方剂映射
  wenbing-wei-qi-ying-xue.md # 温病四级分期数据
  wenbing-sanjiao.md         # 温病三焦分期数据
  zj-12zj-*.md              # 十二正经穴位数据
  zj-qj8m-*.md              # 奇经八脉穴位数据
```

### Agent 层

Agent 定义是平台无关的 Markdown 文件，描述角色、技能加载清单、路由规则和输入输出协议。任何支持 agent 机制的平台都可以加载使用。

| Agent | 职责 |
|---|---|
| `omtp-agent-BianQue`（扁鹊） | 全科专家，最擅长诊断。按**格式形态**判定入口类型，创建档案，派发专家 agent，汇总结果 |
| `omtp-agent-TaoHongJing`（陶弘景） | 中药专家：加载 core-fxj，路由到唯一规则分支（fxj5z/fxj1xz/fxj2d6s），执行完整推导链 |
| `omtp-agent-HuangFuMi`（皇甫谧） | 针灸专家：加载 core-zj + rules-zj + rules-ziwu-liuzhu，脏→经络映射，12 法取穴 + 子午流注 |

上下文隔离：omtp-agent-TaoHongJing 禁止加载任何 zj 相关资源，omtp-agent-HuangFuMi 禁止加载任何 fxj 相关资源。两个专家独立完成推导，结论由 router 汇总对照。

### 路由设计

三个入口，按输入格式形态路由（非内容驱动）：

| Entry | Trigger | Dispatch |
|---|---|---|
| **zhengzhuang（症状）** | 主诉、症状描述、病程叙述 | 生成共享分析契约，再**并行**派发 TaoHongJing + HuangFuMi |
| **fangji（方剂）** | 药名清单、剂量、煎服法 | **单路**派发 TaoHongJing |
| **zhenjiu（穴位）** | 穴位名称清单、取穴组合 | **单路**派发 HuangFuMi |

### 档案目录

每次分析创建 `docs/YYMMDD-hhmmss/` 时间戳目录，所有输入/中间产物/结果文件写入该目录。文件前缀标识入口类型（`zz-`/`fj-`/`zj-`），`shared-` 前缀标识多 agent 共享文件。每个文件头部含 HTML 注释元数据（入口类型、生产者、时间戳）。

专家 agent 在分析过程中将所需数据文件从 `data/` symlink 到档案目录。下游规则分支只从档案目录读取数据，不直接访问 `data/`。每个档案目录因此自包含且可追溯。

`shared-zhengzhuang-analyze.md` 是症状入口的关键共享契约，必须包含 5 个必填章节（症状提取、脏腑映射、汇聚结果、生克链验证、八纲归纳），输入含脉象信息时另含第 6 章节（脉象交叉验证）。

### Skill 层

Skill 是纯领域知识文件，不含路由逻辑和流程编排。由 agent 按需加载。

## 前置条件

- 已安装 [OpenCode](https://opencode.ai) 及 [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent)

## 安装

```bash
# 克隆或复制 oh-my-tcmpowers 目录
cd oh-my-tcmpowers

# 安装 skills 和 agents
chmod +x install.sh
./install.sh
```

安装脚本会为所有 `omtp-*` 技能创建指向 `~/.config/opencode/skills/` 的符号链接，为所有 `omtp-agent-*` agent 创建指向 `~/.config/opencode/agents/` 的符号链接。如检测到 oh-my-openagent，agent 同时链接到 `~/.claude/agents/`。

## 卸载

```bash
./uninstall.sh
```

移除 `~/.config/opencode/skills/`、`~/.config/opencode/agents/` 和 `~/.claude/agents/` 下所有 `omtp-*` 符号链接。

## 使用方法

### 分析方剂

```
分析方剂：桂枝三两、芍药三两、甘草二两、生姜二两、大枣十二枚
```

```
用户输入 (方剂)
  1. BianQue 识别输入类型
  2. 派发 TaoHongJing
     2a. 加载 core-fxj          (五行查表)
     2b. 加载 analyze-fangji    (结构分析)
     2c. 路由到规则分支          (输出推导链)
```

### 分析症状

```
患者心下痞满，食欲不振，四肢倦怠，大便溏薄
```

```
用户输入 (症状)
  → BianQue
      1. 加载 analyze-zhengzhuang (提取症状、映射脏腑)
      2. 并行派发:
         → TaoHongJing (推导方剂建议)
         → HuangFuMi   (推导取穴组合建议)
      3. 收敛检查: 比对两条路径的治疗目标
```

### 分析配穴

```
分析配穴：合谷、太冲、足三里、三阴交
```

```
用户输入 (穴位)
  1. BianQue 识别输入类型
  2. 派发 HuangFuMi
     2a. 加载 core-zj           (经络脏腑映射)
     2b. 加载 analyze-zhenjiu   (结构分析)
     2c. 匹配 rules-zj 取穴法   (输出治疗目标)
```

### 交叉验证

三个入口可进行三向交叉验证：

1. **方剂→症状**：给定已知方剂，推导其应治何症
2. **症状→方剂+取穴**：给定症状，并行推导应用何方及取穴组合
3. **配穴→治疗目标**：给定配穴组合，反推经络脏腑与治疗目标

三条路径在病机与治疗目标上收敛即验证通过，若出现分歧则暴露待深入研究的问题。

> **注意**：
> - 方剂建议仅给出**配伍比例**，不给绝对剂量，除非用户提供某味药的具体重量作为锚点
> - 本体系使用辅行诀五味归属，与主流中医不同，不要混用体系
> - 五行归属存疑的药物在子表中以（存疑）标记

## 项目结构

```
oh-my-tcmpowers/
├── install.sh                                  # 符号链接安装脚本
├── uninstall.sh                                # 符号链接卸载脚本
├── README.md                                   # 英文文档
├── README_zh.md                                # 中文文档
├── agents/
│   ├── omtp-agent-BianQue.md                   # 扁鹊 全科专家 + 诊断 + 路由
│   ├── omtp-agent-TaoHongJing.md               # 陶弘景 中药专家
│   └── omtp-agent-HuangFuMi.md                 # 皇甫谧 针灸专家
├── data/
│   ├── fxj-zhengzhuang.md                      # 症状分析基准数据
│   ├── fxj-maixiang.md                          # 脉象诊断参考数据（27脉）
│   ├── shanghan-liujing.md                      # 六经→二旦六神方剂映射
│   ├── wenbing-wei-qi-ying-xue.md               # 温病四级分期数据
│   ├── wenbing-sanjiao.md                       # 温病三焦分期数据
│   ├── zj-12zj-*.md                            # 十二正经穴位数据（12 个文件）
│   └── zj-qj8m-*.md                            # 奇经八脉穴位数据（8 个文件）
├── docs/
│   └── YYMMDD-hhmmss/                          # 分析档案时间戳目录（输入、过程、结果）
└── skills/
    ├── omtp-core-fxj/                           # 核心理论（五行、体用化、60味药表、化味合成）
    ├── omtp-core-zj/                            # 针灸核心理论（经络脏腑、五俞穴、特定穴）
    ├── omtp-rules-fxj5z/                        # 五脏补泻组方规则
    ├── omtp-rules-fxj1xz/                       # 心神虚脏组方规则
    ├── omtp-rules-fxj2d6s/                      # 外感方组方规则（二旦六神）
    ├── omtp-rules-wei-qi-ying-xue/              # 温病深度分期规则（卫气营血）
    ├── omtp-rules-sanjiao/                      # 温病空间分期规则（三焦）
    ├── omtp-rules-zj/                           # 针灸取穴规则（12法）
    ├── omtp-rules-ziwu-liuzhu/                  # 子午流注取穴法（纳子法/纳甲法/灵龟八法/飞腾八法）
    ├── omtp-analyze-fangji/                     # 药物定位 + 全方统计方法
    ├── omtp-analyze-zhengzhuang/                # 症状提取 + 脏腑映射方法
    ├── omtp-analyze-maizhen/                    # 脉象诊断 + 交叉验证方法
    └── omtp-analyze-zhenjiu/                    # 穴位分析 + 取穴法匹配方法
```

## 与其他技能共存

Oh My TCM Powers 与其他技能集完全独立。所有技能以 `omtp-` 为前缀，通过符号链接安装，与编程技能（Superpowers）和写作技能（Dreampowers）互不干扰。

## 古籍参考文献

本系统参考以下古籍：

| 古籍 | 作者 | 朝代 | 引用内容 |
|------|------|------|---------|
| 《脉经》 | 王叔和 | 晋 | 24 脉分类基线、寸关尺六部脉位-脏腑映射、五行脉位循行序 |
| 《濒湖脉学》 | 李时珍 | 明 | 27 脉分类体系（增长/短/牢，以濡替软）、体状诗、相类诗、主病诗 |
| 《伤寒论》 | 张仲景 | 汉 | 六经辨证：经病阶段定义、传经模型、六经→辅行诀方剂对应 |
| 《温热论》 | 叶天士 | 清 | 卫气营血四级分期体系 |
| 《温病条辨》 | 吴鞠通 | 清 | 三焦温病空间分期体系 |

## 许可证

GPL-3.0
