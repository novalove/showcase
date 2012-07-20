<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div id="col1">
  <div id="col1_content" class="clearfix">
    <ul>
      <li><s:url id="urlaccordion" action="accordion"/><sj:a href="%{urlaccordion}" targets="main">Accordion</sj:a></li>
      <li><s:url id="urlaccordionlist" action="accordion-list"/><sj:a href="%{urlaccordionlist}" targets="main">Accordion from List</sj:a></li>
      <li><s:url id="urlaccordionremote" action="accordion-remote"/><sj:a href="%{urlaccordionremote}" targets="main">Accordion with remote content</sj:a></li>
      <li><s:url id="urlaccordionmouseover" action="accordion-mouseover"/><sj:a href="%{urlaccordionmouseover}" targets="main">Accordion Collabsible/MouseOver</sj:a></li>
    </ul>
  </div>
</div>
<div id="col3">
  <div id="col3_content" class="clearfix">
    <h2>Accordion</h2>
    <p class="text">
        A simple Accordion.
    </p>
    <s:url id="urlajax1" action="ajax1"/>
    <s:url id="urlajax4" action="ajax4"/>
    <sj:accordion id="accordion" autoHeight="false">
    	<sj:accordionItem title="Mauris mauris ante">
    		<sj:div id="divInAccrodionItem1" href="%{urlajax1}" />
    	</sj:accordionItem>
    	<sj:accordionItem title="Sed non urna">
    		Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
    	</sj:accordionItem>
    	<sj:accordionItem title="Nam enim risus">
    		Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    	</sj:accordionItem>
    	<sj:accordionItem title="Cras dictum" onClickTopics="loadAccordionDiv">
    		<sj:div id="divInAccrodionItem4" href="%{urlajax4}" listenTopics="loadAccordionDiv" deferredLoading="true"/>
    	</sj:accordionItem>
    </sj:accordion>
  </div>
  
  <div class="code ui-widget-content ui-corner-all">
    <strong>Code:</strong>
    <pre>
&lt;s:url id=&quot;urlajax1&quot; action=&quot;ajax1&quot;/&gt;
&lt;s:url id=&quot;urlajax4&quot; action=&quot;ajax4&quot;/&gt;
&lt;sj:accordion id=&quot;accordion&quot; autoHeight=&quot;false&quot;&gt;
	&lt;sj:accordionItem title=&quot;Mauris mauris ante&quot;&gt;
		&lt;sj:div id=&quot;divInAccrodionItem1&quot; href=&quot;%{urlajax1}&quot; /&gt;
	&lt;/sj:accordionItem&gt;
	&lt;sj:accordionItem title=&quot;Sed non urna&quot;&gt;
		Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
	&lt;/sj:accordionItem&gt;
	&lt;sj:accordionItem title=&quot;Nam enim risus&quot;&gt;
		Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
	&lt;/sj:accordionItem&gt;
	&lt;sj:accordionItem title=&quot;Cras dictum&quot; onClickTopics=&quot;loadAccordionDiv&quot;&gt;
		&lt;sj:div id=&quot;divInAccrodionItem4&quot; href=&quot;%{urlajax4}&quot; listenTopics=&quot;loadAccordionDiv&quot; deferredLoading=&quot;true&quot;/&gt;
	&lt;/sj:accordionItem&gt;
&lt;/sj:accordion&gt;
    </pre>
  </div>
  <!-- IE Column Clearing -->
  <div id="ie_clearing"> &#160; </div>
</div>
