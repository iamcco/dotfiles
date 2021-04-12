/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ([
/* 0 */,
/* 1 */
/***/ ((module) => {

module.exports = require("coc.nvim");;

/***/ }),
/* 2 */
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
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
var _a = __webpack_require__(1), Uri = _a.Uri, commands = _a.commands, workspace = _a.workspace, window = _a.window, Mutex = _a.Mutex;
var path = __webpack_require__(3);
var programMap = {
    javascript: 'node',
    typescript: 'ts-node',
    python: 'python',
    lua: 'lua'
};
var global_id = 0;
exports.activate = function (context) { return __awaiter(void 0, void 0, void 0, function () {
    var nvim, cwd, taskMap, statusItem, executeFile, execute;
    return __generator(this, function (_a) {
        nvim = workspace.nvim, cwd = workspace.cwd;
        taskMap = new Map();
        statusItem = window.createStatusBarItem(0, { progress: true });
        context.subscriptions.push(statusItem);
        executeFile = function (doc, create) { return __awaiter(void 0, void 0, void 0, function () {
            var uri, relPath, bufname, task, winnr, bufId, buf, t, cmd, succeed, empty, appendLines, mutex;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        uri = doc.uri;
                        relPath = path.relative(cwd, Uri.parse(uri).fsPath);
                        bufname = "__coc_execute_" + doc.bufnr + "__";
                        task = taskMap.get(doc.bufnr);
                        if (task) {
                            task.dispose();
                            taskMap.delete(doc.bufnr);
                        }
                        statusItem.hide();
                        return [4 /*yield*/, nvim.call('bufwinnr', [bufname])];
                    case 1:
                        winnr = _a.sent();
                        if (winnr == -1 && !create)
                            return [2 /*return*/];
                        if (!(winnr == -1)) return [3 /*break*/, 6];
                        return [4 /*yield*/, nvim.command("belowright vs " + bufname)];
                    case 2:
                        _a.sent();
                        nvim.pauseNotification();
                        nvim.command("setl buftype=nofile");
                        nvim.command("setl conceallevel=0");
                        nvim.command("setl norelativenumber");
                        return [4 /*yield*/, nvim.resumeNotification()];
                    case 3:
                        _a.sent();
                        return [4 /*yield*/, nvim.call('winnr', [])];
                    case 4:
                        winnr = _a.sent();
                        return [4 /*yield*/, nvim.command('wincmd p')];
                    case 5:
                        _a.sent();
                        return [3 /*break*/, 8];
                    case 6: 
                    // clear buffer
                    return [4 /*yield*/, nvim.command("silent call deletebufline('" + bufname + "', 1, '$')")];
                    case 7:
                        // clear buffer
                        _a.sent();
                        _a.label = 8;
                    case 8: return [4 /*yield*/, nvim.call('bufnr', [bufname])];
                    case 9:
                        bufId = _a.sent();
                        buf = nvim.createBuffer(bufId);
                        t = workspace.createTask("execute-" + global_id);
                        global_id = global_id + 1;
                        cmd = programMap[doc.filetype];
                        return [4 /*yield*/, t.start({ cwd: cwd, cmd: cmd, args: [relPath] })];
                    case 10:
                        succeed = _a.sent();
                        if (!succeed) {
                            window.showErrorMessage("Command failed to start: " + cmd + " " + relPath);
                            return [2 /*return*/];
                        }
                        statusItem.text = cmd + " " + relPath;
                        statusItem.show();
                        taskMap.set(doc.bufnr, t);
                        t.onExit(function (code) {
                            statusItem.hide();
                            taskMap.delete(doc.bufnr);
                            if (code != 0) {
                                window.showErrorMessage(cmd + " exit with code: " + code);
                            }
                        });
                        empty = true;
                        appendLines = function (lines) { return __awaiter(void 0, void 0, void 0, function () {
                            return __generator(this, function (_a) {
                                switch (_a.label) {
                                    case 0:
                                        if (!empty) return [3 /*break*/, 2];
                                        empty = false;
                                        return [4 /*yield*/, buf.setLines(lines, { start: 0, end: -1, strictIndexing: false })];
                                    case 1:
                                        _a.sent();
                                        return [3 /*break*/, 4];
                                    case 2: return [4 /*yield*/, nvim.call('appendbufline', [buf.id, '$', lines])];
                                    case 3:
                                        _a.sent();
                                        _a.label = 4;
                                    case 4: return [2 /*return*/];
                                }
                            });
                        }); };
                        mutex = new Mutex();
                        t.onStderr(function (lines) { return __awaiter(void 0, void 0, void 0, function () {
                            var replace, release, len, e_1;
                            return __generator(this, function (_a) {
                                switch (_a.label) {
                                    case 0:
                                        replace = empty;
                                        return [4 /*yield*/, mutex.acquire()];
                                    case 1:
                                        release = _a.sent();
                                        _a.label = 2;
                                    case 2:
                                        _a.trys.push([2, 6, , 7]);
                                        return [4 /*yield*/, buf.length];
                                    case 3:
                                        len = _a.sent();
                                        return [4 /*yield*/, appendLines(lines)];
                                    case 4:
                                        _a.sent();
                                        return [4 /*yield*/, buf.highlightRanges('coc-execute', 'WarningMsg', [{
                                                    start: { line: (replace ? len - 1 : len), character: 0 },
                                                    end: { line: len + lines.length, character: 0 }
                                                }])];
                                    case 5:
                                        _a.sent();
                                        if (workspace.isVim)
                                            nvim.command('redraw', true);
                                        return [3 /*break*/, 7];
                                    case 6:
                                        e_1 = _a.sent();
                                        window.showErrorMessage(e_1.message);
                                        return [3 /*break*/, 7];
                                    case 7:
                                        release();
                                        return [2 /*return*/];
                                }
                            });
                        }); });
                        t.onStdout(function (lines) { return __awaiter(void 0, void 0, void 0, function () {
                            var release, e_2;
                            return __generator(this, function (_a) {
                                switch (_a.label) {
                                    case 0: return [4 /*yield*/, mutex.acquire()];
                                    case 1:
                                        release = _a.sent();
                                        _a.label = 2;
                                    case 2:
                                        _a.trys.push([2, 4, , 5]);
                                        return [4 /*yield*/, appendLines(lines)];
                                    case 3:
                                        _a.sent();
                                        if (workspace.isVim)
                                            nvim.command('redraw', true);
                                        return [3 /*break*/, 5];
                                    case 4:
                                        e_2 = _a.sent();
                                        window.showErrorMessage(e_2.message);
                                        return [3 /*break*/, 5];
                                    case 5:
                                        release();
                                        return [2 /*return*/];
                                }
                            });
                        }); });
                        return [2 /*return*/];
                }
            });
        }); };
        execute = function () { return __awaiter(void 0, void 0, void 0, function () {
            var doc, program;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, workspace.document];
                    case 1:
                        doc = _a.sent();
                        program = programMap[doc.filetype];
                        if (!program) {
                            window.showErrorMessage("filetype not supported");
                            return [2 /*return*/];
                        }
                        return [4 /*yield*/, executeFile(doc, true)];
                    case 2:
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        }); };
        context.subscriptions.push(workspace.onDidSaveTextDocument(function (e) { return __awaiter(void 0, void 0, void 0, function () {
            var doc;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        doc = workspace.getDocument(e.uri);
                        return [4 /*yield*/, executeFile(doc, false)];
                    case 1:
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        }); }));
        context.subscriptions.push({
            dispose: function () {
                for (var _i = 0, _a = taskMap.values(); _i < _a.length; _i++) {
                    var task = _a[_i];
                    task.dispose();
                }
            }
        });
        context.subscriptions.push(commands.registerCommand('execute.currentFile', execute));
        return [2 /*return*/];
    });
}); };


/***/ }),
/* 3 */
/***/ ((module) => {

module.exports = require("path");;

/***/ })
/******/ 	]);
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module is referenced by other modules so it can't be inlined
/******/ 	var __webpack_exports__ = __webpack_require__(2);
/******/ 	var __webpack_export_target__ = exports;
/******/ 	for(var i in __webpack_exports__) __webpack_export_target__[i] = __webpack_exports__[i];
/******/ 	if(__webpack_exports__.__esModule) Object.defineProperty(__webpack_export_target__, "__esModule", { value: true });
/******/ 	
/******/ })()
;