## Linux下Golang的开发环境搭建


两个文件：一个是vim的行为配置文件; 另一个是环境搭建文件。
* [.vimrc](https://github.com/1046102779/goide/blob/master/.vimrc)
* [.install](https://github.com/1046102779/goide/blob/master/goinstall.md)

## 问题搜集：
```shell
1. RuntimeError: No completions found.
    [related issue](https://github.com/nsf/gocode/issues/381) 的最后一行是关键
    也就是说，如果遇到这类错误，同时发现YouCompleteMe服务日志显示："ERROR - Unable to connect to server"

    通过**go build & go install** 来解决，把这些类自动放入到**$GOPATH/pkg**下, 即可解决, 并不是连不上服务
```
