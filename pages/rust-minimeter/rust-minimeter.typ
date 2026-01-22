// #set page(
//   width: 800pt,
//   height: auto,
//   margin: 40pt,
//   fill: rgb("#f8f9fa"), // 切换为优雅的浅色背景
// )
#set text(font: "Segoe UI", fill: rgb("#343a40"), size: 11pt)
#let today() = {
  datetime.today().display("[year]年[month]月[day]日")
}
// --- 样式定义 ---
#let section_title(it) = {
  set text(fill: rgb("#1a73e8"), size: 16pt, weight: "bold")
  block(inset: (bottom: 4pt), stroke: (bottom: 2pt + rgb("#e9ecef")), width: 100%)[#it]
}
#show link: set text(fill: blue.darken(20%))
#show link: underline

#let feature_card(title, body) = {
  rect(
    fill: white,
    stroke: 1pt + rgb("#dee2e6"),
    inset: 12pt,
    radius: 6pt,
    width: 100%,
    //shadow: (color: rgb(0, 0, 0, 20), offset: (2pt, 2pt)),
  )[
    #set text(fill: rgb("#202124"), weight: "bold")
    #title \
    #set text(fill: rgb("#5f6368"), weight: "regular", size: 9.5pt)
    #v(4pt)
    #body
  ]
}

// --- 顶部 Header ---
#grid(
  columns: (1fr, auto),
  align: horizon,
  [
    #text(size: 32pt, weight: "bold", fill: rgb("#202124"))[Rust-Minimeter] \
    #text(size: 14pt, fill: rgb("#1a73e8"), weight: "medium")[极简、精准、高性能的实时音频分析仪]
  ],
  rect(fill: rgb("#1a73e8"), inset: 8pt, radius: 4pt)[
    #set text(fill: white, size: 10pt, weight: "bold")
    v1.0 Release
  ],
)

#v(20pt)

// --- 图片 Preview 区 ---
#align(center)[
  #block(stroke: 4pt + white, radius: 8pt, clip: true)[
    // 使用你指定的图片路径
    #image("image.png", width: 100%)
  ]
  #set text(size: 9pt, style: "italic", fill: gray)
  #v(4pt)
  实时界面预览：波形、LUFS 仪表、立体声场与瀑布图.注意,本项目没有经过minimeter制作组同意,只为了了解Rust而开发.事实上,LLMs对minimeter的认识已足够深刻.
]

#v(20pt)

// --- 核心算法深度解析 (FFT) ---
#section_title[核心技术：双段 FFT 分层处理]

#grid(
  columns: (1fr, 1.2fr),
  gutter: 20pt,
  rect(fill: rgb("#f1f3f4"), inset: 12pt, radius: 4pt)[
    #set text(size: 9.5pt)
    *为什么需要分层？* \
    在音频分析中，传统的单次 FFT 往往无法兼顾“低频分辨率”与“高频实时性”。Rust-Minimeter 通过双路径并行处理解决了这一痛点：
  ],
  [
    *1. Detail Spectrum (精细路径)*
    - 采用 *16384* 点的大窗口采样。
    - 专为 *200Hz 以下* 的频率设计，确保低音部分的频率识别极其精确。

    *2. Main Spectrum (主路径)*
    - 采用 *8192* 点（截取自最近 4096 点）的快速窗口。
    - 负责全局频谱响应，提供极高的视觉刷新率，捕捉瞬态变化。
  ],
)

#v(10pt)

// --- 核心特性 ---
#section_title[功能特性]
#v(10pt)
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 15pt,
  feature_card[专业级 LUFS 监测][
    严格遵循 ITU-R BS.1770 标准，集成 K-Weighting 滤波器。
    提供实时 LUFS 读数及左右声道峰值(Peak)监测。
  ],
  feature_card[实时立体声场 (Gonio)][
    高精度的向量示波器实现。
    通过可视化 $L+R$ (Mid) 与 $L-R$ (Side) 的关系，直观呈现音频的相位与宽度。
  ],
  feature_card[自定义瀑布图 (Spectrogram)][
    基于 `egui` 纹理更新技术实现的实时瀑布图，支持 512 级频率精度，颜色映射随电平动态变化。
  ],
)

#v(20pt)

// --- 代码实现细节 ---
#section_title[实现细节 (Code Snippets)]
#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  [
    === 频率平滑算法
    项目使用了指数平滑公式：
    $V_(t) = V_(p r e v) dot alpha + V_(m a g) dot (1 - alpha)$
    这使得频谱显示在保持灵敏的同时，视觉感受更加柔和顺滑。
  ],
  [
    === 异步数据架构
    利用 Rust 的 `std::sync::mpsc` 通道：
    - *生产者 (Audio Thread)*: 48kHz 高频采样与计算。
    - *消费者 (GUI Thread)*: 60Hz 异步获取渲染数据，互不干扰。
  ],
)
#section_title[代码]
Code is reviewing, coming soon.
#link("https://github.com")[这是链接的占位符.一旦上传了网页,这个就会被更新.]
#v(30pt)

// --- Footer ---
#line(length: 100%, stroke: 1pt + rgb("#dee2e6"))
#align(center)[
  #set text(size: 9pt, fill: gray)
  Built with *Rust*, *Egui* & *Typst* \
  with the help of vibe coding❤\
  © kiwiizzz 2026#link("https://shouzhuoyi.github.io") | Updated #today()\
]
