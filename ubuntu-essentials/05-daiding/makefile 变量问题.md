
最近写Makefile遇到一个问题，是需要对变量进行修改，并且希望Makefile中其他的地方（目标规则）也能使用修改后的变量。
不过可能很少有这样的场景，比如：
```
clean:
    make clean1
    make clean2
```
在 `make clean1`之后会重新启动一个shell，所以`make clean2`中的变量是无法获取到`make clean1`后修改的变量的。
大概是这个意思？还挺有意思。

以下是GPT的回答。
```md
在Makefile中，变量的行为看起来可能会有点迷惑，特别是当它涉及到在目标规则中修改变量值，并期望这些改变在其他目标规则中持续的情况。首先，重要的是要理解Makefile的执行模型和变量的作用域。

### Makefile的变量作用域

- **全局变量**：在Makefile的任何地方定义的变量（在所有规则外部），在整个Makefile中都是可见的。
- **目标规则变量**：可以在特定目标规则内部定义变量，这些变量只对这个目标和它的依赖有效。

### 修改变量的值

当您在一个目标规则中修改变量的值时，这个修改只对当前shell命令有效。Make执行每个规则的命令时，会为每个命令启动一个新的shell。因此，一个命令中对变量的修改不会影响到后续命令或其他目标规则。

### 实现跨目标规则的变量修改

如果您想要一个目标规则中的变量修改对另一个目标规则可见，这里有几种方法可以尝试：

1. **使用文件来传递状态**：在第一个目标规则中修改变量的值，并将新值写入文件。然后在第二个目标规则中，从文件中读取这个值。

2. **使用命令行变量覆盖**：在调用make时，可以通过命令行传递变量值，这样可以覆盖Makefile中的变量值。

3. **使用递归调用make**：在第一个目标规则中，使用递归调用`make`并传递变量值。这种方式可以让变量的修改在下一个`make`调用中生效。

### 示例

假设您有两个目标，`target1`和`target2`，您希望在`target1`中修改一个变量，并让这个修改在`target2`执行时可见：

**方法1：使用文件传递状态**

```makefile
target1:
	echo "new_value" > var.txt

target2:
	$(eval var := $(shell cat var.txt))
	echo $(var)
```

**方法2：使用命令行变量覆盖**

```bash
make target1 VAR="new_value"
make target2 VAR="new_value"
```

在Makefile中：

```makefile
VAR := default_value

target1:
	echo $(VAR)

target2:
	echo $(VAR)
```

**方法3：使用递归调用make**

```makefile
target1:
	@$(MAKE) target2 VAR="new_value"

target2:
	echo $(VAR)
```

在这里，`$(MAKE)`变量是一个特殊的Make变量，它指向Make工具本身，确保递归调用的是同一个Make版本。

选择哪种方法取决于您的具体需求和偏好。
```