function fireEvent_fix(element, eventName){
	eventName.replace("^on", "")
	var event = document.createEvent("HTMLEvents");
	event.initEvent(eventName,true,false);
  element.dispatchEvent(event);
}
