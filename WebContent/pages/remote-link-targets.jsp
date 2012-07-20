<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div id="col1">
  <div id="col1_content" class="clearfix">
    <ul>
      <li><s:url id="urlremotelink" action="remote-link"/><sj:a id="remotesimplelink" href="%{urlremotelink}" targets="main">Remote Link</sj:a></li>
      <li><s:url id="urlremotelinktargets" action="remote-link-targets"/><sj:a id="remotetargetslink" href="%{urlremotelinktargets}" targets="main">Remote Link with 2 Targets</sj:a></li>
      <li><s:url id="urlremotelinkform" action="remote-link-form"/><sj:a id="remoteformlink" href="%{urlremotelinkform}" targets="main">Remote Link with Form submit</sj:a></li>
      <li><s:url id="urlremotelinkevent" action="remote-link-event"/><sj:a id="remoteeventlink" href="%{urlremotelinkevent}" targets="main">Remote Link with Event</sj:a></li>
      <li><s:url id="urlremotelinkhighlight" action="remote-link-highlight"/><sj:a id="remotehighlightlink" href="%{urlremotelinkhighlight}" targets="main">Remote Link Highlight Effect</sj:a></li>
      <li><s:url id="urlremotelinkbounce" action="remote-link-bounce"/><sj:a id="remotebouncelink" href="%{urlremotelinkbounce}" targets="main">Remote Link Bounce Effect</sj:a></li>
      <li><s:url id="urlremotelinkjson" action="remote-link-json"/><sj:a id="remotejsonlink" href="%{urlremotelinkjson}" targets="main">Remote Link with JSON Result</sj:a></li>
    </ul>
  </div>
</div>
<div id="col3">
  <div id="col3_content" class="clearfix">
	<h2>Remote Link with two Targets</h2>
	<p class="text">
	    A Remote Link that updates two targets.
	</p>
    <strong>Result Div 1 :</strong>
	<div id="result1" class="result ui-widget-content ui-corner-all">Click on the link bellow.</div>
    <strong>Result Div 2 :</strong>
    <div id="result2" class="result ui-widget-content ui-corner-all">Click on the link bellow.</div>
    
	<s:url id="ajax" value="/ajax3.action"/>
    <sj:a 
    	id="ajaxlink" 
    	href="%{ajax}" 
    	targets="result1,result2" 
    	button="true" 
		buttonIcon="ui-icon-gear"
		buttonText="false"
    >
      Run AJAX Action
    </sj:a>
    
	<div class="code ui-widget-content ui-corner-all">
	  <strong>Code:</strong>
	  <pre>
    &lt;strong&gt;Result Div 1 :&lt;/strong&gt;
	&lt;div id=&quot;result1&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Click on the link bellow.&lt;/div&gt;
    &lt;strong&gt;Result Div 2 :&lt;/strong&gt;
    &lt;div id=&quot;result2&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Click on the link bellow.&lt;/div&gt;
    
	&lt;s:url id=&quot;ajax&quot; value=&quot;/ajax3.action&quot;/&gt;
    &lt;sj:a 
    	id=&quot;ajaxlink&quot; 
    	href=&quot;%{ajax}&quot; 
    	targets=&quot;result1,result2&quot; 
    	button=&quot;true&quot; 
		buttonIcon=&quot;ui-icon-gear&quot;
		buttonText=&quot;false&quot;
    &gt;
      Run AJAX Action
    &lt;/sj:a&gt;
	  </pre>
	</div>
  </div>
  <!-- IE Column Clearing -->
  <div id="ie_clearing"> &#160; </div>
</div>