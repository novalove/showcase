<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div id="col1">
  <div id="col1_content" class="clearfix">
    <ul>
      <li><s:url id="urltabslocal" action="tabs-local"/><sj:a id="tabslocallink" href="%{urltabslocal}" targets="main">Local Tabs</sj:a></li>
      <li><s:url id="urltabs" action="tabs"/><sj:a id="tabslocalremote" href="%{urltabs}" targets="main">Remote Tabs with Topics</sj:a></li>
      <li><s:url id="urltabspreselect" action="tabs-preselect"/><sj:a id="tabspreselectedlink" href="%{urltabspreselect}" targets="main">Preselectet Tabs with Animation</sj:a></li>
    </ul>
  </div>
</div>
<div id="col3">
  <div id="col3_content" class="clearfix">
    <h2>Remote Tabs</h2>
    <p class="text">
        A simple TabbedPanel with AJAX Content with two disabled Tabs and Topics.
    </p>
    
    <div id="changepanel"></div>
    <div id="infopanel"></div>
    
    <s:url id="remoteurl1" action="ajax1"/>
    <s:url id="remoteurl2" action="ajax2"/>
    <s:url id="remoteurl3" action="ajax3"/>
    <s:url id="remoteurl4" action="ajax4"/>
    <sj:tabbedpanel 
    	id="remotetabs" 
    	spinner="Please wait ..." 
    	disabledTabs="[3,4]" 
    	onCompleteTopics="tabcomplete" 
    	onChangeTopics="tabchange"
    >
      <sj:tab id="tab1" href="%{remoteurl1}" label="Tab One" />
      <sj:tab id="tab2" href="%{remoteurl2}" label="Tab Two"/>
      <sj:tab id="tab3" href="%{remoteurl3}" label="Tab Three"/>
      <sj:tab id="tab4" href="%{remoteurl4}" label="Tab Four"/>
      <sj:tab id="tab5" href="%{remoteurl1}" label="Tab Five"/>
    </sj:tabbedpanel>
  </div>
  
  <div class="code ui-widget-content ui-corner-all">
      <strong>JavaScript functions:</strong>
      <pre>
    $.subscribe('tabchange', function(event,data) {

        var tab = event.originalEvent.ui.index;
        $('#changepanel').html('Change to Tab &lt;strong&gt;'+tab+'.&lt;/strong&gt;');
        $('#infopanel').html('');
        if(tab == 2) {
        	$('#remotetabs').tabs( 'enable' , 3 );
        }
        else if(tab == 3) {
        	$('#remotetabs').tabs( 'enable' , 4 );
        }
    });
    $.subscribe('tabcomplete', function(event,ui) {
        $('#infopanel').html('&lt;strong&gt;Completed request with Status '+event.originalEvent.status+ '.&lt;/strong&gt;&lt;br/&gt;Status: '+event.originalEvent.request.status);
    });
      </pre>
    <strong>Code:</strong>
    <pre>
    &lt;div id=&quot;changepanel&quot;&gt;&lt;/div&gt;
    &lt;div id=&quot;infopanel&quot;&gt;&lt;/div&gt;
    
    &lt;s:url id=&quot;remoteurl1&quot; action=&quot;ajax1&quot;/&gt;
    &lt;s:url id=&quot;remoteurl2&quot; action=&quot;ajax2&quot;/&gt;
    &lt;s:url id=&quot;remoteurl3&quot; action=&quot;ajax3&quot;/&gt;
    &lt;s:url id=&quot;remoteurl4&quot; action=&quot;ajax4&quot;/&gt;
    &lt;sj:tabbedpanel 
    	id=&quot;remotetabs&quot; 
    	spinner=&quot;Please wait ...&quot; 
    	disabledTabs=&quot;[3,4]&quot; 
    	onCompleteTopics=&quot;tabcomplete&quot; 
    	onChangeTopics=&quot;tabchange&quot;
    &gt;
      &lt;sj:tab id=&quot;tab1&quot; href=&quot;%{remoteurl1}&quot; label=&quot;Tab One&quot; /&gt;
      &lt;sj:tab id=&quot;tab2&quot; href=&quot;%{remoteurl2}&quot; label=&quot;Tab Two&quot;/&gt;
      &lt;sj:tab id=&quot;tab3&quot; href=&quot;%{remoteurl3}&quot; label=&quot;Tab Three&quot;/&gt;
      &lt;sj:tab id=&quot;tab4&quot; href=&quot;%{remoteurl4}&quot; label=&quot;Tab Four&quot;/&gt;
      &lt;sj:tab id=&quot;tab5&quot; href=&quot;%{remoteurl1}&quot; label=&quot;Tab Five&quot;/&gt;
    &lt;/sj:tabbedpanel&gt;
    </pre>
  </div>
  <!-- IE Column Clearing -->
  <div id="ie_clearing"> &#160; </div>
</div>
