---
name: omtp-core-bzl
description: "辨证录/陈士铎/辨证/鉴别诊断 - Analyze symptoms through ChenShiDuo's Bianzheng Lu (辨证录) differential diagnosis: pattern reversal and organ-based categorization across 126 disease gates"
---

# 辨证录辨证方法论

本技能是辨证录 skill 体系的**核心理论**。包含"论→辨→治→方"四步链条、"似X非X"翻案逻辑、126门按科分类索引、症状关键词路由表。不作为入口直接使用，由 omtp-agent-ChenShiDuo 前置加载。

来源：陈士铎《辨证录》（清，约1687年），14卷，126门，700余证。

## 辨证录核心方法

### "论→辨→治→方"四步链条

每证固定结构：
1. **论**（辨证论述）：提出症状，先述常人之见
2. **辨**（翻案辨析）：以"人谓…余以为不然/谁知…"翻案，揭示隐藏病机
3. **治**（立法）：确定治法方向
4. **方**（处方+方解）：给出完整方剂及逐味药说明

### 翻案鉴别原则

陈氏辨证核心风格——"似X非X"：
- 表面看像A病，实则是B病机
- "人谓…余以为不然"——否定常规判断
- "谁知是…乎"——揭示隐藏本质
- 重视脏腑间表里、母子、经络传变关系

鉴别思路：
1. 先接受"常人之见"（表面诊断）
2. 寻找不合常理的蛛丝马迹
3. 从表里/母子/上下关系找隐藏病脏
4. 以补法验证（补虚而效即证实）

### 用药风格特征

| 特征 | 说明 |
|------|------|
| 补法为主 | 十补一攻，善补阴阳气血 |
| 反佐配伍 | 寒中用热引，热中用寒引，少量反佐药引经达病所 |
| 大剂量 | 重用主药以取效（常用一两起步） |
| 多脏同调 | 不拘一脏，兼顾上下表里 |

## 按科分类索引

### 内科（卷一至卷十）

| 卷 | 门名 | 则数 |
|---|------|------|
| 一 | 伤寒门 | 43则 |
| 一 | 中寒门 | 7则 |
| 二 | 中风门 | 25则 |
| 二 | 痹证门 | 11则 |
| 二 | 心痛门 | 6则 |
| 二 | 胁痛门 | 5则 |
| 二 | 头痛门 | 6则 |
| 二 | 腹痛门 | 6则 |
| 二 | 腰痛门 | 6则 |
| 三 | 咽喉痛门 | 7则 |
| 三 | 牙齿痛门 | 6则 |
| 三 | 口舌门 | 2则 |
| 三 | 鼻渊门 | 3则 |
| 三 | 耳痛门（附耳聋） | 7则 |
| 三 | 目痛门 | 14则 |
| 三 | 血症门 | 21则 |
| 三 | 遍身骨痛门 | 4则 |
| 四 | 五郁门 | 6则 |
| 四 | 咳嗽门 | 8则 |
| 四 | 喘门 | 4则 |
| 四 | 怔忡门 | 3则 |
| 四 | 惊悸门 | 2则 |
| 四 | 虚烦门 | 2则 |
| 四 | 不寐门 | 5则 |
| 四 | 健忘门 | 4则 |
| 四 | 癫痫门 | 6则 |
| 四 | 狂病门 | 6则 |
| 四 | 呆病门 | 6则 |
| 四 | 呃逆门 | 5则 |
| 五 | 关格门 | 5则 |
| 五 | 中满门 | 4则 |
| 五 | 翻胃门 | 5则 |
| 五 | 臌胀门 | 7则 |
| 五 | 厥症门 | 7则 |
| 五 | 春温门 | 33则 |
| 六 | 火热症门 | 16则 |
| 六 | 暑症门 | 11则 |
| 六 | 燥症门 | 15则 |
| 六 | 痿证门 | 8则 |
| 六 | 消渴门 | 5则 |
| 七 | 痉门 | 11则 |
| 七 | 汗症门 | 5则 |
| 七 | 五瘅门 | 10则 |
| 七 | 大泻门 | 9则 |
| 七 | 痢疾门 | 12则 |
| 七 | 瘕门 | 8则 |
| 八 | 疟疾门 | 10则 |
| 八 | 虚损门 | 13则 |
| 八 | 痨瘵门 | 17则 |
| 八 | 梦遗门 | 7则 |
| 八 | 阴阳脱门 | 5则 |
| 八 | 淋证门 | 7则 |
| 九 | 大便闭结门 | 9则 |
| 九 | 小便不通门 | 6则 |
| 九 | 内伤门 | 23则 |
| 九 | 疝气门（附奔豚） | 8则 |
| 九 | 阴痿门 | 5则 |
| 九 | 痰证门 | 21则 |
| 十 | 鹤膝门 | 2则 |
| 十 | 疠风门 | 2则 |
| 十 | 遗尿门 | 3则 |
| 十 | 脱肛门 | 2则 |
| 十 | 强阳不倒门 | 2则 |
| 十 | 发斑门 | 2则 |
| 十 | 火丹门 | 3则 |
| 十 | 离魂门 | 3则 |
| 十 | 疰夏门 | 2则 |
| 十 | 脚气门 | 1则 |
| 十 | 中邪门 | 6则 |
| 十 | 中妖门 | 6则 |
| 十 | 中毒门 | 12则 |
| 十 | 肠鸣门 | 3则 |
| 十 | 自笑门（附自哭） | 3则 |
| 十 | 恼怒门 | 2则 |
| 十 | 喑哑门 | 3则 |
| 十 | 瘟疫门 | 1则 |
| 十 | 种嗣门 | 9则 |

### 妇科（卷十一至卷十二）

| 卷 | 门名 | 则数 |
|---|------|------|
| 十一 | 带门 | 5则 |
| 十一 | 血枯门 | 2则 |
| 十一 | 血崩门 | 8则 |
| 十一 | 调经门 | 14则 |
| 十一 | 受妊门 | 10则 |
| 十一 | 妊娠恶阻门 | 2则 |
| 十二 | 安胎门 | 10则 |
| 十二 | 小产门 | 5则 |
| 十二 | 鬼胎门 | 1则 |
| 十二 | 难产门 | 6则 |
| 十二 | 血晕门 | 2则 |
| 十二 | 胞衣不下门 | 3则 |
| 十二 | 产后诸病门 | 11则 |
| 十二 | 下乳门 | 2则 |

### 外科（卷十三）

| 卷 | 门名 | 则数 |
|---|------|------|
| 十三 | 背痈门 | 7则 |
| 十三 | 肺痈门 | 4则 |
| 十三 | 肝痈门 | 2则 |
| 十三 | 大肠痈门 | 3则 |
| 十三 | 小肠痈门 | 3则 |
| 十三 | 无名肿毒门 | 2则 |
| 十三 | 对口痈门 | 1则 |
| 十三 | 脑疽门 | 1则 |
| 十三 | 囊痈门 | 2则 |
| 十三 | 臂痈门 | 1则 |
| 十三 | 乳痈门 | 4则 |
| 十三 | 肚痈门 | 1则 |
| 十三 | 多骨痈门 | 1则 |
| 十三 | 恶疽门 | 1则 |
| 十三 | 疔疮门 | 1则 |
| 十三 | 杨梅疮门 | 5则 |
| 十三 | 腰疽门 | 1则 |
| 十三 | 擎疽门 | 1则 |
| 十三 | 脚疽门 | 2则 |
| 十三 | 鬓疽门 | 1则 |
| 十三 | 唇疔门 | 1则 |
| 十三 | 瘰门 | 2则 |
| 十三 | 痔漏门 | 4则 |
| 十三 | 顽疮门 | 2则 |
| 十三 | 接骨门 | 2则 |
| 十三 | 金疮门 | 1则 |
| 十三 | 物伤门 | 3则 |
| 十三 | 癞门 | 1则 |
| 十三 | 刑杖门 | 1则 |

### 儿科（卷十四）

| 卷 | 门名 | 则数 |
|---|------|------|
| 十四 | 惊疳吐泻门 | 7则 |
| 十四 | 便虫门 | 2则 |
| 十四 | 痘疮门 | 15则 |
| 十四 | 疹症门 | 3则 |
| 十四 | 吃泥门 | 1则 |
| 十四 | 胎毒门 | 1则 |

## 症状关键词→文件路由表

| 症状关键词 | 加载文件 |
|-----------|---------|
| 伤寒/发热/恶寒/太阳/少阳/阳明 | `bzl/shanghan-men.md` |
| 中寒/厥冷/寒邪直中 | `bzl/zhonghan-men.md` |
| 中风/半身不遂/口眼歪斜 | `bzl/zhongfeng-men.md` |
| 痹/关节痛/肢体麻木/风湿 | `bzl/bizheng-men.md` |
| 心痛/胸痛/心绞 | `bzl/xintong-men.md` |
| 胁痛/胁胀/肋痛 | `bzl/xietong-men.md` |
| 头痛/偏头痛/巅顶痛 | `bzl/toutong-men.md` |
| 腹痛/脘痛/少腹痛 | `bzl/futong-men.md` |
| 腰痛/腰酸/腰冷 | `bzl/yaotong-men.md` |
| 咽喉痛/喉痹/喉肿 | `bzl/yanhoutong-men.md` |
| 牙痛/齿痛/牙龈肿 | `bzl/yachitong-men.md` |
| 口疮/舌痛/舌疮 | `bzl/koushe-men.md` |
| 鼻渊/鼻塞/浊涕 | `bzl/biyuan-men.md` |
| 耳痛/耳聋/耳鸣 | `bzl/ertong-men.md` |
| 目痛/目赤/目暗/视物不清 | `bzl/mutong-men.md` |
| 血症/吐血/衄血/便血/尿血 | `bzl/xuezheng-men.md` |
| 遍身骨痛/周身痛/骨节痛 | `bzl/bianshen-men.md` |
| 五郁/郁证/气郁/血郁 | `bzl/wuyu-men.md` |
| 咳嗽/痰/久咳 | `bzl/kesou-men.md` |
| 喘/气喘/哮喘/气急 | `bzl/chuan-men.md` |
| 怔忡/心悸不宁 | `bzl/zhengchong-men.md` |
| 惊悸/心惊/易惊 | `bzl/jingji-men.md` |
| 虚烦/烦躁/烦热 | `bzl/xufan-men.md` |
| 不寐/失眠/难眠 | `bzl/bumei-men.md` |
| 健忘/善忘/记忆减退 | `bzl/jianwang-men.md` |
| 癫痫/抽搐/痫证 | `bzl/dianxian-men.md` |
| 狂/狂躁/发狂 | `bzl/kuangbing-men.md` |
| 呆/痴呆/反应迟钝 | `bzl/daibing-men.md` |
| 呃逆/打嗝/膈气 | `bzl/eni-men.md` |
| 关格/吐逆不食/二便不通 | `bzl/guange-men.md` |
| 中满/腹满/胀满 | `bzl/zhongman-men.md` |
| 翻胃/反胃/食入即吐 | `bzl/fanwei-men.md` |
| 臌胀/腹胀如鼓/水肿 | `bzl/guzhang-men.md` |
| 厥/昏厥/四肢厥冷 | `bzl/juezheng-men.md` |
| 春温/温热/温病 | `bzl/chunwen-men.md` |
| 火热/实热/壮热 | `bzl/huore-men.md` |
| 暑/中暑/暑热 | `bzl/shuzheng-men.md` |
| 燥/秋燥/干燥 | `bzl/zaozheng-men.md` |
| 痿/肢体痿软/足痿 | `bzl/weizheng-men.md` |
| 消渴/多饮/多尿/消瘦 | `bzl/xiaoke-men.md` |
| 痉/项强/角弓反张 | `bzl/jing-men.md` |
| 汗/自汗/盗汗/多汗 | `bzl/hanzheng-men.md` |
| 五瘅/黄疸/发黄 | `bzl/wudan-men.md` |
| 大泻/泄泻/久泻/水泻 | `bzl/daxie-men.md` |
| 痢/痢疾/脓血便/里急后重 | `bzl/liji-men.md` |
| 瘕/积聚/腹中包块 | `bzl/jia-men.md` |
| 疟/疟疾/寒热往来 | `bzl/nueji-men.md` |
| 虚损/虚劳/形体消瘦 | `bzl/xusun-men.md` |
| 痨瘵/骨蒸/潮热盗汗 | `bzl/laozhai-men.md` |
| 梦遗/遗精/滑精 | `bzl/mengyi-men.md` |
| 阴阳脱/大汗亡阳/阴竭 | `bzl/yinyangtuo-men.md` |
| 淋/小便淋漓/尿痛 | `bzl/linzheng-men.md` |
| 大便闭/便秘/不通 | `bzl/dabianbi-men.md` |
| 小便不通/癃闭 | `bzl/xiaobianbutong-men.md` |
| 内伤/劳倦/饮食伤 | `bzl/neishang-men.md` |
| 疝气/奔豚/少腹痛引睾 | `bzl/shanqi-men.md` |
| 阴痿/阳萎/不举 | `bzl/yinwei-men.md` |
| 痰/痰多/痰饮/顽痰 | `bzl/tanzheng-men.md` |
| 鹤膝/膝肿/膝痛如鹤膝 | `bzl/hexi-men.md` |
| 疠风/麻风/皮肤不仁 | `bzl/lifeng-men.md` |
| 遗尿/尿床/小便不禁 | `bzl/yiniao-men.md` |
| 脱肛/肛脱/肛门下坠 | `bzl/tuogang-men.md` |
| 强阳不倒/阳强/阴茎勃起不收 | `bzl/qiangyang-men.md` |
| 发斑/斑疹/肌肤发斑 | `bzl/faban-men.md` |
| 火丹/丹毒/皮肤红肿 | `bzl/huodan-men.md` |
| 离魂/神志恍惚/魂不守舍 | `bzl/lihun-men.md` |
| 疰夏/苦夏/夏季乏力 | `bzl/zhuxia-men.md` |
| 脚气/足肿/脚弱 | `bzl/jiaoqi-men.md` |
| 中邪/鬼魅/邪祟 | `bzl/zhongxie-men.md` |
| 中妖/妖邪/怪病 | `bzl/zhongyao-men.md` |
| 中毒/药毒/食毒 | `bzl/zhongdu-men.md` |
| 肠鸣/腹中雷鸣 | `bzl/changming-men.md` |
| 自笑/自哭/无故笑哭 | `bzl/zixiao-men.md` |
| 恼怒/易怒/暴怒 | `bzl/naonu-men.md` |
| 喑哑/失音/声哑 | `bzl/yinya-men.md` |
| 瘟疫/时疫/疫毒 | `bzl/wenyi-men.md` |
| 种嗣/不孕/不育 | `bzl/zhongsi-men.md` |
| 带下/白带/赤带 | `bzl/dai-men.md` |
| 血枯/经闭/月经不来 | `bzl/xueku-men.md` |
| 血崩/崩漏/经血大下 | `bzl/xuebeng-men.md` |
| 调经/月经不调/经期紊乱 | `bzl/tiaojing-men.md` |
| 受妊/不孕/求子 | `bzl/shouren-men.md` |
| 恶阻/妊娠呕吐/孕吐 | `bzl/renshen-men.md` |
| 安胎/胎动不安/先兆流产 | `bzl/antai-men.md` |
| 小产/流产/堕胎 | `bzl/xiaochan-men.md` |
| 鬼胎/假孕/腹大如妊 | `bzl/guitai-men.md` |
| 难产/产程停滞 | `bzl/nanchan-men.md` |
| 血晕/产后昏厥 | `bzl/xueyun-men.md` |
| 胞衣不下/胎盘滞留 | `bzl/baoyi-men.md` |
| 产后/产后诸病/恶露 | `bzl/chanhou-men.md` |
| 下乳/乳汁不通/缺乳 | `bzl/xiaru-men.md` |
| 背痈/背部痈肿 | `bzl/beiyong-men.md` |
| 肺痈/咳吐脓血 | `bzl/feiyong-men.md` |
| 肝痈/肝区痈肿 | `bzl/ganyong-men.md` |
| 大肠痈/肠痈/阑尾 | `bzl/dachangyong-men.md` |
| 小肠痈 | `bzl/xiaochangyong-men.md` |
| 无名肿毒 | `bzl/wuming-men.md` |
| 对口痈/脑后痈 | `bzl/duikouyong-men.md` |
| 脑疽/头顶疽 | `bzl/naoju-men.md` |
| 囊痈/阴囊肿 | `bzl/nangyong-men.md` |
| 臂痈/上肢痈 | `bzl/biyong-men.md` |
| 乳痈/乳房肿痛 | `bzl/ruyong-men.md` |
| 肚痈/脐腹痈 | `bzl/duyong-men.md` |
| 多骨痈/骨槽风 | `bzl/duoguyong-men.md` |
| 恶疽/恶性疽 | `bzl/eju-men.md` |
| 疔疮/疔毒 | `bzl/dingchuang-men.md` |
| 杨梅疮/梅毒 | `bzl/yangmei-men.md` |
| 腰疽 | `bzl/yaoju-men.md` |
| 擎疽 | `bzl/qingju-men.md` |
| 脚疽/足疽 | `bzl/jiaoqu-men.md` |
| 鬓疽/耳旁疽 | `bzl/binju-men.md` |
| 唇疔/唇部疔 | `bzl/chundin-men.md` |
| 瘰/瘰疬/颈部结核 | `bzl/luoli-men.md` |
| 痔/痔疮/痔漏/漏 | `bzl/zhilou-men.md` |
| 顽疮/久疮不愈 | `bzl/wanchuang-men.md` |
| 接骨/骨折/骨伤 | `bzl/jiegu-men.md` |
| 金疮/刀伤/创伤 | `bzl/jinchuang-men.md` |
| 物伤/虫咬/兽伤 | `bzl/wushang-men.md` |
| 癞/癞疮/秃疮 | `bzl/lai-men.md` |
| 刑杖/杖伤/外伤 | `bzl/xingzhang-men.md` |
| 小儿惊/小儿疳/小儿吐泻 | `bzl/jinggan-men.md` |
| 小儿便虫/蛔虫/蛲虫 | `bzl/bianchong-men.md` |
| 痘疮/天花/出痘 | `bzl/douchuang-men.md` |
| 疹/麻疹/发疹 | `bzl/zhenzheng-men.md` |
| 小儿吃泥/异食 | `bzl/chini-men.md` |
| 胎毒/新生儿毒 | `bzl/taidu-men.md` |

## 数据引用

- 原文数据（按门分文件）：`data/bzl/` 目录
- 组方规则：`omtp-rules-bzl`（辨证确定后加载）

本 skill 提供理论框架与路由表，具体辨证内容从 `data/bzl/` 对应门文件查取，具体组方规则从 `omtp-rules-bzl` 查取。

## 反模式

- 混用辅行诀体用化、圆运动升降、针灸经络取穴概念——与辨证录体系互斥
- 不先辨证翻案就直接开方——违反"论→辨→治→方"四步链
- 忽略陈氏"似X非X"鉴别——辨证录的核心价值在于翻案
- 用攻法代替补法——辨证录以补为主，十补一攻
- 小剂量试探——辨证录用药以大剂量取效为特色
