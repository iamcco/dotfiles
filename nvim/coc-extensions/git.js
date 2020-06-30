(function(e, a) { for(var i in a) e[i] = a[i]; }(exports, /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */,
/* 1 */
/***/ (function(module, exports) {

module.exports = require("coc.nvim");

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var coc_nvim_1 = __webpack_require__(1);
var commit_1 = __webpack_require__(3);
var push_1 = __webpack_require__(6);
var GIT_EXTENSION = 'coc-git';
function activate(context) {
    return __awaiter(this, void 0, void 0, function () {
        var gitExt, gitApi;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    gitExt = coc_nvim_1.extensions.getExtension(GIT_EXTENSION);
                    if (!gitExt) {
                        return [2 /*return*/, coc_nvim_1.workspace.showMessage(GIT_EXTENSION + " required!")];
                    }
                    return [4 /*yield*/, gitExt.extension.activate()];
                case 1:
                    gitApi = _a.sent();
                    if (!gitApi) {
                        return [2 /*return*/, coc_nvim_1.workspace.showMessage("Ensure " + GIT_EXTENSION + " is working!")];
                    }
                    commit_1.activate(context, gitApi);
                    push_1.activate(context, gitApi);
                    return [2 /*return*/];
            }
        });
    });
}
exports.activate = activate;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var coc_nvim_1 = __webpack_require__(1);
var path_1 = __webpack_require__(4);
var fs_1 = __webpack_require__(5);
var GIT_COMMIT = 'git.commit';
function activate(context, gitApi) {
    return __awaiter(this, void 0, void 0, function () {
        var subscription, sub;
        var _this = this;
        return __generator(this, function (_a) {
            subscription = [];
            sub = coc_nvim_1.Disposable.create(function () {
                if (subscription && subscription.length) {
                    subscription.forEach(function (item) {
                        item.dispose();
                    });
                    subscription = [];
                }
            });
            context.subscriptions.push(sub);
            coc_nvim_1.commands.titles.set(GIT_COMMIT, 'Git commit');
            context.subscriptions.push(coc_nvim_1.Disposable.create(function () {
                coc_nvim_1.commands.titles.delete(GIT_COMMIT);
            }));
            context.subscriptions.push(coc_nvim_1.commands.registerCommand(GIT_COMMIT, function () {
                var args = [];
                for (var _i = 0; _i < arguments.length; _i++) {
                    args[_i] = arguments[_i];
                }
                return __awaiter(_this, void 0, void 0, function () {
                    var nvim, doc, repo, _a, conflicted, staged, gitDiff, gitStatus, commitEditMsg, commitTab, tabNumber;
                    var _this = this;
                    return __generator(this, function (_b) {
                        switch (_b.label) {
                            case 0:
                                nvim = coc_nvim_1.workspace.nvim;
                                return [4 /*yield*/, coc_nvim_1.workspace.document];
                            case 1:
                                doc = _b.sent();
                                return [4 /*yield*/, gitApi.manager.getRepo(doc.bufnr)];
                            case 2:
                                repo = _b.sent();
                                return [4 /*yield*/, repo.getStaged()];
                            case 3:
                                _a = _b.sent(), conflicted = _a[0], staged = _a[1];
                                if (conflicted !== 0) {
                                    return [2 /*return*/, coc_nvim_1.workspace.showMessage('Please resolve Conflict first!')];
                                }
                                if (staged === 0) {
                                    return [2 /*return*/, coc_nvim_1.workspace.showMessage('Nothing to commit!')];
                                }
                                return [4 /*yield*/, repo.exec(['--no-pager', 'diff', '--cached'])
                                    // get current git status
                                ];
                            case 4:
                                gitDiff = _b.sent();
                                if (!(args.indexOf('--amend') !== -1)) return [3 /*break*/, 6];
                                return [4 /*yield*/, repo.exec(['--no-pager', 'show', 'head', '--no-color', '--name-status'])];
                            case 5:
                                gitStatus = _b.sent();
                                return [3 /*break*/, 8];
                            case 6: return [4 /*yield*/, repo.exec(['--no-pager', 'status'])];
                            case 7:
                                gitStatus = _b.sent();
                                _b.label = 8;
                            case 8:
                                nvim.pauseNotification();
                                // open new tab
                                nvim.command('tabnew', true);
                                // create diff buffer
                                nvim.command("edit +setl\\ buftype=nofile git://diff", true);
                                nvim.command('setl foldmethod=syntax nobuflisted noswapfile bufhidden=wipe', true);
                                nvim.command('setf git', true);
                                nvim.call('append', [0, gitDiff.stdout.split('\n').slice(0, -1)], true);
                                nvim.command('normal! zi', true);
                                nvim.command("exe 1", true);
                                // create commit buffer
                                nvim.command("vsplit git://commit", true);
                                nvim.command('setl nobuflisted noswapfile bufhidden=wipe', true);
                                nvim.command('setf gitcommit', true);
                                nvim.call('append', [1, gitStatus.stdout.split('\n').map(function (line) { return "# " + line; }).slice(0, -1)], true);
                                nvim.command("exe 1", true);
                                nvim.command("startinsert", true);
                                nvim.command("setl nomodified", true);
                                return [4 /*yield*/, nvim.resumeNotification(false, false)
                                    // update commit
                                ];
                            case 9:
                                _b.sent();
                                commitEditMsg = path_1.join(repo.root, '.git', 'COMMIT_EDITMSG');
                                fs_1.writeFileSync(commitEditMsg, [''].concat(gitStatus.stdout.split('\n').map(function (line) { return "# " + line; })).slice(0, -1).join('\n'));
                                return [4 /*yield*/, nvim.tabpage];
                            case 10:
                                commitTab = _b.sent();
                                return [4 /*yield*/, commitTab.number];
                            case 11:
                                tabNumber = _b.sent();
                                subscription.push(coc_nvim_1.workspace.registerAutocmd({
                                    event: 'WinClosed <buffer>',
                                    pattern: '',
                                    request: false,
                                    callback: function () { return __awaiter(_this, void 0, void 0, function () {
                                        var curTab, curTabNUmber, windows, error_1, commitEditMsg, commitMsg, statusItem, commitRes, error_2;
                                        return __generator(this, function (_a) {
                                            switch (_a.label) {
                                                case 0:
                                                    // unregister autocmd
                                                    sub.dispose();
                                                    _a.label = 1;
                                                case 1:
                                                    _a.trys.push([1, 7, , 8]);
                                                    return [4 /*yield*/, nvim.tabpage];
                                                case 2:
                                                    curTab = _a.sent();
                                                    return [4 /*yield*/, curTab.number];
                                                case 3:
                                                    curTabNUmber = _a.sent();
                                                    if (!(tabNumber === curTabNUmber)) return [3 /*break*/, 6];
                                                    return [4 /*yield*/, curTab.windows];
                                                case 4:
                                                    windows = _a.sent();
                                                    if (!(windows.length >= 1)) return [3 /*break*/, 6];
                                                    return [4 /*yield*/, nvim.command('tabclose')];
                                                case 5:
                                                    _a.sent();
                                                    _a.label = 6;
                                                case 6: return [3 /*break*/, 8];
                                                case 7:
                                                    error_1 = _a.sent();
                                                    return [3 /*break*/, 8];
                                                case 8:
                                                    commitEditMsg = path_1.join(repo.root, '.git', 'COMMIT_EDITMSG');
                                                    if (!fs_1.existsSync(commitEditMsg)) {
                                                        return [2 /*return*/];
                                                    }
                                                    commitMsg = fs_1.readFileSync(commitEditMsg)
                                                        .toString()
                                                        .split('\n')
                                                        .filter(function (line) { return !line.startsWith('#'); })
                                                        .join('\n');
                                                    if (!(commitMsg.trim() !== '')) return [3 /*break*/, 13];
                                                    statusItem = coc_nvim_1.workspace.createStatusBarItem(0, { progress: true });
                                                    subscription.push(statusItem);
                                                    statusItem.text = 'commit';
                                                    statusItem.show();
                                                    _a.label = 9;
                                                case 9:
                                                    _a.trys.push([9, 11, 12, 13]);
                                                    return [4 /*yield*/, repo.exec(['commit'].concat(args, ['-F', '-']), {
                                                            input: commitMsg
                                                        })];
                                                case 10:
                                                    commitRes = _a.sent();
                                                    if (commitRes.exitCode !== 0) {
                                                        coc_nvim_1.workspace.showMessage(commitRes.stderr, 'error');
                                                    }
                                                    else {
                                                        coc_nvim_1.workspace.showMessage(commitRes.stdout.split('\n')[0]);
                                                    }
                                                    return [3 /*break*/, 13];
                                                case 11:
                                                    error_2 = _a.sent();
                                                    coc_nvim_1.workspace.showMessage("Commit fail: " + (error_2.message || error_2), 'error');
                                                    return [3 /*break*/, 13];
                                                case 12:
                                                    statusItem.hide();
                                                    statusItem.dispose();
                                                    return [7 /*endfinally*/];
                                                case 13: return [2 /*return*/];
                                            }
                                        });
                                    }); }
                                }), coc_nvim_1.workspace.registerAutocmd({
                                    event: 'BufWriteCmd <buffer>',
                                    pattern: '',
                                    request: true,
                                    callback: function () { return __awaiter(_this, void 0, void 0, function () {
                                        var buf, lines, commitEditMsg;
                                        return __generator(this, function (_a) {
                                            switch (_a.label) {
                                                case 0: 
                                                // set buffer nomodified
                                                return [4 /*yield*/, nvim.command('setl nomodified')];
                                                case 1:
                                                    // set buffer nomodified
                                                    _a.sent();
                                                    return [4 /*yield*/, nvim.buffer
                                                        // save commit message to repo/.git/COMMIT_EDITMSG
                                                    ];
                                                case 2:
                                                    buf = _a.sent();
                                                    return [4 /*yield*/, buf.getLines({ start: 0, end: -1, strictIndexing: true })];
                                                case 3:
                                                    lines = _a.sent();
                                                    commitEditMsg = path_1.join(repo.root, '.git', 'COMMIT_EDITMSG');
                                                    fs_1.writeFileSync(commitEditMsg, lines.join('\n'));
                                                    return [2 /*return*/];
                                            }
                                        });
                                    }); }
                                }));
                                return [2 /*return*/];
                        }
                    });
                });
            }));
            return [2 /*return*/];
        });
    });
}
exports.activate = activate;


/***/ }),
/* 4 */
/***/ (function(module, exports) {

module.exports = require("path");

/***/ }),
/* 5 */
/***/ (function(module, exports) {

module.exports = require("fs");

/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var coc_nvim_1 = __webpack_require__(1);
var GIT_PUSH = 'git.push';
function activate(context, gitApi) {
    return __awaiter(this, void 0, void 0, function () {
        var statusItem;
        var _this = this;
        return __generator(this, function (_a) {
            coc_nvim_1.commands.titles.set(GIT_PUSH, 'Git push');
            context.subscriptions.push(coc_nvim_1.Disposable.create(function () {
                coc_nvim_1.commands.titles.delete(GIT_PUSH);
                if (statusItem) {
                    statusItem.dispose();
                }
            }), coc_nvim_1.commands.registerCommand(GIT_PUSH, function () {
                var args = [];
                for (var _i = 0; _i < arguments.length; _i++) {
                    args[_i] = arguments[_i];
                }
                return __awaiter(_this, void 0, void 0, function () {
                    var nvim, buf, repo, pushRes, head_1, origins_1, remoteBranches, res, error_1;
                    return __generator(this, function (_a) {
                        switch (_a.label) {
                            case 0:
                                nvim = coc_nvim_1.workspace.nvim;
                                return [4 /*yield*/, nvim.buffer];
                            case 1:
                                buf = _a.sent();
                                if (!buf) {
                                    return [2 /*return*/];
                                }
                                return [4 /*yield*/, gitApi.manager.getRepo()];
                            case 2:
                                repo = _a.sent();
                                if (!repo) {
                                    return [2 /*return*/];
                                }
                                statusItem = coc_nvim_1.workspace.createStatusBarItem(0, { progress: true });
                                statusItem.text = 'push';
                                statusItem.show();
                                _a.label = 3;
                            case 3:
                                _a.trys.push([3, 13, 14, 15]);
                                pushRes = void 0;
                                return [4 /*yield*/, repo.getHEAD()];
                            case 4:
                                head_1 = _a.sent();
                                return [4 /*yield*/, repo.exec(['remote', 'show'])];
                            case 5:
                                origins_1 = (_a.sent()).stdout.trim().split('\n');
                                return [4 /*yield*/, repo.exec(['branch', '-r', '--no-color'])];
                            case 6:
                                remoteBranches = (_a.sent()).stdout.trim().split('\n');
                                if (!remoteBranches.some(function (branch) {
                                    return origins_1.some(function (origin) { return branch.trim() === origin + "/" + head_1; });
                                })) return [3 /*break*/, 8];
                                return [4 /*yield*/, repo.exec(['push'].concat(args))];
                            case 7:
                                pushRes = _a.sent();
                                return [3 /*break*/, 12];
                            case 8: return [4 /*yield*/, coc_nvim_1.workspace.requestInput("git push --set-upstream " + origins_1[0] + " " + head_1 + " y/n")];
                            case 9:
                                res = _a.sent();
                                if (!(res && res.toLowerCase() === 'y')) return [3 /*break*/, 11];
                                return [4 /*yield*/, repo.exec(['push', '--set-upstream', origins_1[0], head_1])];
                            case 10:
                                pushRes = _a.sent();
                                return [3 /*break*/, 12];
                            case 11:
                                coc_nvim_1.workspace.showMessage('Push cancelled');
                                _a.label = 12;
                            case 12:
                                if (pushRes && pushRes.exitCode === 0) {
                                    coc_nvim_1.workspace.showMessage("Git push success");
                                }
                                return [3 /*break*/, 15];
                            case 13:
                                error_1 = _a.sent();
                                coc_nvim_1.workspace.showMessage("Git push fail: " + (error_1.message || error_1));
                                return [3 /*break*/, 15];
                            case 14:
                                statusItem.hide();
                                statusItem.dispose();
                                statusItem = undefined;
                                return [7 /*endfinally*/];
                            case 15: return [2 /*return*/];
                        }
                    });
                });
            }));
            return [2 /*return*/];
        });
    });
}
exports.activate = activate;


/***/ })
/******/ ])));