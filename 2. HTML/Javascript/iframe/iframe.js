// 送信後ほかのリダイレクトしない対策
function submit2iFrame(formName) {
	var iframeName = formName + '_iFrm'
	var form = document.getElementsByName(formName)[0]
	form.target = iframeName
	if (!(document.getElementsByName(iframeName))[0]) {
		var iframe = document.createElement('iframe')
		iframe.src = form.action
		iframe.style.display = 'none'
		iframe.title = 'iframe_title'
		iframe.name = iframeName
		document.body.appendChild(iframe)
	}
	form.submit()
}
// edgeで一回クリック事件に送信一回のみの制限を回避する対策
function new_iframeLoad(func) {
	var iframe = document.createElement('iframe');
	iframe.style.display = 'none';
	iframe.title = 'iframe_title';
	iframe.addEventListener("load", func);
	document.body.appendChild(iframe);
}
function IsIE() {
	if (window.navigator.userAgent.indexOf('MSIE') > 0) {
		return true
	} return false
}
