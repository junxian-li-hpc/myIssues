# SCP 上传和下载用法

SCP（Secure Copy）是一种在本地主机和远程主机之间进行文件传输的命令行工具。它使用 SSH 协议进行安全的文件传输。

## 上传文件

要将本地文件上传到远程主机，可以使用以下命令：
    
```bash
scp /path/to/local/file username@remotehost:/path/to/remote/file
```

下载文件

要下载远程主机上的文件，可以使用以下命令：

```bash
scp username@remotehost:/path/to/remote/file /path/to/local/file
```

## 上传目录

要上传整个目录，请使用以下命令：

```bash
scp -r /path/to/local/directory username@remotehost:/path/to/remote/directory
```

## 下载目录

要下载整个目录，请使用以下命令：

```bash
scp -r username@remotehost:/path/to/remote/directory /path/to/local/directory
```