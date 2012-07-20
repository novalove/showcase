<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div id="col1">
  <div id="col1_content" class="clearfix">
    <ul>
      <li><s:url id="urldialog" action="dialog"/><sj:a href="%{urldialog}" targets="main">Dialog</sj:a></li>
      <li><s:url id="urldialogclick" action="dialog-click"/><sj:a href="%{urldialogclick}" targets="main">Dialog open on Click</sj:a></li>
      <li><s:url id="urldialogremote" action="dialog-remote"/><sj:a href="%{urldialogremote}" targets="main">Remote Dialog</sj:a></li>
      <li><s:url id="urldialogremotelink" action="dialog-remote-link"/><sj:a href="%{urldialogremotelink}" targets="main">Remote Dialogs</sj:a></li>
      <li><s:url id="urldialogmodal" action="dialog-modal"/><sj:a href="%{urldialogmodal}" targets="main">Modal Dialog</sj:a></li>
      <li><s:url id="urldialogbuttons" action="dialog-buttons"/><sj:a href="%{urldialogbuttons}" targets="main">Dialog with Buttons</sj:a></li>
      <li><s:url id="urldialogeffect" action="dialog-effect"/><sj:a href="%{urldialogeffect}" targets="main">Dialog with Effect</sj:a></li>
      <li><s:url id="urldialogtopics" action="dialog-topics"/><sj:a href="%{urldialogtopics}" targets="main">Dialog with Topics</sj:a></li>
    </ul>
  </div>
</div>
<div id="col3">
  <div id="col3_content" class="clearfix">
    <h2>Dialog with Topics</h2>
    <p class="text">
        A modal Dialog with different topics.
    </p>
    <sj:dialog 
    	id="mytopicdialog" 
    	openTopics="openTopicDialog"
    	onOpenTopics="dialogopentopic" 
    	onCloseTopics="dialogclosetopic" 
    	onBeforeCloseTopics="dialogbeforeclosetopic" 
    	autoOpen="false" 
    	modal="true" 
    	title="Topics Dialog">
    	Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
    </sj:dialog>
    <sj:a id="opentopicdialoglink"
    	onClickTopics="openTopicDialog" 
    	cssClass="buttonlink ui-state-default ui-corner-all"
    	button="true"
    	buttonIcon="ui-icon-newwin"
    >
    	Open modal dialog
    </sj:a>
  <br/><br/>
    <sj:tabbedpanel id="showdialogcode">
      <sj:tab id="tab1" target="jsp" label="JSP Code"/>
      <sj:tab id="tab2" target="javascript" label="JavaScript Code"/>
      <div id="jsp">
	  <pre>
    &lt;sj:dialog 
    	id=&quot;mytopicdialog&quot; 
    	openTopics=&quot;openTopicDialog&quot;
    	onOpenTopics=&quot;dialogopentopic&quot; 
    	onCloseTopics=&quot;dialogclosetopic&quot; 
    	onBeforeCloseTopics=&quot;dialogbeforeclosetopic&quot; 
    	autoOpen=&quot;false&quot; 
    	modal=&quot;true&quot; 
    	title=&quot;Topics Dialog&quot;&gt;
    	Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
    &lt;/sj:dialog&gt;
    &lt;sj:a id=&quot;opentopicdialoglink&quot;
    	onClickTopics=&quot;openTopicDialog&quot; 
    	cssClass=&quot;buttonlink ui-state-default ui-corner-all&quot;
    	button=&quot;true&quot;
    	buttonIcon=&quot;ui-icon-newwin&quot;
    &gt;
    	Open modal dialog
    &lt;/sj:a&gt;
    	  </pre>
	  </div>
      <div id="javascript">
	  <pre>
    &lt;script type=&quot;text/javascript&quot;&gt;
    $(document).ready(function() {
		$.subscribe('dialogopentopic', function(event,ui) {
	        alert('run topic on dialog open');
		});
		$.subscribe('dialogclosetopic', function(event,ui) {
	        alert('run topic on dialog close');
		});
		$.subscribe('dialogbeforeclosetopic', function(event,ui) {
	        alert('run topic befor dialog close');
		});
    });
    &lt;/script&gt;        
	  </pre>
	  </div>
    </sj:tabbedpanel>
  <!-- IE Column Clearing -->
  <div id="ie_clearing"> &#160; </div>
</div>
