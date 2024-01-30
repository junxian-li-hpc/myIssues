# ubuntu server
记住把windows的防火墙关闭，然后我的设备是 windows11,  windows10+其中的ubuntu虚拟机， 这里要用桥接模式，使得 win11和虚拟器在一个网段 xxx.xxx.xxx.yyy 前三个字段要一样，我这里 ubuntu:192.168.1.2，win11: 192.168.1.9， win10: 192.168.1.11
## ssh
新安装的Ubuntu Server上配置SSH服务的基本步骤如下：

1. **安装SSH服务器**：
   在终端中输入以下命令以安装OpenSSH服务器软件包：
   ```bash
   sudo apt update
   sudo apt install openssh-server
   ```
   Ubuntu 通常会自动启动SSH服务，但如果你需要手动启动它，可以使用以下命令：

   ```bash
   sudo systemctl start ssh
   ```

2. **检查SSH服务状态**：
   确认SSH服务是否已经启动并运行正常：
   ```bash
   sudo systemctl status ssh
   ```

3. **设置SSH开机自启**（如果尚未自动设置）：
   ```bash
   sudo systemctl enable ssh
   ```

4. **配置SSH**：
   - **编辑SSH配置文件** `/etc/ssh/sshd_config` 来调整SSH服务的行为。例如，你可能想要允许或禁止root用户登录、更改端口号、限制访问IP等。打开配置文件进行编辑：
     ```bash
     sudo nano /etc/ssh/sshd_config
     ```

   - **配置示例**：
     若要允许root用户通过SSH登录（一般不推荐），找到 `PermitRootLogin` 行并修改为：
     ```text
     PermitRootLogin yes
     ```
     （默认情况下，在某些版本的Ubuntu中，出于安全考虑，可能禁止了root直接通过SSH登录。）

   - 保存并退出编辑器（在nano中按 `Ctrl + X`，然后按 `Y` 确认保存，再按 `Enter` 确认文件名）。

   - **应用配置变更**：
     配置文件修改后，需要重启SSH服务以使更改生效：
     ```bash
     sudo systemctl restart ssh
     ```

5. **防火墙配置**（如果系统启用了防火墙如UFW）：
   确保SSH端口（默认是22）在防火墙规则中是开放的，以便外部客户端能够连接到SSH服务：
   ```bash
   sudo ufw allow ssh
   # 或者明确指定端口
   sudo ufw allow 22/tcp
   ```

6. **生成SSH密钥对**（可选，用于无密码登录）：
   如果你想使用密钥对进行身份验证而非每次登录都输入密码，可以在本地机器上生成SSH密钥对，并将公钥复制到服务器上的`~/.ssh/authorized_keys`文件中。

7. **测试远程连接**：
   使用SSH客户端从另一台计算机尝试连接到你的Ubuntu Server，确保一切正常工作。

请始终确保遵循安全最佳实践，例如禁用不必要的服务、使用强密码或密钥对认证、限制登录策略等。



## 代理
在Ubuntu Server上配置代理，通常指的是配置系统级或应用程序级别的HTTP、HTTPS或其他协议的代理设置。以下是如何在Ubuntu Server中全局或针对特定服务（如apt、wget等）配置HTTP/HTTPS代理：

### 全局代理配置

全局代理一般适用于所有使用系统网络栈的应用程序，可以通过修改环境变量来实现。

#### 方法一：临时配置

对于临时会话，在终端中设置HTTP和HTTPS代理：

```bash
export http_proxy=http://proxy.example.com:8080
export https_proxy=https://proxy.example.com:8080
# 如果还需要支持FTP代理
export ftp_proxy=http://proxy.example.com:8080
# 对于不需要代理的本地主机
export no_proxy=localhost,127.0.0.1,localaddress,.localdomain.com
```

#### 方法二：永久配置

要永久性地为所有用户设置代理，可以将这些环境变量添加到`/etc/environment`文件中：

```bash
sudo nano /etc/environment
```
然后在打开的文件末尾添加：
```bash
http_proxy="http://proxy.example.com:8080"
https_proxy="https://proxy.example.com:8080"
ftp_proxy="http://proxy.example.com:8080"
no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
```
保存并退出编辑器后，需要重新加载环境变量以使其生效：
```bash
source /etc/environment
```
或者重启服务器使得更改对所有服务生效。

### 针对特定服务配置代理

例如，为APT包管理器配置代理：

```bash
sudo nano /etc/apt/apt.conf.d/proxy.conf
```
在打开的文件中输入：
```conf
Acquire::http::Proxy "http://proxy.example.com:8080/";
Acquire::https::Proxy "https://proxy.example.com:8080/";
```
保存并退出编辑器。

### 注意事项

- 替换上述例子中的`proxy.example.com:8080`为实际的代理服务器地址和端口。
- 不同的应用程序可能有不同的代理配置方式，需要查阅具体应用的文档来了解如何配置。

如果需要socks代理，配置方式类似，但需根据应用或工具的具体要求来设置SOCKS代理环境变量或配置文件。


## 修改时间
```bash
sudo timedatectl set-timezone Asia/Shanghai
```