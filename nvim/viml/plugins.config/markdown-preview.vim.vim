if has('mac')
    let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
elseif has('unix')
    let g:mkdp_path_to_chrome = "google-chrome"
endif
