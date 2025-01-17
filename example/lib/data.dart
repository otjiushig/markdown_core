const String markdownData = """
## 1.标题
行首加井号表示不同级别的标题(H1-H6),例如：# H1,## H2,### H3,#### H4(注意：#号后边应有英文空格)。
# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题

## 2.文字效果

使用 * 将文字包围起来表示*斜体*，如：\\*斜体*。
使用 ** 将文字包围起来表示**粗体**，如：\\*\\*粗体**。
使用 ~~ 将文字包围起来表示~~删除线~~，如：\\~\\~删除线~~。

如果你想使一段话中部分文字高亮显示，来起到突出强调的作用，那么可以把它用\\`包围起来，`注意`这不是单引号，而是``Tab``上方，``数字1``左边的按键（注意使用``英文``输入法）。

##  3. 外链接

使用 \\[描述](链接地址) 为文字增加外链接。
这是去往 [旧时光网站](https://www.jiushig.com) 的链接。

## 4. 图片

使用 \\!\\[描述](图片链接地址) 插入图像，仅仅比链接前面多了一个!号。插入图片示例： 

![旧时光](https://file.jiushig.com/oldtime/oldtime_wallpaper.png)

## 5. 列表

使用 *，+，- 表示无序列表。

- 无序列表项 一
- 无序列表项 二
- 无序列表项 三

行首加四个空格表示二级列表，以此类推。

+ 一级列表
    + 二级列表
        + 三级列表

## 6. 引用

行首使用 > 表示文字引用。

单个引用：

> 野火烧不尽，春风吹又生。野火烧不尽，春风吹又生。

当然，你也可以 使用多个>>

>我用了一个
>> 我用了两个

## 7. 片段

可以用 ``` 包裹一段文字，用来显示某一片段，例如显示如下代码片段：

```
\$(document).ready(function () {
    alert('RUNOOB');
});
```

## 8. 表格

""";

const String markdownData1 = """
文字文字
第二行![旧时光](https://oss.jiushig.com/oldtime/oldtime_wallpaper.png)图片之后的文字
""";

const String markdownData2 = """
- QQ群:[675565134(点击加入)](https://jq.qq.com/?_wv=1027&k=5ueEciR)。
""";

const String markdownData3 = """
+ 普通文本

直接输入的文字就是普通文本。

+ 单行文本

        使用两个Tab(或八个空格)符实现单行文本.

+ 多行文本

        多行文本和
        单行文本异曲同工，只要在
        每行行首加两个Tab(或八个空格)。
""";

// 链接不能正常解析
const String markdownData4 = """
好了，为了提供更好的记录功能，后边我会继续优化。当然，如果你有好的建议，通过[*反馈*](https://www.jiushig.com/content/608)即可联系到我。
""";

const String markdownData5 = """
+ 一级列表 wqewqew 大王第五弹撒地方
    + hello 二级列表
        + 三级列表三级列表三级列表三级列表三级列表三级列表三级列表三级列表三级列表三级列表三级列表
            + 四级列表
""";
