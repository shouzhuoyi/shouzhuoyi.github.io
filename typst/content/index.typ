#import "/config.typ": template, tufted
#show: template

// 侧边栏：放置头像和一句话简介
#tufted.margin-note({
  // 请确保路径下有你的照片，或者修改为 assets/me.jpg
  image("./imgs/me.jpg", width: 20em)
})

#tufted.margin-note[
  *易守拙 (Shouzhuo Yi)* \
  武汉大学计算机学院本科生 \
  _花儿育种而凋 / 我们学会淡忘_
]

= 易守拙 - Shouzhuo Yi

I am an undergraduate student at the **School of Computer Science, Wuhan University (2024 - Now)**.

I am dedicated to developing CLIP-based multimodal Source-Free Domain Adaptation (SFDA) and Weakly Supervised Learning methods.

== 🔍 Research Interests

- *CLIP-based Multimodal SFDA*
- *Medical Image Segmentation*
- *Computability Theory*

== 💻 Projects

#tufted.margin-note[
  #box(fill: silver.lighten(50%), inset: 5pt, radius: 3pt)[
    *Tech Stack:* Rust
  ]
]

=== Rust-Minimeter
一个基于 **egui** 和 **cpal** 开发的高性能实时音频可视化工具,用于拟合 MiniMeter.

#link("https://shouzhuoyi.github.io/pages/rust-minimeter/rust-minimeter.html")[View Project →]

---

== 📄 CV & More

- #link("./cvs/易守拙简历.pdf")[我的简历 (Resume)]
- #link("https://github.com/shouzhuoyi")[GitHub Profile]

== 📬 Contact

- *Email:* #link("mailto:yishouzhuo@whu.edu.cn")[yishouzhuo\@whu.edu.cn]
- *GitHub:* #link("https://github.com/shouzhuoyi")[shouzhuoyi]
- *WeChat:* yisz0519
- *Address:* E514, School of Computer Science, Wuhan University

#v(2em)
#line(length: 100%, stroke: 0.5pt + gray)
#set text(size: 0.8em, fill: gray)

