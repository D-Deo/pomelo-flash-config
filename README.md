Pomelo-Flash-CONFIG
================

大家是否还曾记得 lordofpomelo 中对于配置表（config）的读取方式？

有些时候为了项目方便，保持配置表前后台只用一份

这样在当使用 node.js 的 pomelo 作为服务端时，如果使用的是 lordofpomelo 中对 config 的访问方式话

那么我这里就贡献一个用 flash 作为客户端，以相同 api 为访问方式的读取 config 的组件

希望大家使用的开心～！！



HOW TO USE
================
在项目提供了一个 test 可供参考

#1. Data 类：在构造方法中可携带一个 key 作为字典索引，也可以不填，默认会用 id 作为 key

#2. findById 方法：这里的 id 对应的字典索引，如果构造方法中设置过 key 则对应的是那个 key
