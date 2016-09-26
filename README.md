目录树：nerdtree 
	1.	<C-e>：打开关闭目录树
查找文件：ctrlp 
	1.	<C-p>：查找文件
方法跳转：Ctags 
	1.	<C-[>：跳到函数声明
	2.	<C-o/t>：返回到跳转前的位置
	3.	<C-i>：右侧显示当前列表函数
多行编辑：vim-multiple-cursors 
	1.	<C-n>：选择多个相同词
快速注释：scrooloose/nerdcommenter 
	1.	n,cc 注释 n表示行数
	2.	n,cu取消注释 n表示行数
插件python_match.vim 
	1.	[%：跳转到
if/elif/else, try/except/catch, for/continue/break, and
while/continue/break 结构开始位置
	2.	]%：跳转到
if/elif/else, try/except/catch, for/continue/break, and
while/continue/break 结构结束位置
Todo列表：TaskList.vim 
	1.	,td：查询todo列表

函数查找：ctrlp-funky 
	1.	,fu：模糊查找

快速移动：vim-easymotion 
	1.	,,b：向上查找 按字母键选择跳到的位置
	2.	,,w：向下查找
	3.	,,h：行内向左查找
	4.	,,j：首字母向下查找
	5.	,,k：首字母向上查找
	6.	,,l：行内向左查找

git命令：vim-gitgutter 
	1.	gj：跳到下一个diff
	2.	gk：跳到下一个diff

git命令：vim-fugitive（https://github.com/tpope/vim-fugitive） 
	1.	Gdiff：查看不同（git checkout develop Gdiff feature/tlwlmy）
分屏命令： 
	1.	ws：水平分割
	2.	wv：垂直分割
	3.	wj：移动到上一个分屏
	4.	wk：移动到下一个分屏
	5.	wh：移动到左一个分屏
	6.	wl：移动到右一个分屏
	7.	wr：按w后持续按r，分屏右边框向右移
	8.	wf：按w后持续按f，分屏左边框向左移
	9.	wi：按w后持续按i，分屏下边框向下递增
	10.	wd：按w后持续按d，分屏下边框向上递减
常用命令： 
	1.	<C-a>：全选
	2.	<C-b>：相对行数和绝对行数切换
	3.	,df：添加python头
	4.	wdb： 删除单词，留在命令模式
	5.	caw： 改写单词，进入编辑模式

块操作 
	1.	删除
	    1.	CTRL+v,启用块可视模式，之后移动鼠标，可以选中某一个矩形块
	    2.	删除或剪切操作 （a）,按“d”即可删除选中区域 
	    3.	按“D”删除选中区域及所在行后面的数据 
	2.	插入
	    1.	CTRL+v,进入列块模式，选中需要添加内容的地方
	    2.	按“I”进入插入，然后输入“//”（你想输入的字符）
	    3.	然后按“ESC”即可在其它行输入你想输入的字符了 
