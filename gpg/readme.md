#### 写在前面

* [Link to](http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)

> 利用gpg在进行加密解密文件，加密算法为RSA(RSA: 某三位实现RSA算法的数学家名字简称)，一种非对称加密算法

* 关于文件传输流程 （场景：A向B发送加密文件。A为发送方，B为接收方）
  1. RSA的稳定性基于大整数的因式分解
  2. B需要在本地公钥和私钥
  3. A需要知道B的公钥（B的公钥可以由B发送，或从公钥服务器上下载，前提是B已经将公钥传至公钥服务器）
  4. A拿到B的公钥对文件进行加密，然后A将加密后的文件发送给B
  5. B得到A发送的加密文件后，通过私钥对文件进行解密

> 谁接收文件，谁来生成公钥、私钥。为了便于理解，做个比喻：B的公钥相当于一把锁，这把锁只有B的钥匙(私钥)能打开，B将这把锁抛向人间（公钥服务器），拿到这把锁的人可以利用这把锁将自己的源文件“锁”起来，然后把"锁"好的文件交给B，B再用自己的钥匙打开这把加锁的文件。

* 步骤

#### 1. Install Gnupg (mac)

> gnuPG: 实现RAS加密的客户端工具。

```shell
$ brew install gnupg
```

#### 2. 生成密钥(公钥、私钥)

```shell
$ gpg --gen-key （回车）
```

##### 2.1 选择使用的加密算法

```shell
gpg (GnuPG) 1.4.12; Copyright (C) 2012 Free Software Foundation, Inc.
　　This is free software: you are free to change and redistribute it.
　　There is NO WARRANTY, to the extent permitted by law.
　　请选择您要使用的密钥种类：
　　　(1) RSA and RSA (default)
　　　(2) DSA and Elgamal
　　　(3) DSA (仅用于签名)　
　　　(4) RSA (仅用于签名)
　　您的选择？
```

* 默认选择第一项，表示使用RAS加密算法


##### 2.2 选择密钥有效期限

```shell
请设定这把密钥的有效期限。
　　　0 = 密钥永不过期
　　　<n> = 密钥在 n 天后过期
　　　<n>w = 密钥在 n 周后过期
　　　<n>m = 密钥在 n 月后过期
　　　<n>y = 密钥在 n 年后过期
　　密钥的有效期限是？(0)
```

* 默认选0：永不过期


##### 2.3 最终确认

```shell
以上正确吗？(y/n)

```

* 确认

##### 2.4 输入个人信息

```shell
您需要一个用户标识来辨识您的密钥；本软件会用真实姓名、注释和电子邮件地址组合成用户标识，如下所示：
　　"Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"
　　真实姓名：
　　电子邮件地址：
　　注释：
```

* 建议使用英文

##### 2.5 生成用户信息

```shell
您选定了这个用户标识：
　　　"username <user email>"
```

##### 2.6 确认生成的用户信息

```shell
更改姓名(N)、注释(C)、电子邮件地址(E)或确定(O)/退出(Q)？
```

*  确定(o)

##### 2.7 设置私钥密码(查看私钥的密码)

```shell
您需要一个密码来保护您的私钥：
```

##### 2.8 系统生成密钥

```shell
***

我们需要生成大量的随机字节。这个时候您可以多做些琐事(像是敲打键盘、移动鼠标、读写硬盘之类的)，这会让随机数字发生器有更好的机会获得足够的熵数。

***

gpg: 密钥 FEA8FFBB 被标记为绝对信任
　　公钥和私钥已经生成并经签名。

***
```

* FEA8FFBB: 这个是我的用户ID，等价于<hn2015likun@gmail.com>

##### 2.9 生成一张撤销证书（非必要）

> 撤销证书用途，将来自己密钥作废之后，可以请求外部公钥服务器把自己的公钥删除（也就是收回你抛向人间的那把锁，还记得前面的比喻吧）

```shell
gpg --gen-revoke [用户ID]
```

* 至此，公钥 & 私钥已经生成，并且生成了撤销证书

#### 3. gpg用法(自行查阅更多)

```shell
$ gpg --help

```

##### 3.1 加密文件（问文件加锁）

* 首先，要获得那把锁(公钥)，可以让B发送给你，或则去公钥服务器下载（前提B已经将公钥上传）

###### 3.1.1 上传公钥

```shell
$ gpg --send-keys [用户ID]
```

* 默认的公钥服务器：hkp://subkeys.pgp.net（可在~/.gnupg/gpg.conf配置）
* 这个公钥服务器会通知所有公钥服务器添加这个公钥，最后，所有的公钥服务器都有了这个公钥
* 这里有个漏洞，就是所有人（阿猫、阿狗）也可以伪装成你的身份（用户ID）上传公钥
* 为解决上面那个漏洞，可以为你的公钥添加指纹，如下

```shell
$ gpg --fingerprint [用户ID]
```


##### 3.1.2 获得公钥

* 一种情况，你去找B获取
```shell
$ gpg --import [密钥文件]
```

* 另一种情况，去公钥服务器获取

```shell
# 我还没试过
$ gpg --keyserver hkp://subkeys.pgp.net --search-keys [用户ID]   
```


##### 3.1.3 加密文件

* 加密

```shell
$ gpg -r DEA8FFBB[用户标识] --output demo.en.txt -e demo.txt
```

* 解密

```shell

$ gpg -d demo.en.txt

```

* 解密需要输入私钥密码，加是之前设置的那个，如下图：

![](https://s10.mogucdn.com/p2/170212/116560224_1ijfac2c467c3b3l0h23dljcac751_1650x436.png)


# 下面这个是我的公钥文件

* 可以用这把锁(公钥)给我发文件了

[public-key.txt](https://github.com/xiuhonglee/devtool-config/blob/master/gpg/public-key.txt)