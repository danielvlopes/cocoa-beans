$(function(){
  $("body").prepend("<h1>Webkit support</h1>");
  
  // to call a Cocoa method, you need to replace the
  // : from the method signature by an underscore.
  // in Cocoa you call [self addContent:@"some text"];
  // in Javascript you call window.app.addContent_(arguments);
  window.app.addContent_();
  window.app.addContent_("Using custom message!");
  window.app.addContent_(1);
});

moreContent = function() {
	$("body").append("<p>This content was added by Javascript, but called from Cocoa!</p>");
}