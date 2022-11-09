/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ([
/* 0 */
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
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.activate = void 0;
var coc_nvim_1 = __webpack_require__(1);
function activate(context) {
    var _this = this;
    var nvim = coc_nvim_1.workspace.nvim;
    var terminal;
    context.subscriptions.push(coc_nvim_1.commands.registerCommand('repl.openTerminal', function () { return __awaiter(_this, void 0, void 0, function () {
        var filetype, prog;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, nvim.eval('&filetype')];
                case 1:
                    filetype = _a.sent();
                    prog = '';
                    if (filetype === 'javascript') {
                        prog = 'node';
                    }
                    else if (filetype === 'typescript') {
                        prog = 'ts-node';
                    }
                    else if (filetype === 'python') {
                        prog = 'python';
                    }
                    return [4 /*yield*/, coc_nvim_1.window.createTerminal({
                            name: prog || 'terminal'
                        })];
                case 2:
                    terminal = _a.sent();
                    if (prog) {
                        terminal.sendText(prog, true);
                    }
                    return [2 /*return*/];
            }
        });
    }); }));
    context.subscriptions.push(coc_nvim_1.commands.registerCommand('repl.showTerminal', function () { return __awaiter(_this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            if (terminal) {
                terminal.show();
            }
            return [2 /*return*/];
        });
    }); }));
    context.subscriptions.push(coc_nvim_1.commands.registerCommand('repl.disposeTerminal', function () { return __awaiter(_this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            if (terminal) {
                terminal.dispose();
            }
            return [2 /*return*/];
        });
    }); }));
    context.subscriptions.push(coc_nvim_1.workspace.registerKeymap(['x'], 'repl-sendtext', function () { return __awaiter(_this, void 0, void 0, function () {
        var doc, visualmode, range, text;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, nvim.call('eval', 'feedkeys("\\<esc>", "in")')];
                case 1:
                    _a.sent();
                    doc = coc_nvim_1.workspace.getDocument(coc_nvim_1.workspace.bufnr);
                    if (!doc)
                        return [2 /*return*/];
                    return [4 /*yield*/, nvim.call('visualmode')];
                case 2:
                    visualmode = _a.sent();
                    return [4 /*yield*/, coc_nvim_1.window.getSelectedRange(visualmode)];
                case 3:
                    range = _a.sent();
                    if (!range)
                        return [2 /*return*/];
                    text = doc.textDocument.getText(range);
                    if (text && terminal)
                        terminal.sendText(text, true);
                    return [2 /*return*/];
            }
        });
    }); }, { sync: false, silent: true }));
}
exports.activate = activate;


/***/ }),
/* 1 */
/***/ ((module) => {

module.exports = require("coc.nvim");

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
/******/ 	var __webpack_exports__ = __webpack_require__(0);
/******/ 	var __webpack_export_target__ = exports;
/******/ 	for(var i in __webpack_exports__) __webpack_export_target__[i] = __webpack_exports__[i];
/******/ 	if(__webpack_exports__.__esModule) Object.defineProperty(__webpack_export_target__, "__esModule", { value: true });
/******/ 	
/******/ })()
;