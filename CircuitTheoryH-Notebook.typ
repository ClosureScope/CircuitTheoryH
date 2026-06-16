#set text(lang: "zh", region: "cn")
#import "template.typ": *
#set text(font: (font-en, font-song))
#show strong: set text(font: (font-en, font-hei), weight: "regular")
#show emph: text.with(font: (font-en, font-kai), style: "normal")
#show: frame-style(styles.hint)
#show: ilm.with(
  title: [电路理论],
  author: "Closure",
  // abstract: [Default Abstract],
  // bibliography: bibliography("../My Library.bib", style: "ieee"),
  figure-index: (enabled: true),
)


#pagebreak()
#align(left + horizon)[
  #text(size: 2em, weight: "bold")[第一篇　电阻电路]
]
#pagebreak()

= 基本概念和基本规律
== 电路和电路模型
=== 实际电路和电路模型

=== 集中参数电路
+ 电磁波
  流入电压、电流都未来得及发生显著变化就流出，即可认为流入电压、电流近似等于流出的电压、电流

+
  #proposition[集中化条件][

    电磁场的变化传布整个电路所需的时间 τ 要远远小于一个周期 T，即实际电路的各向尺寸 d 远远小于电路工作频率所对应的电磁波波长 λ，即：
    $ d << lambda $
    一般情况下，取$d < lambda / 10$
  ]


== 电路变量
=== 电流

#definition[电流][单位时间内通过导体横截面的电荷量
  $ i = (d q)/(d t) $
]
=== 电压

#definition[电压][电场力将单位正电荷由电场中的a点移动到b点所作的功
  $ u = (d w)/(d q) $
  $ u_(a b) = V_a - V_b $
]

=== 参考方向
+ 参考方向：在分析与计算电路时，对电量任意假定的方向
+ 电流，电压的参考方向：$i_(a b)$ $u_(a b)$
+ 参考方向与实际方向的关系：

  计算结果值为正值，实际方向与参考方向一致；

  计算结果值为负值，实际方向与参考方向相反。
+ 一致参考方向

  通常取 u、i 一致参考方向
=== 功率和能量
+ 功率
  #definition[功率][
    $
      p = (d w)/(d t) = u i
    $
  ]
+ 实际方向
  - 吸收功率（负载）：u、i 实际方向相同
  - 发出功率（电源）：u、i 实际方向相反
+ 参考方向：一段电路在电压、电流取一致参考方向的情况下，功率的参考方向指定为进入该电路

  u、i 参考方向一致

  $p = u i > 0$，功率实际方向与参考方向相同，吸收功率（负载）；

  $p = u i < 0$，功率实际方向与参考方向相反，发出功率（电源）。

+ 能量
  #definition[能量][
    在电压、电流取一致参考方向下，从 t0 到 t 的时间内该部分电路吸收的能量为
    $ w(t_0, t) = integral_(t_0)^t p(tau) d tau = integral_(t_0)^t u(tau) i(tau) d tau $
  ]
== 电路基本规律
=== 基尔霍夫电流定律（KCL）
+ 定律
  #theorem[KCL][对于任一集中参数电路中的任一节点，在任一时刻，流出该节点的支路电流等于流入该节点的支路电流。
    $ sum i_出 = sum i_入 $
  ]
+ 定律

  规定流出节点的电流为正，流入节点的电流为负
  #theorem[KCL][对于任一集中参数电路中的任一节点，在任一时刻，流出（或流入）该节点的所有支路电流的代数和等于零。
    $ sum i = 0 $
  ]
  #proposition[][KCL能给出$n-1$个独立方程（$n$为节点个数）]
+ 推广
  #theorem[KCL][对于任一集中参数电路中的任一闭合面（广义节点），在任一时刻，流出（或流入）该闭合面的所有支路电流的代数和等于零。
    $ sum i = 0 $
  ]

+ 推广
  #theorem[KCL][对于任一集中参数电路中的任一割集（或闭合面），在任一时刻，流出该割集（或闭合面）的支路电流等于流入该割集（或闭合面）的支路电流。
    $ sum i_出 = sum i_入 $
  ]

=== 基尔霍夫电压定律（KVL）
+ 定律
  #theorem[KVL][对于任一集中参数电路中的任一回路，在任一时刻，从回路中任一点出发，沿回路循行一周，则在这个方向上电位升之和等于电位降之和。
    $ sum u_升 = sum u_降 $
  ]
+ 定律

  规定支路电压的参考方向（高电位指向低电位）同循行方向一致，取正号，相反，取负号
  #theorem[KVL][对于任一集中参数电路中的任一回路，在任一时刻，沿该回路所有支路电压的代数和等于零。
    $ sum u = 0 $
  ]
  #proposition[][KVL能给出$b-(n-1)$个独立方程（$b$为支路个数，$n$为节点个数）]
+ 推广：开口电压可按回路处理
=== 图论的基础知识与基本结论
==== 电路图论的名词和术语
+ 图
+ 连通图
+ 有向图
+ 平面图
+ 子图
+ 回路
+ 网孔：内网孔，外网孔
+ 树
+ 基本回路：对于任意一个连通图 G，选定一个树后，由一条连支和若干条树支构成的回路称为基本回路。
  #proof[KVL独立方程个数： $b-(n-1)$个][

    KVL独立方程个数 = 独立回路数 = 基本回路数= 连支数 = 支路数 $-$ 树支数，即$b-(n-1)$。

    KVL独立方程个数 = 网孔数
  ]
+ 基本割集：对于任意一个连通图 G，选定一个树，一条树支总能和若干条连支构成一个割集，这种仅包含一条树支的割集称为基本割集
  #proof[KCL独立方程个数： $n-1$个][

    KCL独立方程个数 = 独立闭合面数 = 基本割集数 = 树支数 = 节点数 $-$ 1，即$n-1$。

    KCL独立方程个数 = 独立节点数
  ]
==== 电路图论的基本结论
+ 在G的任何两个节点之间，总有由树支组成的唯一路径。
+ 树支数$n_t=n-1$，连支数$n_l=b-(n-1)$
+ 基本回路：每条连支都可以和一些树支构成一个唯一的回路。
+ 基本割集：每条树支都能和一些连支构成唯一的割集
+ 独立方程

  $n-1$个基本割集 $->$ $n - 1$个独立的KCL方程

  $b-(n-1)$个基本回路 $->$ $b-(n-1)$个独立的KVL方程

  $b$条支路 $->$  $b$个VCR方程

  2b法：$2 b$个网络变量 $<-$ $2 b$个独立方程
=== KCL和KVL的矩阵形式
==== KCL的矩阵形式
+ 关联矩阵
  #image("assets/image.png")

+ 降阶关联矩阵：可以把$A_a$中的任意一行删去，便得到一个具有$n - 1$行和$b$列的矩阵，其秩为$n - 1$，称之为降阶关联矩阵A。

  一般去除参考节点对应的行
==== KVL的矩阵形式
+ 网孔矩阵
  #image("assets/image-1.png")
  外网孔循行方向相反
+ 降阶网孔矩阵：可以把$M_m$中的任意一行删去，便得到一个具有$m-1$行和$b$列的矩阵，其秩为$m-1$，称之为降阶关联矩阵$M$

  一般去除外网孔对应的行

==== KCL和KVL的矩阵形式
#theorem[KCL矩阵形式（关联矩阵）][

  $ A i_b = 0 $
]
$A$：支路和节点的关系
#theorem[KVL矩阵形式（网孔矩阵）][
  $ M u_b = 0 $
]
$M$：支路和网孔的关系
#theorem[KVL矩阵形式（关联矩阵）][
  $ u_b = A^T u_n $
]
支路电压和节点电压间关系
#theorem[KCL矩阵形式（网孔矩阵）][
  $ i_b = M^T i_m $
]
支路电流和网孔电流间关系
=== 特勒根定理
+ 特勒根功率定理
  #theorem[特勒根功率定理][对于具有 n个节点，b 条支路的电路，假设支路电压、支路电流取一致参考方向，电路中的支路电压向量 $u_b= (u_1,u_2,…,u_b)^T$、支路电流向量 $i_b= (i_1,i_2,…,i_b)^T$ 分别满足KCL和KVL，则
    $ u_b^T (t) i_b (t) = 0 $
  ]
+ 特勒根似功率定理
  #theorem[特勒根似功率定理][对于两个集中参数电路$N$和$hat(N)$，它们可以由不同的元件构成，但却有相同的有向图。假设支路电压、支路电流取一致参考方向，则有
    $ u_b^T (t_1) hat(i_b) (t_2) = hat(u_b)^T (t_3) i_b (t_4) = 0 $
  ]
+ 特勒根定理其他形式：电路是否相同，时刻是否相同均可
+ 推论
  #image("assets/image-2.png")

  #theorem[特勒根定理推论][$N_0$为线性无源电阻网络，则
    $ u_1 i_1^' + u_2 i_2^' = u_1^' i_1 + u_2^' i_2 $]
== 电阻电路元件
=== 电路元件的数学抽象
+ 元件约束
+ 元件特性：电压和电流的关系
=== 电阻元件
+ 电阻：伏安特性曲线
+ 正电阻，负电阻
+ 短路，开路
  - 短路：$R = 0$
  - 开路：$R = infinity$
+ 理想开关：线性时变电阻
+ 双向性：伏安特性曲线以原点为对称，使用时不需区分二端钮的极性
+ 功率：$p(t) = u(t) i(t)$
  + 线性非时变电阻吸收的瞬时功率：$p = R i^2 = G u^2$
+ 能量：$w(t_0, t) = integral_(t_0)^t p(tau) d tau = integral_(t_0)^t u(tau) i(tau) d tau$
  + 线性非时变电阻吸收的能量：$w(t_0, t) = R integral_(t_0)^t i^2(tau) d tau = G integral_(t_0)^t u^2(tau) d tau$
  + 有源性：对于任意的$t$，有 $w(t) >= 0$，则称此元件为无源元件，否则，称有源元件
+ 无源性判断条件
  + 功率判断条件
    - $p(t)>= 0$ 无源
    - $p(t) < 0$ 有源
  + 能量判断条件
    - $w(-inf, t) >= 0$ 无源
    - $w(-inf, t) < 0$ 有源
  + 工作点判断条件
    - 工作点在第1和第3象限内，无源
    - 工作点在第2和第4象限内，有源
=== 独立电源
==== 电压源
+ 实际电压源

  外特性曲线：$U = E - I R_0$

  理想电压源：$U = E$ 此时$R_0 = 0$

+ 电压源

  一个二端元件：
  - 电压是常数或是一定的时间的函数
  - 电流是由电源和外电路共同决定的
+ 特性方程：$u = u_s$
+ 特性曲线
  #image("assets/image-3.png")
+ 电压源置零：要去掉电压源的作用，只要将电压源用短路代替

==== 电流源
+ 实际电流源

  外特性曲线：$I = I_s - U / R_0$

  理想电流源：$I = I_s$ 此时$R_0 = infinity$
+ 电流源

  一个二端元件：
  - 电流是常数或是一定的时间的函数
  - 电压是由电源和外电路共同决定的
+ 特性方程：$i = i_s$
+ 特性曲线
  #image("assets/image-4.png")
+ 电流源置零：要去掉电流源的作用，只要将电流源用开路代替

==== 几种基本波形
+ 直流波形
  $ f(t) = K $
+ 正弦波形
  $ f(t) = A_m cos(omega t + phi) $
+ 单位阶跃波形
  $ epsilon(t) = cases(0 quad t < 0, 1 quad t > 0) $
  延迟单位阶跃波形：$epsilon(t - t_0)$
+ 单位脉冲波形
  $ p_Delta (t) = cases(0 quad t < 0, 1 / Delta quad 0<t<Delta, 0 quad t > Delta) $
+ 单位冲激波形
  $ cases(delta(t) = 0 quad t != 0, integral_(-infinity)^infinity delta(t) d t = integral_(-xi)^xi delta(t) d t=1) $
  延迟冲激波形：$delta(t - t_0)$
  - 单位冲激函数是单位脉冲函数的极限情况
  - 冲激波形强度：积分

  - 乘积性质：$f(t)delta(t) = f(0)delta(t)$

  - 筛分性质：$integral_(-xi)^xi f(t)delta(t) d t = f(0)$

  - 导数作用：$d/(d t)[f(t)delta(t)] = f(0) delta^' (t)$
  - 任意波形的冲激函数表示：$f(t) = integral_0^t f(tau)delta
    (t-tau) d tau$
  - $delta(t) = d/(d t)epsilon(t)$

+ 单位对偶冲激波形
  $ delta^' (t) = cases(0 quad t != 0, -infinity quad t=0_+, +infinity quad t=0_-) $
  - $delta^' (t) = d/(d t) delta(t)$

+ 单位斜坡波形
  $ r(t) = t times epsilon(t) = cases(0 quad t<0, t quad t > 0) $
  - $epsilon(t) = d/(d t) r(t)$

+ 波形关系
  #image("assets/image-5.png")
+ 其他波形
  - 方波
  - 锯齿波
  - 三角波
=== 受控电源
+ 受控电源

  受控源为双口元件
+ 功率

  进入受控源的功率：$p = u_2 i_2$

  控制支路功率为0
=== 运算放大器
+ 符号
  - 反相输入端
    #image("assets/image-6.png")
  - 同相输入端
    #image("assets/image-7.png")
  - 开环增益（放大倍数）
    #image("assets/image-8.png")
+ 输入输出特性
  #image("assets/image-9.png")
  电路模型
  #image("assets/image-10.png")
+ 理想运算放大器
  - 参数
    $A -> infinity$
    $R_i -> infinity$
    $R_0 = 0$
  - 符号
    #image("assets/image-11.png")
  - 输入输出特性
    #image("assets/image-12.png")
  - 电路模型
    #image("assets/image-13.png")
  - 运算特性

    虚短：$u_+ = u_-$

    虚断：$i_+ = i_- = 0$

  - 反相放大器（放大倍数为1即为反相器）
    #image("assets/image-14.png")
    $ A_f = u_0 / u_s = - R_f / R_s $
  - 电源转换器
    #image("assets/image-15.png")
    $ i_L = i_s = u_s / R_s $
    使用电源转换器得到恒流源
  - 同相放大器（放大倍数为1即为电压跟随器）
    #image("assets/image-16.png")
    $ A_f = 1 + R_1 / R_2 $
    #image("assets/image-17.png")
    使用电压跟随器得到恒压源

  #note[][虚断始终成立，对于实际运算放大器，用$u_o = A (u_+ - u_-)$代替虚短]
  #note[][运算放大器在负反馈下处于线性区，在开环或正反馈下处于饱和区]
  #note[][由于有线没画出来，无法直接使用KCL闭合面推广]
  #note[][运算放大器是有源元件]

=== 理想变压器
+ 符号及外特性
  $ cases(u_1 = n u_2, i_1 = -1/n i_2) $
  #image("assets/image-18.png")
  #note[][同名端颠倒时，用$-n$代替$n$]
+ 同名端：
  + 电流同流入或流出，磁通增强
  + 感应电动势极性同正同负
+ 等效模型
  #image("assets/image-19.png")
+ 功率：无源元件，无损元件
+ 重要性质：阻抗变换
  #image("assets/image-20.png")
  从输入端看进去电阻为$n^2 R_L$

=== 负转换器
+ 符号及外特性
  #image("assets/image-22.png")
+ 重要性质：负转换性

  从输入端看，负载$R_L$成为负电阻

  负转换器是一种能把无源元件转换成有源元件的有源器件
=== 理想回转器
+ 符号及外特性
  #image("assets/image-23.png")
  $r$称回转比（或回转器电阻），$g = 1/r$，称回转器电导
+ 功率：无源元件，无损元件
+ 重要性质：翻转性
  + 把电阻和电导翻转，把电容和电感翻转
  + $Z_1 = r^2 / Z_2$
= 电路分析的基本方法
== 电路的分类
== 电路的等效变换
=== 等效电路的概念
等效电路：外特性相同
=== 等效变换
==== 线性电阻的等效变换
+ 电阻的串联

  $R = R_1 + R_2$
+ 电阻的并联

  $G = G_1 + G_2$
==== 独立电源的等效变换
+ 电压源的串联

  $U = U_1 + U_2$恒定

  $I$任意
+ 电压源的并联

  $U = U_1 = U_2$恒定

  $I$任意
+ 电流源的串联

  $I = I_1 = I_2$恒定

  $U$任意
+ 电流源的并联

  $I = I_1 + I_2$恒定

  $U$任意
+ 电压源与电流源的并联：就是电压源
+ 电压源与电流源的串联：就是电流源
+ 电压源与电阻的并联：就是电压源
+ 电流源与电阻的串联：就是电流源
+ 电压源和电流源的等效变换

  #image("assets/image-21.png")
+ 电源的分裂

  用多个电源等效替代一个电源
==== 电源转移
+ 无伴电压源：无电阻与之串联
+ 无伴电流源：无电阻与之并联
+ 无伴电压源的转移
  #image("assets/image-24.png")
+ 无伴电流源的转移
  #image("assets/image-25.png")
=== 含受控电源电路的等效变换
把受控电源作为独立电源来对待，控制作用不能改变。

不能把受控源的控制量消除掉。
=== T形电路和Π形电路的等效变换
+ T形电路和Π形电路

  #image("assets/image-26.png")
+ T形电路和Π形电路的等效变换

  #image("assets/image-27.png")
+ 对称T形电路和对称Π形电路的等效变换（三个电阻值相等）

  #image("assets/image-28.png")
=== 含等电压节点和零电流支路电路的等效变换
+ 等电压节点与短路等效
+ 零电流支路与开路等效
+ 翻转对称性
+ 翻转对称性定理：可沿对称轴剖分成两个全同电路，平行连线断开后保持开路，交叉连线断开后互相短路。

  #image("assets/image-29.png")
+ 旋转对称性
+ 旋转对称性定理：可沿旋转轴剖分成两个互为倒像的子电路，平行连线断开后互相短路，交叉连线断开后保持开路。

  #image("assets/image-30.png")

#image("assets/image-31.png")
#note[][求内部不能进行等效]
== 支路分析法
+ KCL-KVL方法：支路电流和支路电压

  2b法：KCL, KVL, VCR
+ 支路分析法：支路电流或支路电压

  1b法：KCL, KVL

  支路：流过同一个电流的构成一条支路

  节点：三条或三条以上支路的连接点

  支路电流法：以支路电流为未知量，将VCR代入KVL方程中，消去支路电压变量

  支路电压法：以支路电压为未知量，将VCR代入KCL方程中，消去支路电流变量
== 回路分析法
以回路电流为未知量，将VCR代入KVL方程中，消去支路电压变量。

视察法

#image("assets/image-33.png")
$ R I = U_s $

$R$称回路电阻矩阵，为对称矩阵。

（对角线上）自电阻：回路所有电阻之和，恒正

（非对角线）互电阻：回路间公共支路电阻

$U_s$：回路中所有电压源的代数和（回路电流方向相同为负，相反为正——与KVL正好相反）
#note[][可使网孔电流取向都为顺时针，此时互电阻恒负。但外网孔需取向逆时针，才能使互电阻恒负。]
#note[含受控源][将受控源当作独立电源处理，多出一个未知量，移项后回路电阻矩阵对称性被破坏。]
#note[含无伴电流源][
  + 增加未知量：增设电流源电压为未知量，增加电流源支路方程。
  + 广义网孔：跨过电流源支路，组成一个大的广义网孔，增加电流源支路方程。
  + 虚网孔：选取恰好一个独立回路独占电流源，增加外网孔方程，少列一个方程。
  + 电流源转移：无伴变有伴，有伴电流源变电压源
]
#note[含无伴电压源][无伴电压源支路可认为是电阻值为0的电阻与电压源串联]
== 节点分析法
以节点电压为未知量，将VCR代入KCL方程中，消去支路电流变量。

视察法

#image("assets/image-36.png")
$ G U = I_s $

$G$称节点电导矩阵，为对称矩阵。

（对角线上）自电导：连接节点所有支路电导之和，恒正

（非对角线）互电导：节点间支路的电导，恒负

$I_s$：节点所有电流源电流的代数和（流入为正，流出为负——与KCL正好相反）
#note[含受控源][将受控源当作独立电源处理，多出一个未知量，移项后节点电导矩阵对称性被破坏。]
#note[含无伴电压源][
  + 增加未知量：增设电压源电流为未知量，增加电压源节点方程。
  + 广义节点：跨过电压源节点，构成一个闭合面作为广义节点，增加电压源节点方程。
  + 虚节点：选取恰好一个节点独占电压源，少列一个方程。
  + 电压源转移：无伴变有伴，有伴电压源变电流源。
]
#note[含无伴电流源][无伴电流源支路可认为是电导值为 0 的电阻与电流源并联。
]
#note[含运放][不能选运放输出节点列方程，根据虚短增加一个方程。]
== 回路分析的矩阵方法
=== 广义支路及其特性方程的矩阵形式
#image("assets/image-32.png")
特性方程：
$ u_k = R_k i_k - R_k i_(S k) + u_(S k) $
$ i_k = G_k u_k - G_k u_(S k) + i_(S k) $
设电路具有$b$条支路，$n$个节点，将特性方程写成矩阵形式：
$ u_b = R_b i_b - R_b i_S + u_S $
$ i_b = G_b u_b - G_b u_S + i_S $
$i_b, u_b$：支路电流向量和支路电压向量

$u_S = mat(u_(S 1), u_(S 2), dots, u_(S b))^T$：电压源向量

$i_s = mat(i_(S 1), i_(S 2), dots, i_(S b))^T$：电流源向量

$R_b = "diag"(R_1, R_2, dots, R_b)$：支路电阻矩阵

$G_b = "diag"(G_1, G_2, dots, G_b)$：支路电导矩阵
=== 网孔分析的矩阵方法
$R_m = M R_b M^T$

$u_(S m) = M R_b i_S - M u_S$
$ R_m i_m = u_(S m) $
=== 基尔霍夫定律的基本回路矩阵形式
+ 基本回路矩阵

  连支在前，树支在后。

  $ B = mat(E_l, B_t) $
+ 基尔霍夫定律的矩阵形式
  + KVL定律

    $u_b$：支路电压向量

    $u_l$：连支电压

    $u_t$：树支电压

    $ B u_b = 0 $

    $ u_l = - B_t u_t $
  + KCL定律

    $i_l$：基本回路电流向量

    $i_b$：支路电流向量

    $ i_b = B^T i_l $

=== 基本回路分析的矩阵方法
$R_l = B R_b B^T$

$u_(S l) = B R_b i_S - B u_S$

$ R_l i_l = u_(S l) $
== 割集分析的矩阵方法
=== 节点分析的矩阵方法
$G_n = A G_b A^T$

$i_(S n) = A G_b u_S - A i_S$

$ G_n u_n = i_(S n) $
=== 基尔霍夫定律的基本割集矩阵形式
+ 基本割集矩阵

  连支在前，树支在后。

  $ Q = mat(Q_l, E_t) $
+ 基尔霍夫定律的矩阵形式
  + KCL定律

    $i_b$：支路电流向量

    $i_l$：连支电流

    $i_t$：树支电流

    $ Q i_b = 0 $
    $ i_t = - Q_l i_l $
  + KVL定律

    $u_t$：基本割集电压向量

    $u_b$：支路电压向量

    $ u_b = Q^T u_t $
  === 基本割集分析的矩阵方法
  $G_q = Q G_b Q^T$

  $i_(S q) = Q G_b u_S - Q i_S$
  $ G_q u_t = i_(S q) $
= 电路定理
== 齐次性定理和叠加定理
+ 叠加定理
  #theorem[叠加定理][

    在线性电路中，任一电压或电流（响应）都是电路中各个独立电源（激励）单独作用时，在该处产生的电压或电流（响应）的叠加（代数和）。

    记激励为$omega_i$，记响应为$y$，则有$ y = k_1 omega_1 + dots.c + k_n omega_n $
  ]

  #note[][

    + 叠加定理只适用于线性电路。
    + 功率不能用叠加定理。
    + 不作用电源的置零：电压源短路，电流源开路。
    + 可把电源分组求解。
  ]
  #note[含受控源][受控电源不能作为独立源处理，必须保留在原网络中。]

  #note[含运放][有反馈则处于线性区，叠加定理适用。]

+ 齐次性定理

  #theorem[齐次性定理][

    在含有多个激励的线性电路中，当所有激励都同时增大或缩小k倍时，响应也将同样增大或缩小k倍。
  ]
== 置换定理
+ 置换定理
  #theorem[置换定理][

    一个有唯一解的电路$N$，若已知第$k$条支路的电压和电流为$u_k, i_k$，则不论该支路是由什么元件组成，总可以用电压等于$u_k$的独立电压源，或电流等于$i_k$的独立电流源替代它，整个电路$N$的工作状态不受影响。
  ]
  #note[][当$u_k$与$i_k$比值恒定时，也可用电阻置换。]
  #note[][

    + 可以置换非线性或时变支路，故可通过置换定理把非线性电路转换成线性电路。
    + 可根据置换定理撕裂网络。
      #image("assets/image-34.png")
      #image("assets/image-35.png")
      #image("assets/image-37.png")
    + 置换后的电路必须有唯一解。
      #image("assets/image-38.png")
    + 一般不置换受控支路，控制支路，磁耦合支路。
  ]
== 戴维宁定理
+ 戴维宁定理
  #theorem[戴维宁定理][
    任何线性含源电阻电路$N$可以用戴维宁电路等效。
  ]
  #note[][

    + 电路$N$必须是线性含源的，负载不能是耦合元件或受控元件（除非控制量是网络$N$的端口电压或电流）。
    + 电路$N$与负载之间应具有唯一解。
    + 求受控源电路的开路电压和等效电阻时，受控源不能当独立源处理，必须保留在电路中。
  ]
+ 开路电压的求取
  + 等效变换法（分压分流、电源变换）
  + 列方程法（回路分析法、节点分析法）
+ 等效电阻的求取
  + 串并联法（除源）
  + 外加电源法（除源）
  + 开路电压和短路电流法（不除源）
  + 加接测试电阻法（不除源）
  #note[][

    1最简便；在有受控源时，一般只得采用2或3；4在特殊情况下采用。

    使用2或3时保留受控源。]

== 诺顿定理
#theorem[诺顿定理][
  任何线性含源电阻电路$N$可以用诺顿电路等效。
]
#note[][

  + 诺顿定理中短路电流的求法类似于戴维宁定理中开路电压的求法。
  + 诺顿定理中等效电阻的求法等同于戴维宁定理中等效电阻的求法。
  + 受控源在诺顿定理中的处理方法等同于戴维宁定理。
  + 当单口网络内含受控源时，其输入等效电阻$R_(e q)$有可能等于零，则其戴维宁等效电路成为一个理想电压源，与之对应的诺顿等效电路不存在；同样，若其输入等效电导等于零，则其诺顿等效电路成为一个理想电流源，对应的戴维宁等效电路不存在。
]
== 互易定理

#theorem[互易定理1][

  对内部不含独立源和受控源的线性电阻电路$N_0$，
  $ hat(i)_alpha / hat(u)_(s beta) = i_beta / u_(s alpha) $
  若$hat(u)_(s beta) = u_(s alpha)$，则$hat(i)_alpha = i_beta$
  #image("assets/image-39.png")
]

#theorem[互易定理2][

  对内部不含独立源和受控源的线性电阻电路$N_0$，
  $ hat(u)_alpha / hat(i)_(s beta) = u_beta / i_(s alpha) $
  若$hat(i)_(s beta) = i_(s alpha)$，则$hat(u)_alpha = u_beta$
  #image("assets/image-40.png")
]

#theorem[互易定理3][

  对内部不含独立源和受控源的线性电阻电路$N_0$，
  $ hat(u)_alpha / hat(u)_(s beta) = i_beta / i_(s alpha) $
  若$hat(u)_(s beta) = hat(i)_(s alpha)$，则$hat(u)_alpha = i_beta$
  #image("assets/image-41.png")
]
#note[含受控源][
  + 有受控电源的电路一般是非互易电路。
  + 如果网孔电阻矩阵对称，则电路是互易的。
  + 如果节点电导矩阵对称，则电路是互易的。
]
#note[无源性][

  互易定理不适用回转器。故互易性与无源性是没有关系的。
]
#note[][
  + 互易定理只适用于线性无源定常网络在单一电源激励下端口两支路电压电流关系。
  + 当线性电路中含有多个独立电源时，应用叠加定理。
  + 互易定理1, 2中，互易前后激励和响应的极性保持一致（要么一致，要么都不一致）； 互易定理3中，极性不一致。
  + 互易定理只能求出互易支路的电压、电流，互易后其他支路的电压、电流发生变化。
  + 互易定理用于解平衡电桥网络和对称网络较方便。
  + 互易定理可以和戴维宁定理、诺顿定理结合使用。互易定理可以直接获得开路电压或短路电流、再用外加电源法获取等效电阻，即可使用戴维宁定理和诺顿定理。
  + 互易定理形式满足电路将独立电源置零后电路拓扑结构不变
]
#note[电桥平衡条件][$ R_1 R_4 = R_2 R_3 $]
== 对偶原理
+ 对偶电路
  #definition[对偶电路][

    如果电路$hat(N)$的节点方程与电路$N$的网孔方程不仅形式相同，各项系数以及激励的数值相同，那么电路方程的解的数值也分别相等，称这样的两个电路互为对偶电路。
  ]
+ 对偶原理
  #theorem[对偶原理][

    如果电路中某一关系（定理、方程等）的表述是成立的，则将表述中的概念用其对偶因素转换后所得的对偶表述也一定是成立的。
  ]
+ 对偶图
  #definition[对偶图][

    设电路$N$的网孔矩阵为$M$，电路$hat(N)$的关联矩阵为$hat(A)$，如果$M = hat(A)$，则这两个电路的有向图称为对偶图。
  ]
  #image("assets/image-44.png")
  若支路与网孔循行方向一致，则对偶图中支路取离开节点方向
== 最大功率传输定理
+ 传输功率的效率问题与大小问题
+ 最大功率传输定理
  #theorem[最大功率传输定理][

    含源线性电阻单口网络($R_o > 0$)向可变电阻负载$R_L$传输最大功率。此时称为最大功率匹配。

    最大功率条件：$R_L = R_o$

    最大功率：$P_max = u_(o c)^2 / (4 R_L)$

    效率：$eta = 50 %$
  ]
  #note[][
    + 一端口等效电阻消耗的功率一般并不等于端口内部消耗的功率，因此当负载获取最大功率时，电路的传输效率并不一定是50%。
    + 计算最大功率问题应用戴维宁定理或诺顿定理最方便。
  ]
== 受控源电路分析
+ 列方程求解法
+ 等效变换方法
+ 叠加定理
+ 戴维宁-诺顿定理
#note[][
  + 基尔霍夫定律、支路分析法、回路分析法、节点分析法时，作为独立电源，不增加未知数个数
  + 电源等效变换时，作为独立电源，但控制作用不能取消
  + 叠加定理时，不作为独立电源，必须保留受控源
  + 戴维宁定理、诺顿定理时，视具体情况而定
  + 置换定理时，被置换支路，一般不应该是受控源支路和控制支路
  + 互易定理时，一般不满足
]
== 端口特性分析
*一端口电路*
+ 一端口电路
  #image("assets/image-45.png")
=== 端口特性
+ 一端口电路的端口特性：端口电压-电流关系
+ 端口特性求法
  + 等效电路法
  + 外加电源法

=== 等效电路
+ 等效
+ 仅含电阻和/或受控源的一端口电路，$u = A i$
+ 含独立电源的一端口电路，$u = A i + B$
*二端口电路*
+ 二端口电路
  #image("assets/image-42.png")
+ 三端电路
  #image("assets/image-43.png")
+ 端口特性

  + 一端口电路
    $ f(u, i) = 0 $
  + 二端口电路

    双口网络特性方程一般式
    $ cases(f_1(u_1, u_2, i_1, i_2) = 0, f_2(u_1, u_2, i_1, i_2) = 0) $
    线性定常无独立源电阻网络
    $ cases(c_11 u_1 + c_12 u_2 + d_11 i_1 + d_12 i_2 = 0, c_21 u_1 + c_22 u_2 + d_21 i_1 + d_22 i_2 = 0) $
    矩阵形式
    $ mat(c_11 c_12; c_21 c_22) mat(u_1; u_2) + mat(d_11 d_12; d_21 d_22) mat(i_1; i_2) = mat(0; 0) $

=== 不含独立电源端口特性
==== 开路电阻参数
+ 开路电阻矩阵

  选择端口电流$i_1$和$i_2$作为独立变量，相当于二端口电路受到两个电流源$i_1$和$i_2$的共同激励。
  $
    mat(u_1; u_2) = -mat(c_11 c_12; c_21 c_22)^(-1) mat(d_11 d_12; d_21 d_22) mat(i_1; i_2) = mat(r_11 r_12; r_21 r_22) mat(i_1; i_2)
  $
  $ U = R I $
  $ R = mat(r_11 r_12; r_21 r_22) $
+ r参数的物理意义
  #{
    set text(size: 0.95em)
    grid(
      columns: 2,
      row-gutter: 1em,
      column-gutter: 1em,
      [$r_11 = u_1/i_1|_(i_2=0)$：出口开路时入口驱动点电阻], [$r_12 = u_1/i_2|_(i_1=0)$：入口开路时反向转移电阻],
      [$r_21 = u_2/i_1|_(i_2=0)$：出口开路时正向转移电阻], [$r_22 = u_2/i_2|_(i_1=0)$：入口开路时出口驱动点电阻],
    )
  }
+ 等效电路
  + 一般等效电路
    #image("assets/image-46.png")
  + T形等效电路
    #image("assets/image-47.png")
    当$r_21 = r_12$时，T形等效电路成为纯电阻的二端口电路。
    #image("assets/image-48.png")
+ r参数的求法
  + 电路结构已知
    + 定义法——两个端口分别加单位电源
    + 列方程法——端口特性方程，回路分析法
  + 电路结构未知
    + 实验室方法——外加电源法
+ 互易性：满足互易定理2时
  $ r_12 = r_21 $
  #note[][

    + 互易双口网络，开路电阻矩阵是对称的。
    + 互易双口网络，回路电阻矩阵是对称的。
  ]
+ 对称性：互易网络的两个端口交换而端口电压电流的数值不变，则此网络是对称的。
  $ cases(r_11 = r_22, r_12 = r_21) $

==== 短路电导参数
+ 短路电导矩阵

  选择端口电压$u_1$和$u_2$作为独立变量，相当于二端口电路受到两个电压源$u_1$和$u_2$的共同激励。
  $
    mat(i_1; i_2) = -mat(d_11 d_12; d_21 d_22)^(-1) mat(c_11 c_12; c_21 c_22) mat(u_1; u_2) = mat(g_11 g_12; g_21 g_22) mat(u_1; u_2)
  $
  $ I = G U $
  $ G = mat(g_11 g_12; g_21 g_22) $
+ g参数的物理意义
  #{
    set text(size: 0.95em)
    grid(
      columns: 2,
      row-gutter: 1em,
      column-gutter: 1em,
      [$g_11 = i_1/u_1|_(u_2=0)$：出口短路时入口驱动点电导], [$g_12 = i_1/u_2|_(u_1=0)$：入口短路时反向转移电导],
      [$g_21 = i_2/u_1|_(u_2=0)$：出口短路时正向转移电导], [$g_22 = i_2/u_2|_(u_1=0)$：入口短路时出口驱动点电导],
    )
  }
+ 等效电路
  + 一般等效电路
    #image("assets/image-49.png")
  + Π形等效电路
    #image("assets/image-50.png")
    当$g_21 = g_12$时，Π形等效电路成为纯电导的二端口电路。
    #image("assets/image-51.png")
+ g参数的求法
  + 电路结构已知
    + 定义法——两个端口分别加单位电源
    + 列方程法——端口特性方程，节点分析法
  + 电路结构未知
    + 实验室方法——外加电源法
+ 互易性：满足互易定理1时
  $ g_12 = g_21 $
  #note[][

    + 互易双口网络，短路电导矩阵是对称的。
    + 互易双口网络，节点电导矩阵是对称的。
  ]
+ 对称性：互易网络的两个端口交换而端口电压电流的数值不变，则此网络是对称的。
  $ cases(g_11 = g_22, g_12 = g_21) $
+ $r$参数与$g$参数的关系
  $ G R = 1 $
==== 第一种混合参数
+ 混合参数矩阵

  选择入口电流$i_1$和出口电压$u_2$作为独立变量。
  $ mat(u_1; i_2) = H mat(i_1; u_2) $
  $ H = mat(h_11 h_12; h_21 h_22) $
+ $h$参数的物理意义
  #{
    set text(size: 0.95em)
    grid(
      columns: 2,
      row-gutter: 1em,
      column-gutter: 1em,
      [$h_11 = u_1/i_1|_(u_2=0)$：出口短路时入口驱动点电阻], [$h_12 = u_1/u_2|_(i_1=0)$：入口开路时反向电压传输比],
      [$h_21 = i_2/i_1|_(u_2=0)$：出口短路时正向电流传输比], [$h_22 = i_2/u_2|_(i_1=0)$：入口开路时出口驱动点电导],
    )
  }
+ 等效电路
  #image("assets/image-52.png")
+ 互易性：满足互易定理3时
  $ h_12 = -h_21 $
+ 对称性：互易网络的两个端口交换而端口电压电流的数值不变，则此网络是对称的。
  $ cases(h_11 h_22 - h_12 h_21 = 1, h_12 = -h_21) $

==== 第二种混合参数
+ 混合参数矩阵

  选择入口电压$u_1$和出口电流$i_2$作为独立变量。
  $ mat(i_1; u_2) = hat(H) mat(u_1; i_2) $
  $ hat(H) = mat(hat(h)_11 hat(h)_12; hat(h)_21 hat(h)_22) $
+ $hat(h)$参数的物理意义
  #{
    set text(size: 0.95em)
    grid(
      columns: 2,
      row-gutter: 1em,
      column-gutter: 1em,
      [$hat(h)_11 = i_1/u_1|_(i_2=0)$：出口开路时入口驱动点电导],
      [$hat(h)_12 = i_1/i_2|_(u_1=0)$：入口短路时反向电流传输比],

      [$hat(h)_21 = u_2/u_1|_(i_2=0)$：出口开路时正向电压传输比],
      [$hat(h)_22 = u_2/i_2|_(u_1=0)$：入口短路时出口驱动点电阻],
    )
  }
+ 等效电路
  #image("assets/image-53.png")
+ 互易性：满足互易定理3时
  $ hat(h)_12 = -hat(h)_21 $
+ 对称性：互易网络的两个端口交换而端口电压电流的数值不变，则此网络是对称的。
  $ cases(hat(h)_11 hat(h)_22 - hat(h)_12 hat(h)_21 = 1, hat(h)_12 = -hat(h)_21) $
+ $h$参数与$hat(h)$参数的关系
  $ H hat(H) = 1 $
==== 第一种传输参数
+ 传输参数矩阵

  选择出口电压$u_2$和出口电流$i_2$作为独立变量。
  $ mat(u_1; i_1) = A mat(u_2; -i_2) $
  $ A = mat(a_11 a_12; a_21 a_22) $
+ $a$参数的物理意义
  #{
    set text(size: 0.95em)
    grid(
      columns: 2,
      row-gutter: 1em,
      column-gutter: 1em,
      [$a_11 = u_1/u_2|_(i_2=0)$：出口开路时反向电压传输比], [$a_12 = u_1/(-i_2)|_(u_2=0)$：出口短路时转移电阻],
      [$a_21 = i_1/u_2|_(i_2=0)$：出口开路时转移电导], [$a_22 = i_1/(-i_2)|_(u_2=0)$：出口短路时反向电流传输比],
    )
  }
+ 等效电路
  #image("assets/image-56.png")
+ 互易性：满足互易定理时
  $ a_11 a_22 - a_12 a_21 = 1 $
+ 对称性：互易网络的两个端口交换而端口电压电流的数值不变，则此网络是对称的。
  $ cases(a_11 = a_22, a_11 a_22 - a_12 a_21 = 1) $

==== 第二种传输参数
+ 传输参数矩阵

  选择入口电压$u_1$和入口电流$i_1$作为独立变量。
  $ mat(u_2; i_2) = hat(A) mat(u_1; -i_1) $
  $ hat(A) = mat(hat(a)_11 hat(a)_12; hat(a)_21 hat(a)_22) $
+ $hat(a)$参数的物理意义
  #{
    set text(size: 0.95em)
    grid(
      columns: 2,
      row-gutter: 1em,
      column-gutter: 1em,
      [$hat(a)_11 = u_2/u_1|_(i_1=0)$：入口开路时正向电压传输比],
      [$hat(a)_12 = u_2/(-i_1)|_(u_1=0)$：入口短路时转移阻抗],

      [$hat(a)_21 = (i_2)/u_1|_(i_1=0)$：入口开路时转移导纳],
      [$hat(a)_22 = (i_2)/(-i_1)|_(u_1=0)$：入口短路时正向电流传输比],
    )
  }
+ 等效电路
  #image("assets/image-55.png")
+ 互易性：满足互易定理时
  $ hat(a)_11 hat(a)_22 - hat(a)_12 hat(a)_21 = 1 $
+ 对称性：互易网络的两个端口交换而端口电压电流的数值不变，则此网络是对称的。
  $ cases(hat(a)_11 = hat(a)_22, hat(a)_11 hat(a)_22 - hat(a)_12 hat(a)_21 = 1) $
+ $a$参数与$hat(a)$参数的关系
  $ A hat(A) != 1 $
==== 各参数间的关系
+ 各参数间的转换

  转换回本源方程再重新写出
+ 不是所有的双口电路都具有全部六种参数矩阵
=== 不含独立源连接方式
==== 串联连接
+ 串联连接
  #image("assets/image-57.png")
+ 参数矩阵关系
  $ R = R_1 + R_2 $
+ 有效性测试：两次测量中电压表的读数均为零。
  #image("assets/image-58.png")
#note[][三端电路串联连接一定破坏口条件。]
==== 并联连接
+ 并联连接
  #image("assets/image-59.png")
+ 参数矩阵关系
  $ G = G_1 + G_2 $
+ 有效性测试：两次测量中电压表的读数均为零。
  #image("assets/image-60.png")
#note[][三端电路并联连接一定保持口条件。]
==== 串-并联连接
+ 串-并联连接
  #image("assets/image-61.png")

+ 参数矩阵关系
  $ H = H_1 + H_2 $
+ 有效性测试：两次测量中电压表的读数均为零。
  #image("assets/image-62.png")
==== 并-串联连接
+ 并-串联连接
  #image("assets/image-63.png")
+ 参数矩阵关系
  $ hat(H) = hat(H)_1 + hat(H)_2 $
+ 有效性测试：两次测量中电压表的读数均为零。
  #image("assets/image-64.png")
==== 级联连接
+ 级联连接
  #image("assets/image-65.png")
+ 参数矩阵关系
  #image("assets/image-66.png")
  $ A = A_1 A_2 $
  #image("assets/image-67.png")
  $ hat(A) = hat(A)_2 hat(A)_1 $
+ 有效性测试：级联不会破坏端口条件，必然有效。
==== 端接连接
+ 端接
  #image("assets/image-68.png")
+ 参数
  #image("assets/image-69.png")
  $ u_1 = r_11 i_1 + r_12 i_2 $

  $ u_2 = r_21 i_1 + r_22 i_2 $

  $ u_1 = u_S - R_S i_1 $

  $ u_2 = - R_L i_2 $
+ 输入电阻
  #image("assets/image-70.png")
  输入电阻越大越好
  $ R_i = u_1 / i_1 = (r_11 R_L + Delta_r) / (r_22 + R_L) $
+ 输出电阻
  #image("assets/image-71.png")
  输出电阻越小越好
  $ R_o = u_2 / i_2 = (r_22 R_S + Delta_r) / (r_11 + R_S) $
+ 电压传输比（电压放大倍数）
  $ A_u = u_2 / u_1 = (r_21 R_L) / (r_11 R_L + Delta_r) $
+ 转移电压比 （电压增益）
  $ H_u = u_2 / u_S = A_u (R_i) / (R_S + R_i) $
+ 电流传输比（电流放大倍数）
  $ A_i = i_2 / i_1 = -(r_21) / (r_22 + R_L) $
+ 转移电流比（电流增益）
  $ H_i = i_2 / i_S = A_i (G_i) / (G_S + G_i) $

=== 含独立电源端口特性
==== $R$端口特性
$ mat(u_1; u_2) = mat(r_11 r_12; r_21 r_22) mat(i_1; i_2) + mat(u_(1o c); u_(2o c))_(i_1 = 0, i_2 = 0) $
#align(center)[#image("assets/image-72.png")]
==== $G$端口特性
$ mat(i_1; i_2) = mat(g_11 g_12; g_21 g_22) mat(u_1; u_2) + mat(i_(1s c); i_(2s c))_(u_1 = 0, u_2 = 0) $
#align(center)[#image("assets/image-73.png")]
==== $H$端口特性
$ mat(u_1; i_2) = mat(h_11 h_12; h_21 h_22) mat(i_1; u_2) + mat(u_(1o c); i_(2s c))_(i_1 = 0, u_2 = 0) $
#align(center)[#image("assets/image-77.png")]
==== $hat(H)$端口特性
$
  mat(i_1; u_2) = mat(hat(h)_11 hat(h)_12; hat(h)_21 hat(h)_22) mat(u_1; i_2) + mat(i_(1s c); u_(2o c))_(u_1 = 0, i_2 = 0)
$
#align(center)[#image("assets/image-74.png")]
==== $A$端口特性
$ mat(u_1; i_1) = mat(a_11 a_12; a_21 a_22) mat(u_2; -i_2) + mat(tilde(u)_1; tilde(i)_1) $
#align(center)[#image("assets/image-75.png")]
==== $hat(A)$端口特性
$ mat(u_2; i_2) = mat(hat(a)_11 hat(a)_12; hat(a)_21 hat(a)_22) mat(u_1; -i_1) + mat(tilde(u)_2; tilde(i)_2) $
#align(center)[#image("assets/image-76.png")]
=== 电路分析
+ 端口特性方程
+ 双口电路的等效电路
= 非线性电阻电路分析
== 二极管电路
=== 二极管特性
+ 实际二极管
  #image("assets/image-78.png")
+ 理想二极管
  - 正向导通时，正向管压降为零，相当于开关闭合
  - 反向截止时，反向电流降为零，相当于开关断开
  #image("assets/image-79.png")
=== 电路分析
+ 理想二极管电路分析

  将二极管断开，分析二极管两端电位的高低
  #note[优先导通法][共阴极结构或共阳极结构中，压降大的优先导通。]

#pagebreak()
#align(left + horizon)[
  #text(size: 2em, weight: "bold")[第二篇　动态电路]
]
#pagebreak()

= 动态电路的时域分析
== 动态元件
=== 电容元件
#definition[电容元件][

  一个二端元件，任一时刻$t$的端电压$u$和元件上的电荷$q$能用$u-q$平面上的曲线表示。
  #image("assets/image-80.png")
]

==== 线性非时变电容元件
+ 特性方程

  $ q(t) = C u(t) $

  $ u(t) = S q(t) $

  $C$是电容，单位：法拉 ($F$)

  $S = 1/C$是倒电容，单位：倒法拉 ($F^(-1)$)

+ 大小
  $ C = (epsilon S) / d $
+ 伏安特性
  + 动态特性
    $ i = C (d u) / (d t) $
    #note[][电流是电压的线性函数。]
  + 记忆特性
    $ u = u(t_0) + 1/C integral_(t_0)^t i(tau) d tau $
    #note[][电压能记忆电流的历史。]
  + 连续性
    $ Delta t -> 0, Delta u -> 0 $
    #note[][电容电压不会跳变。]
  + 初始值
    $ u = u(0) + 1/C integral_(0)^t i(tau) d tau $
    #note[][只有当$u(0) = 0$时，电压才是电流的线性函数。]
  + 等效变换
    + 非零初始电压电容元件的等效电路
      #image("assets/image-81.png")
    + 零初始电压电容元件的并联
      $ C_(e q) = C_1 + dots + C_n $
      并联分流公式：$ i_k = C_k / C_(e q) i $
    + 零初始电压电容元件的串联
      $ S_(e q) = S_1 + dots + S_n $
      串联分压公式：$ u_k = S_k / S_(e q) u $

==== 电容元件的能量
+ 瞬时功率
  $ p_c = u i $
+ 能量
  $ w_C (t_0, t) = integral_0^(q(t)) f(q) d q $
  #image("assets/image-82.png")
  + 如果电容元件的库伏特性曲线通过原点位于第一或第三象限，它所储存的能量总是正的，这种电容元件称为无源电容元件。
  + 线性非时变电容
    $ w_C (t_0, t) = 1 / 2 C u^2 $

#note[][对于不连续函数，用$epsilon(t), r(t), delta(t)$来描述。]

#note[积分运算电路][
  #image("assets/image-83.png")
  $ u_o = - 1 / (R_1 C) integral_(- infinity)^t u_i d t $
]

#note[微分运算电路][
  #image("assets/image-84.png")
  $ u_o = - R_F C (d u_i) / (d t) $
]
=== 电感元件
#definition[电感元件][

  一个二端元件，任一时刻$t$的磁通$Psi$与流过它的电流$i$能用$Psi-i$平面上的曲线表示。
  #image("assets/image-85.png")
]
==== 线性非时变电感元件
+ 特性方程
  $ Psi(t) = L i(t) $
  $ i(t) = Gamma Psi(t) $
  $L$是电感，单位：亨利 ($H$)

  $Gamma = L^(-1)$是电导，单位：倒亨利 ($H^(-1)$)
+ 大小
  $ L = (mu S N^2) / l $
+ 伏安特性
  + 动态特性
    $ u = L (d i) / (d t) $
    #note[][电压是电流的线性函数。]
  + 记忆特性
    $ i = i(t_0) + 1/L integral_(t_0)^t u(tau) d tau $
    #note[][电流能记忆电压的历史。]
  + 连续性
    $ Delta t -> 0, Delta i -> 0 $
    #note[][电感电流不会跳变。]
  + 初始值
    $ i = i(0) + 1/L integral_(0)^t u(tau) d tau $
    #note[][只有当$i(0) = 0$时，电流才是电压的线性函数。]
  + 等效变换
    + 非零初始电流电感元件的等效电路
      #image("assets/image-86.png")
    + 零初始电流电感元件的串联
      $ L_(e q) = L_1 + dots + L_n $
      串联分压公式：$ u_k = L_k / L_(e q) u $
    + 零初始电流电感元件的并联
      $ Gamma_(e q) = Gamma_1 + dots + Gamma_n $
      并联分流公式：$ i_k = Gamma_k / Gamma_(e q) i $

==== 电感元件的能量
+ 瞬时功率
  $ p_L = u i $
+ 能量
  $ w_L (t_0, t) = integral_0^(Psi(t)) f(Psi) d Psi $
  #image("assets/image-87.png")
  + 如果电感元件的韦安特性曲线通过原点位于第一或第三象限，它所储存的能量总是正的，这种电感元件称为无源电感元件。
  + 线性非时变电感
    $ w_L (t_0, t) = 1 / 2 L i^2 $

=== 耦合电感元件
#image("assets/image-88.png")
==== 线性耦合电感元件
+ 特性方程
  + 矩阵形式
    $ mat(Psi_1; Psi_2) = mat(Psi_11 + Psi_12; Psi_21 + Psi_22) = mat(L_1 M; M L_2) mat(i_1; i_2) $
    $L_1, L_2$：自感，恒为正

    $M$：互感，可正可负
  + 同名端
    #image("assets/image-89.png")
  + 耦合系数
    $ k := sqrt(Psi_12 / Psi_11 Psi_21 / Psi_22) = abs(M) / sqrt(L_1 L_2) $
  + 三线圈耦合
    $ mat(Psi_1; Psi_2; Psi_3) = mat(L_11, M_12, M_13; M_21, L_22, M_23; M_31, M_32, L_33) mat(i_1; i_2; i_3) $
+ 伏安特性
  $ mat(u_1; u_2) = mat(u_11 + u_12; u_21 + u_22) = mat(L_1, M; M, L_2) mat((d i_1)/(d t); (d i_2)/(d t)) $
  $
    mat(i_1; i_2) = mat(Gamma_11, Gamma_12; Gamma_21, Gamma_22) mat(integral_0^t u_1(tau) d tau; integral_0^t u_2(tau) d tau)
  $
  $Psi = L^(-1)$：倒电感矩阵
+ 去耦等效
  + 受控电压源等效
    #image("assets/image-90.png")
  + 受控电流源等效
    #image("assets/image-91.png")
  + T形等效

    当两个耦合电感元件有公共端钮时
    #stack(dir: ltr, spacing: 1em, image("assets/image-92.png"), image("assets/image-93.png"))
    #note[][
      + 同名端相接时，$M>0$；异名端相接时，$M<0$
      + T形去耦增加了节点，但没有增加回路，适合回路分析法
    ]
  + $Pi$形等效

    当两个耦合电感元件有公共端钮时
    #stack(dir: ltr, spacing: 1em, image("assets/image-94.png"), image("assets/image-95.png"))

    #note[][

      + 同名端相接时，$Gamma < 0$；异名端相接时，$Gamma > 0$
      + $Pi$形去耦增加了回路，但没有增加节点，适合节点分析法
    ]
+ 串联等效
  #image("assets/image-96.png")
  $ L_(e q) = L_1 + L_2 + 2 M $
  #note[][
    顺接时，$M > 0$；反接时，$M < 0$
  ]
+ 并联等效
  #image("assets/image-97.png")
  $ Gamma_(e q) = Gamma_1 + Gamma_2 + 2 Gamma $

  #note[][
    同侧并联时，$Gamma < 0$；异侧并联时，$Gamma > 0$
  ]
  $ L_(e q) = 1/Gamma_(e q) = (L_1 L_2 - M^2)/(L_1 + L_2 - 2 M) $
==== 耦合电感元件的能量
+ 瞬时功率
  $ p = u^T i = u_1 i_1 + u_2 i_2 $
+ 能量
  $ w = 1/2 L_1 i_1^2 + M i_1 i_2 + 1/2 L_2 i_2^2 $
== 动态电路方程
一阶电路：输出方程是一阶微分方程

电路的阶数可以通过独立储能元件的个数判断。

#note[储能元件不独立的情况][
  + 电容串联或并联或与理想电压源构成回路。
  + 电感串联或并联或与理想电流源构成割集。
]
== 动态电路的初始状态和变量初始值
=== 暂态过程
+ 暂态过程

  稳态：各支路电压和电流为不随时间变化的直流量或者为幅值和频率恒定的正弦量
  暂态：换路后从一种稳态到另一种稳态的过渡过程
+ 暂态过程的产生原因
  + 含有储能元件
  + 发生换路
  根本原因是电场能和磁场能不能突变
=== 换路定律
#theorem[换路定律][
  $ u_C (0_+) = u_C (0_-) $
  $ i_L (0_+) = i_L (0_-) $
]
=== 初始值
+ 初始值：$t = 0_+$的值
+ 原始值：$t = 0_-$的值
+ 初始值的求取
  + 采用电路分析法（电容视为开路，电感视为短路）或能量分析法求$u_C (0_-), i_L (0_-)$，通过换路定律求$u_C (0_+), i_L (0_+)$
  + 由置换定理把电容电压，电感电流置换为电压源，电流源，求其它电量的初始值
=== 强迫跳变
+ 换路定律不适用的情况

  破坏换路定律条件1：电容电流$i_C$，电感电压$u_L$为有限值
  + 冲激信号
  破坏换路定律条件2：电容电压$u_C$，电感电流$i_L$为连续量
  + 电压源和电流源
  + 受控电压源和受控电流源
  + 电容组成的回路，电感组成的割集，运放

  强迫跳变的条件：
  + 换路后存在全部由电容组成的回路或由电容与理想电压源组成的回路
  + 换路后存在全部由电感组成的割集或由电感与理想电流源组成的割集
+ 换路定律

  电荷守恒：$q$不能突变

  磁链守恒：$Psi$不能突变
+ 初始值求取
  + 全部由电容组成的回路
    $ sum_(i=1)^n C_i [u_(C i ) (0_+) - u_(C i ) (0_-)] = 0 $
  + 电容与理想电压源组成的回路
    $ u_C (0_+) = u_s $
  + 全部由电感组成的割集
    $ sum_(i=1)^n L_i [i_(L i ) (0_+) - i_(L i ) (0_-)] = 0 $
  + 电感与理想电流源组成的割集
    $ i_L (0_+) = i_s $



== 一阶动态电路的零输入响应
=== 一阶RC电路的零输入响应
+ 零输入响应
  #align(center)[#image("assets/image-98.png")]
  $ u_C = U e^(-t/tau) $
+ 时间常数
  $ tau = R C $
  + 暂态时间

    $t = tau$时，$u_C = U e^(-1) = 36.8% U$

    $t = 4 tau ~ 5 tau$时，$u_c -> 0$
  + 物理意义
    $tau$越大，放电越慢
  + 几何意义
    + 起始点法
      #image("assets/image-99.png")
    + 任意点法一
      #image("assets/image-100.png")
      $ (d u_C) / (d t) = - (u_C (t_0)) / tau $
    + 任意点法二
      #image("assets/image-101.png")
      $ (u_C (t_0 + tau)) / (u_C (t_0)) = e^(-1) = 36.8% $
  + 固有频率
    $ s = -1/tau = -1/(R C) $
+ 能量
  $ W_R = W_C = 1/2 C U^2 $
=== 一阶RL电路的零输入响应
+ 零输入响应
  #align(center)[#image("assets/image-102.png")]
  $ i_L = I e^(-t/tau) $
+ 时间常数
  $ tau = L / R $
  固有频率：
  $ s = -1/tau = -R/L $
== 一阶动态电路的零状态响应
=== 一阶电路在直流电源激励下的零状态响应
+ 零状态响应
  #align(center)[#image("assets/image-103.png")]
  $ u_C = (-U e^(-t/(R C)) + U) epsilon(t) $
+ 能量
  $ W_S = W_C + W_R = C U^2 $
=== 一阶电路在正弦电源激励下的零状态响应
+ 零状态响应
  #align(center)[#image("assets/image-104.png")]
  $ u_C = [-U_m cos psi e^(-t/(R C)) + U_m cos(omega t + psi)] epsilon(t) $
  其中
  $ I_m = sqrt((-omega C U_m)^2 + (U_m / R)^2) $
  $ U_m = I_m / sqrt((omega C)^2 + (1/R)^2) $
  $ psi = phi - arctan omega R C $
+ 分析

  $t=0_+$，$u_C = 0$

  $psi = pi / 2$，暂态分量为0，直接进入稳态

  $psi = 0$，如果$tau$远大于输入信号周期，则经过半个周期左右的时间$u_C (pi) approx -2 U_m$，最大瞬时绝对值接近于稳态电压振幅的2倍。
=== 一阶电路的阶跃响应
+ 单位阶跃响应
  #align(center)[#image("assets/image-105.png", width: 25%)]
  $ s(t) = u_C = R(1-e^(-t/(R C))) epsilon(t) $
+ 单位延迟阶跃响应

  非时变特性：
  $ s(t - t_0) $
=== 一阶电路的冲激响应
+ 单位冲激响应
  #align(center)[#image("assets/image-106.png")]
  $ h(t) = u_C = 1/C e^(-t/(R C)) epsilon(t) $
+ 冲激响应与阶跃响应的关系
  $ h(t) = (d s(t))/(d t) $
  $ s(t) = integral_(-infinity)^t h(tau) d tau $
=== 对任意输入的零状态响应（卷积积分）
$ y(t) = integral_0^t f(tau) h(t - tau) d tau $
== 一阶动态电路的全响应
=== 一阶电路在阶跃电源激励下的全响应
+ 全响应：由输入激励和原始状态共同引起的响应
+ 激励的叠加性

  全响应 = 零输入响应 + 零状态响应
  $ u_C = U_0 e^(-t/(R C)) + R I_S (1 - e^(-t/(R C))) $
+ 响应的叠加性

  全响应 = 暂态响应 + 稳态响应
  $ u_C = R i_S + (U_0 - R i_S) e^(-t/(R C)) $
=== 一阶电路的经典方法
+ 经典法：微分方程
=== 一阶电路的三要素法
+ 三要素法

  全响应 = 齐次解 + 特解
  $ y(t) = [y(0_+) - y_S (0_+)] e^(-t/tau) + y_S (infinity) $
  直流或阶跃电源激励下
  $ y(t) = [y(0_+) - y(infinity)] e^(-t/tau) + y(infinity) $
  #note[三要素法的适用条件][
    + 线性定常电路
    + 有损耗的一阶线性电路
    + 电路在$t=0$时换路
  ]
+ 三要素的计算
  + 稳态值$y(infinity)$：电路分析法
  + 初始值$y(0_+)$：换路定律或电荷守恒，磁链守恒
  + 时间常数$tau$
    $ tau = R_0 C_0 $
    $ tau = L_0 / R_0 $

    $R_0$为换路后电路除源后从储能元件两端看过去的等效电阻。

    $C_0, L_0$为储能元件的等效电容，等效电感。
#note[][$tau$与初始状态无关。]
#note[][多储能元件中，计算时间常数时可以从电阻看进去求等效电容/电感]
== 二阶动态电路的响应
=== 二阶RLC电路的零输入响应
+ 二阶微分方程求解
  #align(center)[#image("assets/image-107.png")]
  $ L C (d^2 i_L) / (d t^2) + L / R (d i_L)/(d t) + i_L = 0 $
  特征根（实部恒负）：
  $ s_(1, 2) = - alpha + sqrt(alpha^2 - omega^2) $
  衰减系数：$ alpha = 1/(2 R C) $
  谐振频率：$ omega_0 = 1 / sqrt(L C) $
+ 零输入响应
#align(center)[
  #grid(
    columns: (28%, 25%),
    gutter: 2em,
    align: center + horizon,
    image("assets/image-108.png"), image("assets/image-110.png"),
    [过阻尼/临界阻尼], [欠阻尼],
  )
]
#align(center)[#image("assets/image-111.png")]
= 动态电路的复频域分析
== 拉普拉斯变换及其性质
=== 拉普拉斯变换的定义
+ 拉氏变换
  $ F(s) = cal(L)(f(t)) = integral_(0_-)^infinity f(t) e^(-s t) d t $
  $s = sigma + j omega$是复频率，$f(t)$为原函数，$F(s)$为象函数
+ 常用函数的拉氏变换
  #stack(
    dir: ltr,
    spacing: 3em,
    three-line-table[
      | 原函数 | 象函数 |
      | --- | --- |
      | $delta(t)$ | $1$ |
      | $delta^((n)) (t)$ | $s^n$ |
      | $epsilon(t)$ | $1/s$ |
      | $A$ | $A/s$ |
      | $t^n/n!$ | $1/s^(n+1)$ |
      | $e^(-alpha t)$ | $1/(s + alpha)$ |
      | $t^n / n! e^(-alpha t)$ | $1/(s + alpha)^(n+1)$ |
    ],
    three-line-table[
      | 原函数 | 象函数 |
      | --- | --- |
      | $sin(omega t)$ | $omega/(s^2 + omega^2)$ |
      | $cos(omega t)$ | $s/(s^2 + omega^2)$ |
      | $e^(-alpha t) sin omega t$ | $omega/((s+alpha)^2 + omega^2)$ |
      | $e^(-alpha t) cos omega t$ | $(s+alpha)/((s+alpha)^2 + omega^2)$ |
      | $a e^(-alpha t) cos omega t + (b - a alpha)/omega e^(-alpha t) sin omega t$ | $(a s + b)/((s+alpha)^2 + omega)$ |
      | $2 abs(K) e^(-alpha t) cos(omega t + phi_K)$ | $K/(s + alpha - j omega) + K^* /(s + alpha + j omega)$ |
    ],
  )
=== 拉普拉斯变换的基本性质
+ 线性性质
  $ cal(L)(a_1 f_1(t) + a_2 f_2(t)) = a_1 F_1(s) + a_2 F_2(s) $
+ 微分性质
  $ cal(L)(d/(d t) f(t)) = s F(s) - f(0_-) $
  $ cal(L)(f^((n)) (t)) = s^n F(s) - sum_(k=0)^(n-1) s^k f^((n-1-k)) (0_-) $
  #note[][$f(t)$如果在$t=0$跳变，不影响$f(t)$的拉氏变换，影响$f^' (t)$的拉氏变换]
+ 积分性质
  $ cal(L)(integral_(0_-)^t f(tau) d tau) = 1/s F(s) $
+ 时域平移性质（延迟定理）
  $ cal(L)(f(t-tau)) = e^(-s tau) F(s) $
+ 频域平移性质
  $ cal(L)(e^(alpha t) f(t)) = F(s-alpha) $
+ 初值定理
  $ f(0_+) = lim_(s->oo) s F(s) $
+ 终值定理
  $ f(oo) = lim_(s->0) s F(s) $
+ 卷积定理
  $ cal(L)(f_1(t)*f_2(t)) = F_1(s) F_2(s) $
== 拉普拉斯反变换
$ f(t) = cal(L)^(-1) (F(s)) = 1/ (2 pi j) integral_(sigma-j oo)^(sigma+j oo) F(s) e^(s t) d s $
=== 部分分式展开法
+ 有理分式表示
  $ F(s) = P(s)/Q(s) = (b_m s^m + b_(m-1) s^(m-1) + ... + b_0) / (a_n s^n + a_(n-1) s^(n-1) + ... + a_0) $
+ 零极点表示
  $ F(s) = P(s) / Q(s) = (b_m product_(i=1)^m (s-z_i)) / (a_n product_(j=1)^n (s-p_j)) $
  $z_i$为零点，$p_j$为极点
=== 有理函数真分式化
长除法
$ F(s) = P(s) / Q(s) = A(s) + B(s)/Q(s) $
$ A(s) = c_0 + c_1 s + c_2 s^2 + ... $
$ cal(L)^(-1) (A(s)) = c_0 delta(t) + c_1 delta^((1))(t) + c_2 delta^((2))(t) + ... $
=== 单极点（实数）情况
$ F(s) = B(s) / Q(s) = sum_(i=1)^n K_i / (s - p_i) $
$ f(t) = cal(L)^(-1) (sum_(i=1)^n K_i / (s - p_i)) = sum_(i=1)^n K_i e^(p_i t) $
+ $ K_i = (s-p_i)F(s)|_(s=p_i) $
+ $ K_i = B(s) / (Q^((1))(s))|_(s=p_i) $
=== 单极点（共轭负数）情况
+ $F(s)$包含$ K_1/(s-(alpha + j omega)) + K_2/(s-(alpha - j omega)) $
  $ K_1 = (s-(alpha + j omega)) F(s)|_(s=alpha + j omega) = abs(K) e^(j phi_K) $
  $ K_2 = K_1^* = (s-(alpha - j omega)) F(s)|_(s=alpha - j omega) = abs(K) e^(-j phi_K) $
  $
    f(t) = cal(L)^(-1) ((abs(K) e^(j phi_K))/(s-(alpha + j omega)) + (abs(K) e^(-j phi_K))/(s-(alpha - j omega))) =2 abs(K) e^(alpha t) cos(omega t + phi_K)
  $
+ $F(s)$包含$ (K s + b)/(s^2 + a^2) = K_1 s/(s^2 + a^2) + K_2 a/(s^2 + a^2) $
  $ f(t) = sqrt(K_1^2 + K_2^2) cos(omega t - arctan K_2 / K_1) $
=== 重极点情况
$ F(s) = K_11/(s-p_1) + K_12/(s-p_1)^2 + ... + K_(1 r)/(s-p_1)^r $
$ K_(1 r) = (s-p_1)^r F(s)|_(s=p_1) $
$ K_(1 (r - 1)) = d/(d s) [(s-p_1)^r F(s)]|_(s=p_1) $
$ K_(1 (r - 2)) = 1/2! d^2/(d s^2) [(s-p_1)^r F(s)]|_(s=p_1) $
$ dots.v $
$ K_11 = 1/(r-1)! d^(r-1)/(d s^(r-1)) [(s-p_1)^r F(s)]|_(s=p_1) $
$ f(t) = (K_11 + K_12 t + ... + 1/(r-1)! K_(1 r) t^(r-1))e^(p_1 t) $
=== 含$e^(-s)$的非有理式
$e^(-s)$不参加部分分式运算，求解时利用时域平移性质
== 电路基本定律及电路元件的复频域形式
=== 基尔霍夫定律的复频域形式
+ KCL
  $ sum_(k=1)^n I_k (s) = 0 $
+ KVL
  $ sum_(k=1)^n U_k (s) = 0 $
=== 电路元件电压-电流关系的复频域形式
+ 电阻元件
  $ U(s) = R I(s) $
  #align(center)[#image("assets/image-112.png")]
+ 电容元件

  *运算容纳：*$s C$
  $ I(s) = s C U(s) - C u(0_-) $
  #align(center)[#image("assets/image-113.png", width: 25%)]
  *运算容抗：*$1/(s C)$
  $ U(s) = 1/(s C) I(s) + u(0_-)/s $
  #align(center)[#image("assets/image-114.png", width: 25%)]
  #colbreak()
+ 电感元件

  *运算感抗：*$s L$
  $ U(s) = s L I(s) - L i(0_-) $
  #align(center)[#image("assets/image-115.png", width: 30%)]
  *运算感纳：*$1/(s L)$
  $ I(s) = 1/(s L) U(s) + i(0_-)/s $
  #align(center)[#image("assets/image-116.png", width: 25%)]
+ 耦合电感元件
  $ U(s) = s L I(s) - L i(0_-) $
  $ mat(U_1 (s); U_2 (s)) = s mat(L_1 M; M L_2) mat(I_1 (s); I_2 (s)) - mat(L_1 M; M L_2) mat(i_1 (0_-); i_2 (0_-)) $
  #align(center)[#image("assets/image-119.png", width: 35%)]
  $ I(s) = 1/(s L) U(s) + i(0_-)/s $
  $
    mat(I_1 (s); I_2 (s)) = 1/s mat(Gamma_11 Gamma_12; Gamma_21 Gamma_22) mat(U_1 (s); U_2 (s)) + 1/s mat(i_1 (0_-); i_2 (0_-))
  $
  #align(center)[#image("assets/image-118.png", width: 60%)]

+ 独立电源
  + 直流电源
    $ U_S -> U_S / s $
    $ I_S -> I_S / s $
  + 交流电源
    $ U_m sin(omega t + phi) -> U_m (s sin phi + omega cos phi) / (s^2 + omega^2) $
+ 受控源
  #align(center)[#image("assets/image-117.png")]
== 应用拉普拉斯变换分析动态电路
=== 电路的复频域形式及运算阻抗和运算导纳
+ 运算阻抗

  $ Z(s) = U(s) / I(s) $
  $ Z_R = R $
  $ Z_C = 1/(s C) $
  $ Z_L = s L $
+ 运算导纳

  $ Y(s) = I(s) / U(s) $
  $ Y_R = G $
  $ Y_C = s C $
  $ Y_L = 1/(s L) $
#pagebreak()
=== 用运算法分析线性非时变动态电路
+ 电阻电路分析方法
  + 戴维宁定理
    #image("assets/image-109.png")
    $U_(o c) (s)$是独立电源和原始状态等效电源共同作用下的开路电压

    $Z_(e q) (s)$是双零条件下的等值运算阻抗
+ 求解步骤
  + 运算电路
  + 求解象函数
  + 获得原函数
#note[][拉普拉斯变换求得的结果仅适用于$t >= 0_+$]
#pagebreak()
#align(left + horizon)[
  #text(size: 2em, weight: "bold")[第三篇　稳态电路]
]
#pagebreak()
= 正弦稳态电路分析
== 正弦量与正弦稳态
=== 正弦量
+ 三要素：振幅、角频率、初始相位
  $ y(t) = A_m cos(omega t + phi) $
+ 频率和周期
  $ f = 1 / T $
  $ omega = (2 pi)/T = 2 pi f $
+ 相位差

  同频率、同函数、同符号、主值范围内

  规定：$abs(phi) <= 180 degree$
  $ phi = phi_1 - phi_2 $
  $i_1$超前$i_2$：$0 degree < phi < 180 degree$

  $i_1$滞后$i_2$：$-180 degree < phi < 0 degree$

  同相：$phi = 0 degree$

  反相：$phi = 180 degree$

  正交：$phi = plus.minus 90 degree$
=== 正弦量的有效值和平均值
+ 有效值：与交流热效应相等的直流
  $ I = I_m / sqrt(2) = 0.707 I_m $
  $ U = U_m / sqrt(2) = 0.707 U_m $
+ 平均值：一个周期内绝对值的平均值
  $ I_a = 2 / pi I_m = 0.637 I_m $
  $ U_a = 2 / pi U_m = 0.637 U_m $
== 相量变换
=== 正弦量的相量表示
+ 代数表示
  $ A_m cos(omega t + phi) = "Re"(A_m e^(j phi) e^(j omega t)) = "Re"(dot(A)_m e^(j omega t)) $
  $dot(A) = A_m e^(j phi) = A_m angle phi$称相量
+ 几何表示
  #image("assets/image-120.png")
  有向线段长度$=U_m$

  有向线段与横轴夹角$=phi$

  有向线段以速度$omega$逆时针旋转

  实轴投影：$cos$

  虚轴投影：$sin$

+ 相量表示
  $ dot(U) = U e^(j phi) = U angle phi $
=== 复数及其运算
+ 复数
  $ A = a + j b = r cos phi + j r sin phi = r e^(j phi) = r angle phi $

+ 复数运算
  + 加减运算——代数形式
    $ A_1 plus.minus A_2 = (a_1 plus.minus a_2) + j (b_1 plus.minus b_2) $
  + 乘除运算——极坐标形式
    $ A_1 A_2 = abs(A_1) abs(A_2) angle (phi_1 plus phi_2) $
    $ A_1 / A_2 = abs(A_1) / abs(A_2) angle (phi_1 minus phi_2) $
  + 共轭复数
    $ A A^* = ("Re"A)^2 + ("Im"A)^2 = abs(A)^2 $
    $ A + A^* = 2 "Re"A $
    $ A - A^* = 2 j "Im"A $
  + 旋转因子

    $e^(j theta) = 1 angle theta$：逆时针旋转$theta$
  + 旋转$90 degree$因子：$plus.minus j$
=== 相量变换性质
+ 线性性质
  $ k_1 f_1(t) plus.minus k_2 f_2(t) <-> k_1 dot(F)_1(t) plus.minus k_2 dot(F)_2(t) $
+ 微分性质
  $ (d f) / (d t) <-> j omega dot(F) $
  $ d^n /(d t^n) f(t) <-> (j omega)^n dot(F) $
+ 积分性质
  $ integral f d t <-> 1 / (j omega) dot(F) $
  $ underbrace(integral dots integral, n) f(t) d t <-> 1 / (j omega)^n dot(F) $
== 电路定律和电路元件的相量形式
=== 基尔霍夫定律的相量形式
+ KCL
  $ sum_(k=1)^n dot(I)_k = 0 $
+ KVL
  $ sum_(k=1)^n dot(U)_k = 0 $
=== 电路元件电压-电流关系的向量形式
+ 电阻元件
  $ dot(U) = R dot(I) $
  #align(center)[#image("assets/image-121.png")]
+ 电容元件
  $ dot(U) = 1 / (j omega C) dot(I) = j X_C dot(I) $
  #align(center)[#image("assets/image-122.png")]
  *容抗：*$ X_C = - 1 / (omega C) $
  *容纳：*$ B_C = omega C $
+ 电感元件
  $ dot(U) = j omega L dot(I) = j X_L dot(I) $
  #align(center)[#image("assets/image-123.png")]
  *感抗：*$ X_L = omega L $
  *感纳：*$ B_L = - 1 / (omega L) $
+ 耦合电感元件
  $ mat(dot(U)_1; dot(U)_2) = j omega mat(L_1 M; M L_2) mat(dot(I)_1; dot(I)_2) $
  $ mat(dot(I)_1; dot(I)_2) = 1/(j omega) mat(Gamma_11 Gamma_12; Gamma_21 Gamma_22) mat(dot(U)_1; dot(U)_2) $
  #align(center)[#image("assets/image-124.png")]
  三绕组的线性耦合电感元件
  $
    mat(dot(U)_1; dot(U)_2; dot(U)_3) = j omega mat(L_11 M_12 M_13; M_21 L_22 M_23; M_31 M_32 L_33) mat(dot(I)_1; dot(I)_2; dot(I)_3)
  $
=== 电路的相量模型
+ 符号电路
+ 不同频率信号

  若电源含有不同频率的正弦量，利用叠加定理对每种频率成分分别建立相量模型。
== 阻抗和导纳
=== 阻抗和导纳
+ 阻抗
  $ Z(j omega) = dot(U) / dot(I) =abs(Z) angle phi_Z = R + j X $
  阻抗角：$phi_Z$ 电阻分量：$R$ 电抗分量：$X$
  $ Z_R = R $
  $ Z_C = 1 / (j omega C) = j X_C $
  $ Z_L = j omega L = j X_L $
  电容或电感只存在电抗分量
+ 导纳
  $ Y(j omega) = dot(I) / dot(U) =abs(Y) angle phi_Y = G + j B $
  导纳角：$phi_Y$ 电导分量：$G$ 电纳分量：$B$
  $ Y_R = G $
  $ Y_C = j omega C = j B_C $
  $ Y_L = 1 / (j omega L) = j B_L $
  电容或电感只存在电纳分量
+ 阻抗与导纳的关系
  $ Z = 1 / Y $
  $ R = G / (G^2 + B^2), X = - B / (G^2 + B^2) $
  $ Y = 1 / Z $
  $ G = R / (R^2 + X^2), B = - X / (R^2 + X^2) $
+ 阻抗的串联
  $ Z = Z_1 + Z_2 $
  分压公式：
  $ dot(U)_1 = Z_1 / (Z_1 + Z_2) dot(U), dot(U)_2 = Z_2 / (Z_1 + Z_2) dot(U) $
+ 导纳的并联
  $ Y = Y_1 + Y_2 $
  分流公式：
  $ dot(I)_1 = Y_1 / (Y_1 + Y_2) dot(I), dot(I)_2 = Y_2 / (Y_1 + Y_2) dot(I) $
=== RLC串联电路
+ 相量法
  $ Z = R + j (X_L + X_C) = sqrt(R^2 + (X_L + X_C)^2) angle arctan (X_L + X_C)/R $
  $ U = abs(Z) I $
  $ phi_u = phi_Z + phi_i $
  感性：$X_L > abs(X_C) -> phi_Z > 0 -> phi_u > phi_i$

  阻性：$X_L = abs(X_C) -> phi_Z = 0 -> phi_u = phi_i$

  容性：$X_L < abs(X_C) -> phi_Z < 0 -> phi_u < phi_i$
  #align(center)[#image("assets/image-125.png")]
+ 相量图
  #grid(
    columns: (50%, 50%),
    rows: (auto, auto),
    align: center,
    image("assets/image-126.png"), image("assets/image-127.png", width: 65%),
    [电压三角形], [阻抗三角形],
  )
=== GCL并联电路
+ 相量法
  $ Y = G + j (B_C + B_L) = sqrt(G^2 + (B_C + B_L)^2) angle arctan (B_C + B_L)/G $
  $ I = abs(Y) U $
  $ phi_i = phi_Y + phi_u $
  感性：$abs(B_L) > B_C -> phi_Y < 0 -> phi_i < phi_u$

  阻性：$abs(B_L) = B_C -> phi_Y = 0 -> phi_i = phi_u$

  容性：$abs(B_L) < B_C -> phi_Y > 0 -> phi_i > phi_u$
  #align(center)[#image("assets/image-128.png")]
+ 相量图
  #grid(
    columns: (50%, 50%),
    rows: (auto, auto),
    align: center,
    image("assets/image-129.png"), image("assets/image-130.png", width: 68%),
    [电流三角形], [导纳三角形],
  )
== 正弦稳态电路的分析
#note[多频][出现多个频率的正弦信号时，在时域电路中应用叠加定理。]
#note[][正弦函数与余弦函数都可以进行相量变换，反变换为对应三角函数即可。]
#note[][配合使用相量图与相量法。]
#note[参考相量的选取][

  - 串联电路中，选取电流相量作为参考相量。
  - 并联电路中，选取电压相量作为参考相量。
]
== 正弦稳态电路的功率
=== 正弦稳态一端口的功率
+ 瞬时功率
  $ p = U I cos(phi_u - phi_i) + U I cos(2 omega t + phi_u + phi_i) $
  #align(center)[#image("assets/image-131.png")]
+ 有功功率（平均功率）

  电路瞬时功率在一个周期内的平均值，指的是电路实际消耗的功率。
  $ P = U I cos phi = U_R I = I^2 R = U_R^2 / R $
  单位：瓦(W)，千瓦(W)

  $cos phi$称功率因数，$phi$称功率因数角，也是阻抗角。
+ 无功功率

  用以衡量电感、电容电路中能量交换的规模，用瞬时功率可逆部分的最大值表征。
  $ p = U I cos phi (1 + cos 2 omega t) - U I sin phi sin 2 omega t $
  $ Q = U I sin phi = U_X I = I^2 X = U_X^2 / X $
  单位：乏(var)，千乏(kvar)

  $sin phi$称无功因数

+ 表观功率
  $ S = U I = I^2 abs(Z) = U^2 / abs(Z) = sqrt(P^2 + Q^2) $
  单位：伏安(V·A)，千伏安(kV·A)
  #align(center)[#image("assets/image-132.png")]
  $
    P_R & = U I quad & Q_R & = 0 \
    P_L & = 0 quad   & Q_L & = U I \
    P_C & = 0 quad   & Q_C & = -U I
  $
+ 功率表：测量平均功率
  #image("assets/image-172.png")
  电压、电流参考方向与同名端连接一致，读数$P = U I cos phi$

  电压、电流参考方向与同名端连接不一致，读数$P = - U I cos phi$
=== 复功率
+ 复功率
  $ tilde(S) = P + j Q = U I angle phi = dot(U) dot(I)^* $
+ 复功率守恒性：在正弦稳态下，任意电路的复功率具有守恒性
  $ sum_(k=1)^b tilde(S)_k = 0 $
=== 最大功率传输定理
+ 直流电路

  最大功率条件：$R_L = R_o$

  最大功率：$p = u_(o c)^2 / (4 R_L)$

  效率：$eta = 50%$
+ 正弦稳态电路——负载电阻和电抗均可独立变化

  共轭匹配：$R_L = R_o "和" X_L = -X_o "或者" Z_L = Z_o^*$

  最大有功功率：$p = u_(o c)^2 / (4 R_L)$

  效率：$eta = 50%$
  #note[][最大*有功*功率传输定理]
+ 正弦稳态电路—— 负载阻抗角固定而模可改变

  模匹配：$abs(Z_L) = sqrt(R_o^2 + X_o^2)$

  最大有功功率：$p = (u_(o c)^2 cos phi_L )/ (2 abs(Z_L) + 2 (R_o cos phi_L + X_o sin phi_L))$
  #note[][模匹配最大功率$<$共轭匹配最大功率]
=== 功率因数的提高
+ 功率因数$cos phi$

  $phi$是电压与电流的相位差、阻抗角、功率因数角

  $cos phi$是对电源利用程度的衡量
+ 功率因数$cos phi$低的危害
  + 发电机设备的容量不能充分利用
  + 增加输电线路的功率损耗
+ 功率因数$cos phi$低的原因
  + 日常生活中多为感性负载
  + 杂散电感
+ 功率因数$cos phi$的提高
  + 原则：保证原负载的工作状态不变
  + 措施：在感性负载两端并电容
    #stack(dir: ltr, spacing: 1em, image("assets/image-133.png"), image("assets/image-135.png"))
+ 并联电容值的计算
  $ C = P / (omega U^2) (tan phi_1 - tan phi) $
== 正弦稳态网络函数和频率特性
=== 正弦稳态网络函数
+ 网络函数
  $ H(j omega) = (dot(Y)(j omega)) / (dot(W)(j omega)) $
  $dot(W)(j omega)$为激励，$dot(Y)(j omega)$为响应
  #stack(dir: ltr, h(1.7cm), image("assets/image-139.png"), h(3cm), image("assets/image-141.png"))
  #align(center)[#image("assets/image-140.png")]
=== 频率特性
+ 频率响应
  $ H(j omega) = abs(H(j omega)) angle phi(omega) $
  - 幅频特性：$abs(H(j omega))$与频率$omega$之间的关系特性
  - 相频特性：$phi(omega)$与频率$omega$之间的关系特性
  - 频率特性：网络函数在所有$omega$下的幅频特性和相频特性
+ 纯电阻电路
  $ H(j omega) = H $
+ 一阶低通滤波电路（RC低通滤波电路）
  #align(center)[#image("assets/image-134.png")]
  固有频率：$omega_0 = 1/ (R C)$
  $ H(j omega) = 1/sqrt(1 + (omega / omega_0)^2) angle - tan^(-1) omega/omega_0 $
  #align(center)[#stack(dir: ltr, spacing: 1em, image("assets/image-136.png"), image("assets/image-137.png"))]
  + 幅频特性：低通
  + 相频特性：滞后网络
  + 频率特性
    - $omega = 0, H(0) = 1, P_2 = P_(2 max)$
    - $omega = omega_0, H(omega_0) = 1/sqrt(2), P_2 = 1/2 P_(2 max)$
    - $omega = oo, H(oo) = 0, P_2 = 0$
    $omega_0$称为半功率频率，处于半功率点时$phi_(omega_0) = - 45 degree$
    - $0 < omega < omega_0, 1/2 P_(2 max) < P_2 < P_(2 max)$，信号能通过电路
    - $omega > omega_0, P_2 < 1/2 P_(2 max)$，信号不能通过电路
    $omega_0$称为截止频率，$0 < omega < omega_0$称为滤波器通频带
+ 一阶高通滤波电路（RC高通滤波电路）
  #align(center)[#image("assets/image-138.png")]
  固有频率：$omega_0 = 1/ (R C)$
  $ H(j omega) = (omega/omega_0) / (sqrt(1 + (omega/omega_0)^2)) angle pi / 2 - tan^(-1) omega / omega_0 $
  #align(center)[#stack(dir: ltr, spacing: 1em, image("assets/image-142.png"), image(
    "assets/image-143.png",
    width: 38%,
  ))]
  + 幅频特性：高通
  + 相频特性：超前网络
  + 频率特性
    - $omega = 0, H(0) = 0, P_2 = 0$
    - $omega = omega_0, H(omega_0) = 1/sqrt(2), P_2 = 1/2 P_(2 max)$
    - $omega = oo, H(oo) = 1, P_2 = P_(2 max)$
    $omega_0$称为半功率频率，处于半功率点时$phi_(omega_0) = 45 degree$
    - $0 < omega < omega_0, P_2 < 1/2 P_(2 max)$，信号不能通过电路
    - $omega > omega_0, 1/2 P_(2 max) < P_2 < P_(2 max)$，信号能通过电路
    $omega_0$称为截止频率，$omega > omega_0$称为滤波器通频带
+ 选频电路
  + RC带通滤波器
    #stack(dir: ltr, spacing: 1em, image("assets/image-144.png", width: 40%), image("assets/image-145.png"))
  + RC带阻滤波器
    #stack(dir: ltr, spacing: 1em, image("assets/image-146.png", width: 40%), image("assets/image-147.png"))
  + RC双T电路
    #stack(dir: ltr, spacing: 1em, image("assets/image-148.png", width: 40%), image("assets/image-149.png"))
+ RLC串联电路

  谐振频率：$ omega_0 = 1/ sqrt(L C) $

  品质因数：$ Q = (omega_0 L) / R = 1/(R omega_0 C)=1 / R sqrt(L / C) $
  + 以电容电压为响应时
    #image("assets/image-150.png")
    - $omega / omega_0 = 0, abs(H_C (j omega)) = 1, phi_C (omega) = 0 degree$
    - $omega / omega_0 = 1, abs(H_C (j omega)) = Q, phi_C (omega) = -90 degree$
    - $omega / omega_0 = oo, abs(H_C (j omega)) = 0, phi_C (omega) = -180 degree$
    低通滤波电路，截止频率$omega_C$满足$abs(H_C (j omega_C)) = 1 / sqrt(2)$
  + 以电感电压为响应时
    #image("assets/image-151.png")
    - $omega / omega_0 = 0, abs(H_L (j omega)) = 0, phi_L (omega) = 180 degree$
    - $omega / omega_0 = 1, abs(H_L (j omega)) = Q, phi_L (omega) = 90 degree$
    - $omega / omega_0 = oo, abs(H_L (j omega)) = 1, phi_L (omega) = 0 degree$
    高通滤波电路，截止频率$omega_L$满足$abs(H_L (j omega_L)) = 1 / sqrt(2)$
  + 以电阻电压为响应时
    #image("assets/image-152.png")
    - $omega / omega_0 = 0, abs(H_R (j omega)) = 0, phi_R (omega) = 90 degree$
    - $omega / omega_0 = 1, abs(H_R (j omega)) = 1, phi_R (omega) = 0 degree$
    - $omega / omega_0 = oo, abs(H_R (j omega)) = 0, phi_R (omega) = -90 degree$
    带通滤波电路，截止频率$omega_R$满足$abs(H_R (j omega_R)) = 1 / sqrt(2)$，通带宽度$Delta omega = omega_0 / Q$
  + 以电感电压和电容电压之和为响应时
    #image("assets/image-153.png")
    - $omega / omega_0 = 0, abs(H_(L C) (j omega)) = 1, phi_(L C) (omega) = 0 degree$
    - $omega / omega_0 = 1, abs(H_(L C) (j omega)) = 0$
    - $omega / omega_0 = oo, abs(H_(L C) (j omega)) = 1, phi_(L C) (omega) = 0 degree$
    带阻滤波电路，截止频率$omega_(L C)$满足$abs(H_(L C) (j omega_(L C))) = 1 / sqrt(2)$，阻带宽度$Delta omega = omega_0 / Q$
=== s域网络函数与正弦稳态响应的关系
$ s = j omega $
== RLC电路的谐振
谐振条件：端口电压和端口电流同向
=== RLC电路的串联谐振
+ 谐振条件
  - 电压与电流同相位
  - 阻抗角$phi_Z = 0$
  - 电抗$X = 0$
  - 电抗电压$dot(U)_X = 0$
  - 无功功率$Q = 0$
+ 谐振频率
  $ omega_0 = 1/ sqrt(L C) $
+ 串联谐振的特点
  + 电压谐振

    电源只供应电阻的电压，电感、电容上的电压互相抵消

  + 品质因数
    $ Q = (omega_0 L) / R = 1/(R omega_0 C)=1 / R sqrt(L / C) $
    $ U_L = U_C = Q U $
    品质因数$Q$为电感、电容上的电压放大倍数，表征谐振质量
  + 阻抗最小，呈阻性
    $ Z = R $
  + 电流最大
    $ I_0 = U / R $
+ 功率与能量
  + 功率
    - $P = U I$，电源向电阻提供能量
    - $Q = 0$，$Q_L$和$Q_C$大小相等，互相补偿
  + 能量
    $ w_L = 1/2 L I^2 (1 + cos 2 omega_0 t) $
    $ w_C = 1/2 L I^2 (1 - cos 2 omega_0 t) $
    $ W = w_L + w_c = L I^2 = C U_C^2 = C Q^2 U^2 $
  + 品质因数
    $ Q = 2 pi (L I^2)/(R I^2 T) = 2 pi "电路储存的电磁能量"/"电路一个周期内消耗的能量" $
+ 频率特性与谐振曲线
  + 频率特性
    - $omega < omega_0, abs(X_C) > X_L, Z$容性
    - $omega = omega_0, abs(X_C) = X_L, Z$阻性
    - $omega > omega_0, abs(X_C) < X_L, Z$感性
    #image("assets/image-154.png")
  + 电流谐振曲线
    #image("assets/image-155.png")
    $Q$越大，选择性越好

    $omega_0$称中心频率，$omega_1$为下限截止频率，$omega_2$为上限截止频率，通频带$"BW" = omega_2 - omega_1$
    $ "BW" = omega_0 / Q = R / L $
  + 电压谐振曲线
    #image("assets/image-156.png")
    $Q$越大，$U_C$，$U_L$出现最大值的频率越靠近$omega_0$

=== GCL电路的并联谐振
+ 谐振条件
  - 电流与电压同相位
  - 导纳角$phi_Y = 0$
  - 电纳$B = 0$
  - 电纳电流$dot(I)_B = 0$
  - 无功功率$Q = 0$
+ 谐振频率
  $ omega_0 = 1 / sqrt(L C) $
+ 并联谐振的特点
  + 电流谐振

    电源只供应电阻的电流，电感、电容回路中形成环流

    $ Q = (omega_0 C) / G = 1 / (G omega_0 L) = 1 / G sqrt(C / L) $
    $ I_L = I_C = Q I $
  + 阻抗最大，呈阻性

    $Z = R$
+ 功率与能量
  $ Q = 2 pi "电路储存的电磁能量"/"电路一个周期内消耗的能量" $
+ 频率响应
  $ "BW" = omega_0 / Q = G / C = 1 / (R C) $
=== 谐振滤波器
+ 谐振滤波器
  - LC串联谐振相当于短路
  - LC并联谐振相当于开路
+ 滤波信号
  #image("assets/image-157.png")
+ 选择信号
  #image("assets/image-158.png")
#note[][
  有些电路既能串联谐振，又能并联谐振
  #image("assets/image-159.png")
  #image("assets/image-160.png")
]
#note[][

  对纯电感、电容电路，
  - $Z = 0$，串联谐振；$Z = infinity$，并联谐振
  - $Y = 0$，并联谐振；$Y = infinity$，串联谐振
]
= 三相电路
== 三相电路的基本概念
=== 对称三相电源和对称三相负载
+ 三相电源
  + 三相电压
    $
      cases(u_U = sqrt(2) U cos (omega t + phi), u_V = sqrt(2) U cos (omega t + phi - 120 degree), u_W = sqrt(2) U cos (omega t + phi + 120 degree))
    $
    $ cases(dot(U)_U = U angle phi, dot(U)_V = U angle (phi - 120 degree), dot(U)_W = U angle (phi + 120 degree)) $
    $ u_U + u_V + u_W = 0 $
    $ dot(U)_U + dot(U)_V + dot(U)_W = 0 $
    对称三相电源：三相振幅和频率相同，相位依次相差$120 degree$
  + 相序：各相电压经过极大值的先后次序
    - 正序：U-V-W
    - 负序：U-W-V
    #image("assets/image-161.png")
  + 旋转因子
    $ a = 1 angle 120 degree $
+ 三相负载
  - 单相负载：只需一相电源供电
  - 三相负载：需三相电源同时供电
    - 对称三相负载：$Z_U = Z_V = Z_W = Z$
    - 不对称三相负载
+ 三相电路

  对称三相电路=对称三相电源+对称三相负载
=== 三相电路的连接方式
+ 星形联结
  + 线电流与相电流
    #align(center)[#image("assets/image-162.png")]
    $ dot(I)_L = dot(I)_P $
  + 线电压与相电压
    #align(center)[#image("assets/image-163.png")]
    $ dot(U)_L = sqrt(3) dot(U)_P angle 30 degree $
    #align(center)[#image("assets/image-166.png")]
+ 三角形联结
  + 线电压与相电压
    #align(center)[#image("assets/image-164.png")]
    $ dot(U)_L = dot(U)_P $
  + 线电流与相电流
    #align(center)[#image("assets/image-165.png")]
    *对称负载下*
    $ dot(I)_L = sqrt(3) dot(I)_P angle -30 degree $
    #align(center)[#image("assets/image-167.png")]
== 三相电路的计算
=== 对称三相电路
+ 计算步骤
  + Y-Y联结：一相计算法
  + 电路中出现$Delta$形电源或负载：等效变换成Y-Y联结
+ Y-Y联结

  对称三相电路中，
  $ dot(U)_(N^' N) = 0 $
  #align(center)[#image("assets/image-168.png")]
  #note[][适用于三相四线制（中性线有阻抗），三相三线制（中性线无阻抗），三相三线制]
  #note[][对称三相负载连接成星形时，中性线无电流]
+ 电源$Delta$联结
  #align(center)[#image("assets/image-169.png")]
  $ dot(U)_Y = 1/ sqrt(3) angle - 30 degree dot(U)_Delta $
+ 负载$Delta$联结
  #align(center)[#image("assets/image-170.png", width: 70%)]
  $ dot(Z)_Y = 1/3 dot(Z)_Delta $
=== 复杂的对称三相电路
+ 基本步骤
  + 等效变换为星形联结的电源或负载
  + 将中性点短接，采用一相计算法
  + 根据对称性直接写出其余两相
#note[电源、负载分别单独变换][
  #image("assets/image-171.png")]
=== 不对称三相电路
+ 电源是三相对称的，负载是三相不对称的
+ 解题思路：求取$dot(U)_(N^' N)$，每相独立计算法

  负载各相电压：
  $
    cases(dot(U)_(U N^') = dot(U)_U - dot(U)_(N^' N), dot(U)_(V N^') = dot(U)_V - dot(U)_(N^' N), dot(U)_(W N^') = dot(U)_W - dot(U)_(N^' N))
  $
  中性点位移
  #align(center)[#image("assets/image-173.png")]
+ 不接中线
  $ dot(U)_(N^' N) = (dot(U)_U/Z_U + dot(U)_V/Z_V + dot(U)_W/Z_W)/(1/Z_U + 1/Z_V + 1/Z_W) $
+ 接上中线
  + 中线无阻抗
    $ dot(U)_(N^' N) = 0 $
  + 中线有阻抗
    $ dot(U)_(N^' N) = (dot(U)_U/Z_U + dot(U)_V/Z_V + dot(U)_W/Z_W)/(1/Z_U + 1/Z_V + 1/Z_W + 1/Z_N) $
#note[][对称三相负载与不对称三相负载相互独立]
=== 相序测定器
#image("assets/image-174.png")
电容连接U相时，灯泡较亮的为V相，灯泡较暗的为W相
== 三相电路的功率
=== 三相电路功率的基本概念
+ 三相电路的瞬时功率
  $ p = p_U + p_V + p_W $
  *对称三相电路*
  $ p = 3 U_P I_P cos phi $
+ 三相电路的平均功率
  $ P = P_U + P_V + P_W $
  *对称三相电路*
  $ P = 3 U_P I_P cos phi_P = sqrt(3) U_L I_L cos phi_P $
  #note[][$phi_P$必须为相电压与相电流的相位差]
+ 三相电路的无功功率
  $ Q = Q_U + Q_V + Q_W $
  *对称三相电路*
  $ Q = 3 U_P I_P sin phi_P = sqrt(3) U_L I_L sin phi_P $
+ 三相电路的表观功率
  $ S = sqrt(P^2 + Q^2) = sqrt((P_U + P_V + P_W)^2 + (Q_U + Q_V + Q_W)^2) $
  *对称三相电路*
  $ S = 3 U_P I_P = sqrt(3) U_L I_L $
+ 三相电路的功率因数
  $ cos phi^' = P / S $
  *对称三相电路*
  $ cos phi^' = cos phi_P $
=== 三相电路功率的测量
#note[解题思路][使用相量图求出$psi$与$phi$的关系]
+ 一功率表法：三相四线制，对称负载
  #image("assets/image-175.png")
  功率表读数：$P_W = U_P I_P cos psi = U_P I_P cos phi$

  $P = 3 P_W$
+ 二功率表法：三相三线制，任意负载
  #image("assets/image-176.png")
  功率表1读数：$P_1 = U_(U W) I_U cos psi_1$

  功率表2读数：$P_2 = U_(V W) I_V cos psi_2$

  $P =P_1 + P_2$

  *对称负载下*

  $Q = sqrt(3)(P_1 - P_2)$

  $phi_Z = arctan Q/P = arctan sqrt(3) (P_1-P_2)/(P_1+P_2)$

  逆序时，$Q = sqrt(3)(P_2 - P_1)$
+ 三功率表法：三相四线制，任意负载
  #image("assets/image-177.png")
  $P = P_1 + P_2 + P_3$
= 非正弦周期稳态电路分析
== 非正弦周期波形的傅里叶级数展开
$ f(t) = A_0 + sum_(k=1)^oo (A_(m k) cos k omega t + B_(m k) sin k omega t) $
== 非正弦周期波形的有效值、功率
$U = sqrt(U_0^2 + U_1^2 + U_2^2 + dots + U_k^2 + dots)$

$I = sqrt(I_0^2 + I_1^2 + I_2^2 + dots + I_k^2 + dots)$

$P = U_0 I_0 + U_1 I_1 cos phi_1 + U_2 I_2 cos phi_2 + dots$

$Q = U_1 I_1 sin phi_1 + U_2 I_2 sin phi_2 + dots$

$S = U I$

$cos phi = P / S$

$T = sqrt(S^2 - (P^2 + Q^2))$ （畸变功率）
