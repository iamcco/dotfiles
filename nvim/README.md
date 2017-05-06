### 结构

```
/Users/aioiyuuko/.configrc/nvim/
├── README.md
├── autoload
│   ├── plug.vim
│   └── configrc
│       ├── job.vim
│       └── modules.vim
├── init.vim
├── init.vim.new
├── repo
├── vim_modules
│   ├── autocomplete
│   └── lang
│       ├── init.vim
│       ├── package.vim
│       └── vim_modules
│           ├── html
│           ├── javascript
│           │   ├── init.vim
│           │   └── package.vim
│           ├── markdown
│           │   ├── init.vim
│           │   └── package.vim
│           └── vim
│               ├── init.vim
│               └── package.vim
└── viml
```

### 管理

1. 配置文件
1. 管理插件

### 配置

1. vim_modules 主目录
1. packageName/init.vim packageName/package.vim
> init.vim 对 package.vim 进行配置
> 默认加载 vim_modules 下面的所有 package
> package.vim 配置忽略的 vim_modules 和 依赖的plugin

### 插件管理

1. 与 vim_modules 主目录同级的 plugins 目录
1. 目录结构 userName/pluginName
