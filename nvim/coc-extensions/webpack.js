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
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var coc_nvim_1 = __webpack_require__(1);
var path_1 = __importDefault(__webpack_require__(2));
var patternWebpack = /ERROR\sin\s(?<filename>\S+)\s(?<line>\d+):(?<col>\d+)/;
var errorPattern = /ERROR\sin\s(?<filename>[^(]+)\((?<line>\d+),(?<col>\d+)\)/;
function activate(context) {
    var _this = this;
    var nvim = coc_nvim_1.workspace.nvim;
    var statusItem = coc_nvim_1.workspace.createStatusBarItem(1, { progress: true });
    var task = coc_nvim_1.workspace.createTask('WEBPACK');
    var cwd;
    function check() {
        return __awaiter(this, void 0, void 0, function () {
            var running;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, task.running];
                    case 1:
                        running = _a.sent();
                        if (running) {
                            statusItem.isProgress = false;
                            statusItem.text = '?';
                            statusItem.show();
                        }
                        else {
                            statusItem.hide();
                        }
                        return [2 /*return*/];
                }
            });
        });
    }
    check().catch(function (_e) {
        // noop
    });
    task.onExit(function (code) {
        if (code !== 0) {
            coc_nvim_1.workspace.showMessage("Webpack exit with code " + code, 'warning');
        }
        statusItem.hide();
    });
    task.onStdout(function (lines) {
        var i = 0;
        var items = [];
        for (var _i = 0, lines_1 = lines; _i < lines_1.length; _i++) {
            var line = lines_1[_i];
            if (line.indexOf('ERROR') !== -1) {
                var res = patternWebpack.exec(line);
                if (res == null) {
                    res = errorPattern.exec(line);
                }
                if (res != null) {
                    var filename = res.groups.filename;
                    if (!path_1.default.isAbsolute(filename)) {
                        filename = path_1.default.join(cwd, filename);
                    }
                    items.push({
                        filename: filename,
                        lnum: parseInt(res.groups.line),
                        col: parseInt(res.groups.col),
                        text: lines[i + 1].trim(),
                        type: 'E'
                    });
                }
            }
            i++;
        }
        nvim.call('setqflist', [items], true);
        statusItem.text = items.length === 0 ? '✓' : '✗';
        statusItem.isProgress = false;
    });
    task.onStderr(function (lines) {
        for (var _i = 0, lines_2 = lines; _i < lines_2.length; _i++) {
            var line = lines_2[_i];
            if (line.match(/webpack\sis\swatching/)) {
                statusItem.text = 'watching';
            }
        }
    });
    context.subscriptions.push(coc_nvim_1.Disposable.create(function () {
        task.dispose();
    }));
    context.subscriptions.push(coc_nvim_1.commands.registerCommand('webpack.watch', function () { return __awaiter(_this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            cwd = coc_nvim_1.workspace.cwd;
            task.start({
                cmd: './node_modules/.bin/webpack',
                args: ['--watch', '--no-color'],
                cwd: coc_nvim_1.workspace.cwd
            });
            statusItem.show();
            return [2 /*return*/];
        });
    }); }));
}
exports.activate = activate;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

module.exports = require("coc.nvim");

/***/ }),
/* 2 */
/***/ (function(module, exports) {

module.exports = require("path");

/***/ })
/******/ ])));