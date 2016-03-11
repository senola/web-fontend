title: css 规范指南
date: 2016-03-02 15:14:57
tag:
- css
categories:
- 规范
- 指南
---


## 一、前言

CSS不是一门优美的语言，尽管她容易上手，但在任何合理的规模下都会产生问题。很遗憾，我们并不能改变CSS的工作方式，但是可以改进编写和构建 CSS 的方法。

当进行大规模、长周期项目时，避免不了会和其他开发者协同工作，那么我们就需要以统一的方式来协作以便完成以下目标：

- 保持样式表的可维护性
- 保持代码的透明、稳健以及可读
- 保持样式表可扩展

### 1、规范样式风格的重要性

一个开发团队需要一份同意的CSS样式规范指南,因为：

- 项目开发、维护周期长
- 许多开发者参与
- 开发者有不同的编码方式、编码风格
- 新员工加入

一份良好的CSS样式规范可以做到：

- 设定代码质量的标准
- 保持代码的一致性
- 在整个代码库中给开发者以熟悉感，提到可维护性
- 提高代码开发效率

## 二、注释

注释的重要性就不需要多说了~ 是个开发人员基本都知道没注释的痛苦。但是由于`CSS`是一种不会留下太多痕迹的声明式语言，所以一般人好少写注释，但是，作为一个专业的前端....

所以，CSS 需要更多的注释。因为你可能不知道：

- 是否一段CSS代码与其他代码有关联
- 改变某段代码是否块影响其他模块
- 是否有其他的CSS使用到
- 样式继承
- 样式忽略

注释的规则是：你应该在任何有含义不明显的代码处写注释。意思是说，没必要告诉别人 `color: red;` 是用来变红的，但如果你用 `overflow: hidden; `来清除浮动（和闭合浮动相对），这时候添加注释是有必要的。

### 1、High-level

我们用一块80字符宽的多行注释来为整个小节或组件写注释。比如`CSS Wizardry`的页头样式注释：

``` css
	/**
	 * The site’s main page-head can have two different states:
	 *
	 * 1) Regular page-head with no backgrounds or extra treatments; it just
	 *    contains the logo and nav.
	 * 2) A masthead that has a fluid-height (becoming fixed after a certain point)
	 *    which has a large background image, and some supporting text.
	 *
	 * The regular page-head is incredibly simple, but the masthead version has some
	 * slightly intermingled dependency with the wrapper that lives inside it.
	 */
```

很多时候我们想对一条规则中的多条声明进行注释。我们用一种颠倒的脚注。下面是一段更复杂的关于生面说到的网站头的注释。如`normalize.css`的注释：

``` css
	/**
	 * 1. Set default font family to sans-serif.
	 * 2. Prevent iOS and IE text size adjust after device orientation change,
	 *    without disabling user zoom.
	 */

	html {
	  font-family: sans-serif; /* 1 */
	  -ms-text-size-adjust: 100%; /* 2 */
	  -webkit-text-size-adjust: 100%; /* 2 */
	}


```

这类注释允许我们将所有的文档写到一起，并且指向各自标注的地方。

需要注意的是生产环境中应该没有注释，所以发布前需要将所有的CSS进行压缩处理。

## 四、命名规则(Naming Conventions)

CSS中的命名规则非常有用，让你的代码更加严谨，更加显而易见，更加信息化。好的命名规则能告诉你和你的团队：

- 某个类做了什么类型的事
- 某个类能用在什么地方
- 什么样的类会有关联

1、连字符分割（Hyphen Delimited）

类名中所有的字符串都是用连字符（-）连接的，如：

```css
	.page-head {}

	.sub-content {}

```
驼峰命名方法一般不建议使用在类名中。

2、BEM 命名介绍

先科普一下,`BEM`的意思是块（block）、元素（element）、修饰符（modifier）.是由[Yandex](https://www.yandex.ru/)团队提出的一种前端命名方法论。这种巧妙的命名方法让你的CSS类对其他开发者来说更加透明而且更有意义。BEM命名约定更加严格，而且包含更多的信息，它们用于一个团队开发一个耗时的大项目。

命名约定的模式如下：

```css
	.block{}
	.block__element{}
	.block--modifier{}
```

- .block 代表了更高级别的抽象或组件
- .block__element 代表.block的后代，用于形成一个完整的.block的整体。
- .block--modifier 代表.block的不同状态或不同版本。

之所以使用两个连字符和下划线而不是一个，是为了让你自己的块可以用单个连字符来界定，如：

```css
	.site-search{} /* 块 */
	.site-search__field{} /* 元素 */
	.site-search--full{} /* 修饰符 */
```

BEM的关键是光凭名字就可以告诉其他开发者某个标记是用来干什么的。通过浏览HTML代码中的class属性，你就能够明白模块之间是如何关联的：有一些仅仅是组件，有一些则是这些组件的子孙或者是元素,还有一些是组件的其他形态或者是修饰符。我们用一个类比/模型来思考一下下面的这些元素是怎么关联的：

```css
	.person{}
	.person__hand{}
	.person--female{}
	.person--female__hand{}
	.person__hand--left{}
```

顶级块是‘person’，它拥有一些元素，如‘hand’。一个人也会有其他形态，比如女性，这种形态进而也会拥有它自己的元素。又如：

```html
	<form class="site-search  site-search--full">
	  <input type="text" class="site-search__field">
	  <input type="Submit" value ="Search" class="site-search__button">
	</form>
```

我们能清晰地看到有个叫`.site-search`的块，他内部是一个叫`.site-search__field`的元素。并且`.site-search`还有另外一种形态叫`.site-search--full`。

尽管BEM写法看上去多少有点奇怪，但是无论什么项目，它对前端开发者都是一个巨有价值的工具。

### 3、javascript hooks

作为一种规则，在HTML上同时把CSS、JS绑定到同一个class上面。如果你那样做了，那么就意味着你不能随意的修改class或者移除class，这会加网站重构的困难。因为你可能在不知道的情况下将JS功能丢失。所以将JS绑定在一个特殊的class上面将会使得HTML代码结构更加的干净、透明及可维护。

通常，这样需要用来绑定JS的class会加上前缀，如`js-`,比如：


```html
	<input type="submit" class="btn js-btn" value="提交" />
```

但是这句意味着存在一些class是没用行为样式的，如`js-btn`,它不需要任何样式，目的仅仅是JS的绑定。但是这不是一种良好的实践。另一种好的且推荐的做法是使用`data-*`属性。

虽然最初设计者是把`data-*`设计为存储自定义数据的，但是后来被码农们当作`JS hooks`使用。

### 4、项目命名

全部采用小写方式， 以下划线分隔。如：

```css
	my_project_name
```

### 5、目录命名

参照项目命名规则，有复数结构时，要采用复数命名法。如：

```css
	scripts, styles, images, data_models
```

### 6、JS、css、scss、html文件命名

参照项目命名规则。如 account_model.js、retina_sprites.scss、error_report.html

## 三、HTML规范

### 1、语法

- 缩进使用soft tab（4个空格）
- 嵌套的节点必须缩进
- 属性使用双引号，不使用单引号
- 属性名全小写，用中划线做分隔符
- 不要在自动闭合标签结尾处使用斜线（HTML5 规范 指出他们是可选的）
- 不能忽略可选的关闭标签，例：</li> 和 </body>。

```HTML
	<!DOCTYPE html>
	<html>
	    <head>
	        <title>首页</title>
	    </head>
	    <body>
	        <img src="images/logo.png" alt="随手记">

	        <h1 class="hello-world">Hello, world!</h1>
	    </body>
	</html>
```
### 2、doctype

在页面开头使用这个简单地doctype来启用标准模式，使其在每个浏览器中尽可能一致的展现；虽然doctype不区分大小写，但是按照惯例，DOCTYPE大写。[关于DOCTYPE大写还是小写的讨论](http://stackoverflow.com/questions/15594877/is-there-any-benefits-to-use-uppercase-or-lowercase-letters-with-html5-tagname)

```HTML
	<!DOCTYPE html>
	<html>
		...
	</html>
```

### 3、lang

根据HTML5规范：

{% blockquote %}
 应在html标签上加上lang属性。这会给语音工具和翻译工具帮助，告诉它们应当怎么去发音和翻译。
{% endblockquote %}

lang支持zh-cn、zh-hk、zh-tw,更多戳[这里](https://msdn.microsoft.com/en-us/library/ms533052(v=vs.85).aspx)

```html
	<!DOCTYPE html>
	<html lang="zh-cn">
	    ...
	</html>
```

### 4、charset

通过声明一个明确的字符编码，让浏览器轻松、快速的确定适合网页内容的渲染方式，通常指定为'UTF-8'。

```html
	<!DOCTYPE html>
	<html>
	    <head>
	        <meta charset="UTF-8">
	    </head>
	    ...
	</html>
```

### 5、IE兼容模式

使用`<meta>`标签指定页面应该用什么版本的IE来渲染，想了解更多戳[这里](http://stackoverflow.com/questions/6771258/whats-the-difference-if-meta-http-equiv-x-ua-compatible-content-ie-edge-e).

不同的`doctype`在不同浏览器下会触发不同的渲染模式，戳[这里](https://hsivonen.fi/doctype/)

```html
	<!DOCTYPE html>
	<html>
	    <head>
	        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
	    </head>
	    ...
	</html>
```

### 6、CSS、JS引入

根据`HTML5`规范，通常在引入`CSS`和`JS`时候不需要指明`type`,因为`text/css`和`text/javascript`分别是他们的默认值。

```html
	<!-- External CSS -->
	<link rel="stylesheet" href="code_guide.css">

	<!-- In-document CSS -->
	<style>
	    ...
	</style>

	<!-- External JS -->
	<script src="code_guide.js"></script>

	<!-- In-document JS -->
	<script>
	    ...
	</script>
```

### 7、标签的属性顺序

属性应该按照特定的顺序出现以保证易读性,规范顺序如下：

- class
- id
- name
- data-*
- src, for, type, href, value , max-length, max, min, pattern
- placeholder, title, alt
- aria-*, role
- required, readonly, disabled

class是高可服用组件设计的，所以应该处在第一位。`id`更加具体且应该尽量少用，所以放在第二位。

```html
	<a class="..." id="..." data-modal="toggle" href="#">Example link</a>

	<input class="form-control" type="text">

	<img src="..." alt="...">
```

### 8、boolean属性

boolean属性指不需要声明取值的属性，XHTML需要每个属性声明取值，但是HTML5并不需要；

```html
	<input type="text" disabled>

	<input type="checkbox" value="1" checked>

	<select>
	    <option value="1" selected>1</option>
	</select>
```

### 9、减少标签数量

在编写HTML代码时，需要尽量避免多余的父节点。很多时候，需要通过迭代和重构来使HTML变得更少。

```html
	<!-- Not well -->
	<span class="avatar">
	    <img src="...">
	</span>

	<!-- Better -->
	<img class="avatar" src="...">
```

## 四、CSS, SCSS规范

### 1、缩进

使用soft tab（4个空格）。

```css
	.element {
	    position: absolute;
	    top: 10px;
	    left: 10px;

	    border-radius: 10px;
	    width: 50px;
	    height: 50px;
	}
```

### 2、分号

每个属性声明末尾都要加分号。

### 3、空格

以下几种情况不需要空格：

- 属性名后
- 多个规则的分隔符','前
- !important '!'后
- 属性值中'('后和')'前
- 行末不要有多余的空格

以下几种情况需要空格：

- 属性值前
- 选择器'>', '+', '~'前后
- '{'前
- !important '!'前
- @else 前后
- 属性值中的','后
- 注释'/*'后和'*/'前

``` css
    /* not good */
    .element {
        color :red! important;
        background-color: rgba(0,0,0,.5);
    }

    /* good */
    .element {
        color: red !important;
        background-color: rgba(0, 0, 0, .5);
    }

    /* not good */
    .element,
    .dialog{
        color: red !important;
        background-color: rgba(0, 0, 0, .5);
    }

    /* good */
    .element,
    .dialog {
        color: red !important;
        background-color: rgba(0, 0, 0, .5);
    }

    /* not good */
    .element>.dialog{
        color: red !important;
        background-color: rgba(0, 0, 0, .5);
    }

    /* good */
    .element > .dialog{
        color: red !important;
        background-color: rgba(0, 0, 0, .5);
    }

    /* not good */
    .element{
        color: red !important;
        background-color: rgba(0, 0, 0, .5);
    }

    /* good */
    .element {
        color: red !important;
        background-color: rgba(0, 0, 0, .5);
    }
```

### 4、空行

以下几种情况需要空行：

- 文件最后保留一个空行
- '}'后最好跟一个空行，包括scss中嵌套的规则
- 属性之间需要适当的空行

### 5、换行

以下几种情况不需要换行：

- '{'前

以下几种情况需要换行：

- {'后和'}'前
- 每个属性独占一行
- 多个规则的分隔符','后

```css
	/* not good */
	.element
	{color: red; background-color: black;}

	/* good */
	.element {
	    color: red;
	    background-color: black;
	}

	/* not good */
	.element, .dialog {
	    color: red;
	    background-color: black;
	}

	/* good */
	.element,
	.dialog {
	    color: red;
	    background-color: black;
	}
```
### 6、引号

最外层统一用双引号，url的内容要用引号，属性选择器中的属性需要引号。

```CSS
    .element:after {
        content: "";
        background-image: url("logo.png");
    }

    li[data-type="single"] {
        background-image: url("logo.png");
    }
```

### 7、属性声明顺序

相关的属性声明按如下的顺序做分组处理，组之间需要有一个空行。

```css
	.declaration-order {
        display: block;
        float: right;

        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        z-index: 100;

        border: 1px solid #e5e5e5;
        border-radius: 3px;
        width: 100px;
        height: 100px;

        font: normal 13px "Helvetica Neue", sans-serif;
        line-height: 1.5;
        text-align: center;

        color: #333;
        background-color: #f5f5f5;

        opacity: 1;
    }
```
``` javascript
    // 下面是推荐的属性的顺序
    [
        [
            "display",
            "visibility",
            "float",
            "clear",
            "overflow",
            "overflow-x",
            "overflow-y",
            "clip",
            "zoom"
        ],
        [
            "table-layout",
            "empty-cells",
            "caption-side",
            "border-spacing",
            "border-collapse",
            "list-style",
            "list-style-position",
            "list-style-type",
            "list-style-image"
        ],
        [
            "-webkit-box-orient",
            "-webkit-box-direction",
            "-webkit-box-decoration-break",
            "-webkit-box-pack",
            "-webkit-box-align",
            "-webkit-box-flex"
        ],
        [
            "position",
            "top",
            "right",
            "bottom",
            "left",
            "z-index"
        ],
        [
            "margin",
            "margin-top",
            "margin-right",
            "margin-bottom",
            "margin-left",
            "-webkit-box-sizing",
            "-moz-box-sizing",
            "box-sizing",
            "border",
            "border-width",
            "border-style",
            "border-color",
            "border-top",
            "border-top-width",
            "border-top-style",
            "border-top-color",
            "border-right",
            "border-right-width",
            "border-right-style",
            "border-right-color",
            "border-bottom",
            "border-bottom-width",
            "border-bottom-style",
            "border-bottom-color",
            "border-left",
            "border-left-width",
            "border-left-style",
            "border-left-color",
            "-webkit-border-radius",
            "-moz-border-radius",
            "border-radius",
            "-webkit-border-top-left-radius",
            "-moz-border-radius-topleft",
            "border-top-left-radius",
            "-webkit-border-top-right-radius",
            "-moz-border-radius-topright",
            "border-top-right-radius",
            "-webkit-border-bottom-right-radius",
            "-moz-border-radius-bottomright",
            "border-bottom-right-radius",
            "-webkit-border-bottom-left-radius",
            "-moz-border-radius-bottomleft",
            "border-bottom-left-radius",
            "-webkit-border-image",
            "-moz-border-image",
            "-o-border-image",
            "border-image",
            "-webkit-border-image-source",
            "-moz-border-image-source",
            "-o-border-image-source",
            "border-image-source",
            "-webkit-border-image-slice",
            "-moz-border-image-slice",
            "-o-border-image-slice",
            "border-image-slice",
            "-webkit-border-image-width",
            "-moz-border-image-width",
            "-o-border-image-width",
            "border-image-width",
            "-webkit-border-image-outset",
            "-moz-border-image-outset",
            "-o-border-image-outset",
            "border-image-outset",
            "-webkit-border-image-repeat",
            "-moz-border-image-repeat",
            "-o-border-image-repeat",
            "border-image-repeat",
            "padding",
            "padding-top",
            "padding-right",
            "padding-bottom",
            "padding-left",
            "width",
            "min-width",
            "max-width",
            "height",
            "min-height",
            "max-height"
        ],
        [
            "font",
            "font-family",
            "font-size",
            "font-weight",
            "font-style",
            "font-variant",
            "font-size-adjust",
            "font-stretch",
            "font-effect",
            "font-emphasize",
            "font-emphasize-position",
            "font-emphasize-style",
            "font-smooth",
            "line-height",
            "text-align",
            "-webkit-text-align-last",
            "-moz-text-align-last",
            "-ms-text-align-last",
            "text-align-last",
            "vertical-align",
            "white-space",
            "text-decoration",
            "text-emphasis",
            "text-emphasis-color",
            "text-emphasis-style",
            "text-emphasis-position",
            "text-indent",
            "-ms-text-justify",
            "text-justify",
            "letter-spacing",
            "word-spacing",
            "-ms-writing-mode",
            "text-outline",
            "text-transform",
            "text-wrap",
            "-ms-text-overflow",
            "text-overflow",
            "text-overflow-ellipsis",
            "text-overflow-mode",
            "-ms-word-wrap",
            "word-wrap",
            "-ms-word-break",
            "word-break"
        ],
        [
            "color",
            "background",
            "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader",
            "background-color",
            "background-image",
            "background-repeat",
            "background-attachment",
            "background-position",
            "-ms-background-position-x",
            "background-position-x",
            "-ms-background-position-y",
            "background-position-y",
            "-webkit-background-clip",
            "-moz-background-clip",
            "background-clip",
            "background-origin",
            "-webkit-background-size",
            "-moz-background-size",
            "-o-background-size",
            "background-size"
        ],
        [
            "outline",
            "outline-width",
            "outline-style",
            "outline-color",
            "outline-offset",
            "opacity",
            "filter:progid:DXImageTransform.Microsoft.Alpha(Opacity",
            "-ms-filter:\\'progid:DXImageTransform.Microsoft.Alpha",
            "-ms-interpolation-mode",
            "-webkit-box-shadow",
            "-moz-box-shadow",
            "box-shadow",
            "filter:progid:DXImageTransform.Microsoft.gradient",
            "-ms-filter:\\'progid:DXImageTransform.Microsoft.gradient",
            "text-shadow"
        ],
        [
            "-webkit-transition",
            "-moz-transition",
            "-ms-transition",
            "-o-transition",
            "transition",
            "-webkit-transition-delay",
            "-moz-transition-delay",
            "-ms-transition-delay",
            "-o-transition-delay",
            "transition-delay",
            "-webkit-transition-timing-function",
            "-moz-transition-timing-function",
            "-ms-transition-timing-function",
            "-o-transition-timing-function",
            "transition-timing-function",
            "-webkit-transition-duration",
            "-moz-transition-duration",
            "-ms-transition-duration",
            "-o-transition-duration",
            "transition-duration",
            "-webkit-transition-property",
            "-moz-transition-property",
            "-ms-transition-property",
            "-o-transition-property",
            "transition-property",
            "-webkit-transform",
            "-moz-transform",
            "-ms-transform",
            "-o-transform",
            "transform",
            "-webkit-transform-origin",
            "-moz-transform-origin",
            "-ms-transform-origin",
            "-o-transform-origin",
            "transform-origin",
            "-webkit-animation",
            "-moz-animation",
            "-ms-animation",
            "-o-animation",
            "animation",
            "-webkit-animation-name",
            "-moz-animation-name",
            "-ms-animation-name",
            "-o-animation-name",
            "animation-name",
            "-webkit-animation-duration",
            "-moz-animation-duration",
            "-ms-animation-duration",
            "-o-animation-duration",
            "animation-duration",
            "-webkit-animation-play-state",
            "-moz-animation-play-state",
            "-ms-animation-play-state",
            "-o-animation-play-state",
            "animation-play-state",
            "-webkit-animation-timing-function",
            "-moz-animation-timing-function",
            "-ms-animation-timing-function",
            "-o-animation-timing-function",
            "animation-timing-function",
            "-webkit-animation-delay",
            "-moz-animation-delay",
            "-ms-animation-delay",
            "-o-animation-delay",
            "animation-delay",
            "-webkit-animation-iteration-count",
            "-moz-animation-iteration-count",
            "-ms-animation-iteration-count",
            "-o-animation-iteration-count",
            "animation-iteration-count",
            "-webkit-animation-direction",
            "-moz-animation-direction",
            "-ms-animation-direction",
            "-o-animation-direction",
            "animation-direction"
        ],
        [
            "content",
            "quotes",
            "counter-reset",
            "counter-increment",
            "resize",
            "cursor",
            "-webkit-user-select",
            "-moz-user-select",
            "-ms-user-select",
            "user-select",
            "nav-index",
            "nav-up",
            "nav-right",
            "nav-down",
            "nav-left",
            "-moz-tab-size",
            "-o-tab-size",
            "tab-size",
            "-webkit-hyphens",
            "-moz-hyphens",
            "hyphens",
            "pointer-events"
        ]
    ]
```
### 8、颜色

用16进制用小写字母，且尽量用简写。

```css
    /* not good */
    .element {
        color: #ABCDEF;
        background-color: #001122;
    }

    /* good */
    .element {
        color: #abcdef;
        background-color: #012;
    }
```

### 9、属性简写

属性简写需要你非常清楚属性值的正确顺序，而且在大多数情况下并不需要设置属性简写中包含的所有值，所以建议尽量分开声明会更加清晰；

margin 和 padding 相反，需要使用简写；

常见的属性简写包括：

- font
- background
- transition
- animation

```css
    /* not good */
    .element {
        transition: opacity 1s linear 2s;
    }

    /* good */
    .element {
        transition-delay: 2s;
        transition-timing-function: linear;
        transition-duration: 1s;
        transition-property: opacity;
    }
```
### 10、媒体查询

尽量将媒体查询的规则靠近与他们相关的规则，不要将他们一起放到一个独立的样式文件中，或者丢在文档的最底部，这样做只会让大家以后更容易忘记他们。

```CSS
    .element {
        color: #ABCDEF;
    }

    .element-avatar{
        color: #ABCDEF;
    }

    @media (min-width: 480px) {
        .element {
            color: #ABCDEF;
        }

        .element-avatar {
            color: #ABCDEF;
        }
    }
```

### 11、其他

- 不允许有空的规则
- 元素选择器用小写字母
- 去掉小数点前面的0
- 去掉数字中不必要的小数点和末尾的0
- 属性值'0'后面不要加单位
- 同个属性不同前缀的写法需要在垂直方向保持对齐
- 无前缀的标准属性应该写在有前缀的属性后面
- 不要在同个规则里出现重复的属性，如果重复的属性是连续的则没关系 
- 不要在一个文件里出现两个相同的规则
- 用 border: 0; 代替 border: none;
- 选择器不要超过4层（在scss中如果超过4层应该考虑用嵌套的方式来写）
- 发布的代码中不要有 @import
- 尽量少用'*'选择器

```css
    /* not good */
    .element {
        font-size: 10px;
    }

    /* not good */
    LI {
        font-size: 10px;
    }

    /* good */
    li {
        font-size: 10px;
    }

    /* not good */
    .element {
        color: rgba(0, 0, 0, 0.5);
    }

    /* good */
    .element {
        color: rgba(0, 0, 0, .5);
    }

    /* not good */
    .element {
        width: 50.0px;
    }

    /* good */
    .element {
        width: 50px;
    }

    /* not good */
    .element {
        width: 0px;
    }

    /* good */
    .element {
        width: 0;
    }

    /* not good */
    .element {
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;

        background: linear-gradient(to bottom, #fff 0, #eee 100%);
        background: -webkit-linear-gradient(top, #fff 0, #eee 100%);
        background: -moz-linear-gradient(top, #fff 0, #eee 100%);
    }

    /* good */
    .element {
        -webkit-border-radius: 3px;
           -moz-border-radius: 3px;
                border-radius: 3px;

        background: -webkit-linear-gradient(top, #fff 0, #eee 100%);
        background:    -moz-linear-gradient(top, #fff 0, #eee 100%);
        background:         linear-gradient(to bottom, #fff 0, #eee 100%);
    }

    /* not good */
    .element {
        color: rgb(0, 0, 0);
        width: 50px;
        color: rgba(0, 0, 0, .5);
    }

    /* good */
    .element {
        color: rgb(0, 0, 0);
        color: rgba(0, 0, 0, .5);
    }
```

## 五、Javascript

### 1、缩进

使用soft tab（4个空格）

```javascript
    var x = 1,
    y = 1;

    if (x < y) {
        x += 10;
    } else {
        x += 1;
    }
```

### 2、单行长度

不要超过80，但如果编辑器开启word wrap可以不考虑单行长度。

### 3、分号

以下几种情况后需加分号：

- 变量声明
- 表达式
- return
- throw
- break
- continue
- do-while

```javascript
    /* 变量声明 */
    var x = 1;

    /* 表达式 */
    x++;

    /* do-while */
    do {
        x++;
    } while (x < 10);
```
### 4、空格

以下几种情况不需要空格：

- 对象的属性名后
- 前缀一元运算符后
- 后缀一元运算符前
- 函数调用括号前
- 无论是函数声明还是函数表达式，'('前不要空格
- 数组的'['后和']'前
- 对象的'{'后和'}'前
- 运算符'('后和')'前

以下几种情况需要空格：

- 二元运算符前后
- 三元运算符'?:'前后
- 代码块'{'前
- 下列关键字前：else, while, catch, finally
- 下列关键字后：if, else, for, while, do, switch, case, try, catch, finally, with, return, typeof
- 单行注释'//'后（若单行注释和代码同行，则'//'前也需要），多行注释'*'后
- 对象的属性值前
- for循环，分号后留有一个空格，前置条件如果有多个，逗号后留一个空格
- 无论是函数声明还是函数表达式，'{'前一定要有空格
- 函数的参数之间

```javascript
    // not good
    var a = {
        b :1
    };

    // good
    var a = {
        b: 1
    };

    // not good
    ++ x;
    y ++;
    z = x?1:2;

    // good
    ++x;
    y++;
    z = x ? 1 : 2;

    // not good
    var a = [ 1, 2 ];

    // good
    var a = [1, 2];

    // not good
    var a = ( 1+2 )*3;

    // good
    var a = (1 + 2) * 3;

    // no space before '(', one space before '{', one space between function parameters
    var doSomething = function(a, b, c) {
        // do something
    };

    // no space before '('
    doSomething(item);

    // not good
    for(i=0;i<6;i++){
        x++;
    }

    // good
    for (i = 0; i < 6; i++) {
        x++;
    }
```

### 5、空行

以下几种情况需要空行：

- 变量声明后（当变量声明在代码块的最后一行时，则无需空行）
- 注释前（当注释在代码块的第一行时，则无需空行）
- 代码块后（在函数调用、数组、对象中则无需空行）
- 文件最后保留一个空行

```javascript
    // need blank line after variable declaration
    var x = 1;

    // not need blank line when variable declaration is last expression in the current block
    if (x >= 1) {
        var y = x + 1;
    }

    var a = 2;

    // need blank line before line comment
    a++;

    function b() {
        // not need blank line when comment is first line of block
        return a;
    }

    // need blank line after blocks
    for (var i = 0; i < 2; i++) {
        if (true) {
            return false;
        }

        continue;
    }

    var obj = {
        foo: function() {
            return 1;
        },

        bar: function() {
            return 2;
        }
    };

    // not need blank line when in argument list, array, object
    func(
        2,
        function() {
            a++;
        },
        3
    );

    var foo = [
        2,
        function() {
            a++;
        },
        3
    ];


    var foo = {
        a: 2,
        b: function() {
            a++;
        },
        c: 3
    };
```
### 6、换行

换行的地方，行末必须有','或者运算符，以下几种情况不需要换行：

- 下列关键字后：else, catch, finally
- 代码块'{'前

以下几种情况需要换行：

- 代码块'{'后和'}'前
- 变量赋值后

```javascript
    // not good
    var a = {
        b: 1
        , c: 2
    };

    x = y
        ? 1 : 2;

    // good
    var a = {
        b: 1,
        c: 2
    };

    x = y ? 1 : 2;
    x = y ?
        1 : 2;

    // no need line break with 'else', 'catch', 'finally'
    if (condition) {
        ...
    } else {
        ...
    }

    try {
        ...
    } catch (e) {
        ...
    } finally {
        ...
    }

    // not good
    function test()
    {
        ...
    }

    // good
    function test() {
        ...
    }

    // not good
    var a, foo = 7, b,
        c, bar = 8;

    // good
    var a,
        foo = 7,
        b, c, bar = 8;
```
### 7、单行注释

- 双斜线后，必须跟一个空格；
- 缩进与下一行代码保持一致；
- 可位于一个代码行的末尾，与代码间隔一个空格。

```javascript
    if (condition) {
        // if you made it here, then all security checks passed
        allowed();
    }

    var zhangsan = 'zhangsan'; // one space after code
```

### 8、多行注释

最少三行, '*'后跟一个空格
建议在以下情况下使用：

- 难于理解的代码段
- 可能存在错误的代码段
- 浏览器特殊的HACK代码
- 业务逻辑强相关的代码

```javascript
    /*
     * one space after '*'
     */
    var x = 1;
```

### 9、文档注释

建议在以下情况下使用：

- 所有常量
- 所有函数
- 所有类

```javascript
    /**
     * @func
     * @desc 一个带参数的函数
     * @param {string} a - 参数a
     * @param {number} b=1 - 参数b默认值为1
     * @param {string} c=1 - 参数c有两种支持的取值</br>1—表示x</br>2—表示xx
     * @param {object} d - 参数d为一个对象
     * @param {string} d.e - 参数d的e属性
     * @param {string} d.f - 参数d的f属性
     * @param {object[]} g - 参数g为一个对象数组
     * @param {string} g.h - 参数g数组中一项的h属性
     * @param {string} g.i - 参数g数组中一项的i属性
     * @param {string} [j] - 参数j是一个可选参数
     */
    function foo(a, b, c, d, g, j) {
        ...
    }
```

### 10、引号

最外层统一使用单引号。

```javascript
    // not good
    var x = "test";

    // good
    var y = 'foo',
        z = '<div id="test"></div>';
```

### 11、变量命名

- 标准变量采用驼峰式命名（除了对象的属性外，主要是考虑到cgi返回的数据）
- 'ID'在变量名中全大写
- 'URL'在变量名中全大写
- 'Android'在变量名中大写第一个字母
- 'iOS'在变量名中小写第一个，大写后两个字母
- 常量全大写，用下划线连接
- 构造函数，大写第一个字母
- jquery对象必须以'$'开头命名

```javascript
    var thisIsMyName;

    var goodID;

    var reportURL;

    var AndroidVersion;

    var iOSVersion;

    var MAX_COUNT = 10;

    function Person(name) {
        this.name = name;
    }

    // not good
    var body = $('body');

    // good
    var $body = $('body');
```

### 12、变量申明

一个函数作用域中所有的变量声明尽量提到函数首部，用一个var声明，不允许出现两个连续的var声明。

### 13、函数

- 无论是函数声明还是函数表达式，'('前不要空格，但'{'前一定要有空格；
- 函数调用括号前不需要空格；
- 立即执行函数外必须包一层括号；
- 不要给inline function命名；
- 参数之间用', '分隔，注意逗号后有一个空格。

```javascript
    // no space before '(', but one space before'{'
    var doSomething = function(item) {
        // do something
    };

    function doSomething(item) {
        // do something
    }

    // not good
    doSomething (item);

    // good
    doSomething(item);

    // requires parentheses around immediately invoked function expressions
    (function() {
        return 1;
    })();

    // not good
    [1, 2].forEach(function x() {
        ...
    });

    // good
    [1, 2].forEach(function() {
        ...
    });

    // not good
    var a = [1, 2, function a() {
        ...
    }];

    // good
    var a = [1, 2, function() {
        ...
    }];

    // use ', ' between function parameters
    var doSomething = function(a, b, c) {
        // do something
    };
```

### 14、 数据、对象

- 对象属性名不需要加引号；
- 对象以缩进的形式书写，不要写在一行；
- 数组、对象最后不要有逗号。

```javascript
    // not good
    var a = {
        'b': 1
    };

    var a = {b: 1};

    var a = {
        b: 1,
        c: 2,
    };

    // good
    var a = {
        b: 1,
        c: 2
    };
```

### 15、括号

下列关键字后必须有大括号（即使代码块的内容只有一行）：if, else, for, while, do, switch, try, catch, finally, with。

### 16、null

适用场景：

- 初始化一个将来可能被赋值为对象的变量
- 与已经初始化的变量做比较
- 作为一个参数为对象的函数的调用传参
- 作为一个返回对象的函数的返回值

不适用场景：

- 不要用null来判断函数调用时有无传参
- 不要与未初始化的变量做比较

```javascript
    // not good
    function test(a, b) {
        if (b === null) {
            // not mean b is not supply
            ...
        }
    }

    var a;

    if (a === null) {
        ...
    }

    // good
    var a = null;

    if (a === null) {
        ...
    }
```

### 17、undefined

- 永远不要直接使用undefined进行变量判断
- 使用typeof和字符串'undefined'对变量进行判断

```javascript
    // not good
    if (person === undefined) {
        ...
    }

    // good
    if (typeof person === 'undefined') {
        ...
    }
```

### 18、jshint

- 用'===', '!=='代替'==', '!='
- for-in里一定要有hasOwnProperty的判断
- 不要在内置对象的原型上添加方法，如Array, Date
- 不要在内层作用域的代码里声明了变量，之后却访问到了外层作用域的同名变量
- 变量不要先使用后声明
- 不要在一句代码中单单使用构造函数，记得将其赋值给某个变量
- 不要在同个作用域下声明同名变量
- 不要在一些不需要的地方加括号，例：delete(a.b)
- 不要使用未声明的变量（全局变量需要加到.jshintrc文件的globals属性里面）
- 不要声明了变量却不使用
- 不要在应该做比较的地方做赋值
- debugger不要出现在提交的代码里
- 数组中不要存在空元素
- 不要在循环内部声明函数
- 不要像这样使用构造函数，例：new function () { ... }, new Object
- 不要混用tab和space
- 不要在一处使用多个tab或space
- 换行符统一用'LF'
- 对上下文this的引用只能使用'_this', 'that', 'self'其中一个来命名
- 行尾不要有空白字符；
- switch的falling through和no default的情况一定要有注释特别说明
- 不允许有空的代码块

```javascript
    // not good
    if (a == 1) {
        a++;
    }

    // good
    if (a === 1) {
        a++;
    }

    // good
    for (key in obj) {
        if (obj.hasOwnProperty(key)) {
            // be sure that obj[key] belongs to the object and was not inherited
            console.log(obj[key]);
        }
    }

    // not good
    Array.prototype.count = function(value) {
        return 4;
    };

    // not good
    var x = 1;

    function test() {
        if (true) {
            var x = 0;
        }

        x += 1;
    }

    // not good
    function test() {
        console.log(x);

        var x = 1;
    }

    // not good
    new Person();

    // good
    var person = new Person();

    // not good
    delete(obj.attr);

    // good
    delete obj.attr;

    // not good
    if (a = 10) {
        a++;
    }

    // not good
    var a = [1, , , 2, 3];

    // not good
    var nums = [];

    for (var i = 0; i < 10; i++) {
        (function(i) {
            nums[i] = function(j) {
                return i + j;
            };
        }(i));
    }

    // not good
    var singleton = new function() {
        var privateVar;

        this.publicMethod = function() {
            privateVar = 1;
        };

        this.publicMethod2 = function() {
            privateVar = 2;
        };
    };
```