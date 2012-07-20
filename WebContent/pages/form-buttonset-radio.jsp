<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div id="col1">
  <div id="col1_content" class="clearfix">
    <ul>
      <li><s:url id="urlform" action="form"/><sj:a id="remoteformlink" href="%{urlform}" targets="main">AJAX Forms</sj:a></li>
      <li><s:url id="urlformeffect" action="form-effect"/><sj:a id="remoteformeffectlink" href="%{urlformeffect}" targets="main">AJAX Forms with Effects</sj:a></li>
      <li><s:url id="urlformout" action="form-out"/><sj:a id="remoteformoutlink" href="%{urlformout}" targets="main">AJAX Forms with Outside Button</sj:a></li>
      <li><s:url id="urlformftl" action="form-ftl"/><sj:a id="remoteformftllink" href="%{urlformftl}" targets="main">AJAX Forms with Freemarker</sj:a></li>
      <li><s:url id="urlformvel" action="form-velocity"/><sj:a id="remoteformvellink" href="%{urlformvel}" targets="main">AJAX Forms with Velocity</sj:a></li>
      <li><s:url id="urlformevent" action="form-event"/><sj:a id="remoteformeventlink" href="%{urlformevent}" targets="main">AJAX Forms with Events</sj:a></li>
      <li><s:url id="urlformlisten" action="form-listen"/><sj:a id="remoteformlistenlink" href="%{urlformlisten}" targets="main">AJAX Forms with Listen Topics</sj:a></li>
      <li><s:url id="urlformvalidation" action="form-validation"/><sj:a id="remoteformvalidationlink" href="%{urlformvalidation}" targets="main">AJAX Forms with Validation</sj:a></li>
      <li><s:url id="urlformvalidationcust" action="form-validation-custome"/><sj:a id="remoteformvalidationcustlink" href="%{urlformvalidationcust}" targets="main">AJAX Forms with Custome Validation</sj:a></li>
      <li><s:url id="urlformtextarea" action="form-textarea"/><sj:a id="remoteformtextarealink" href="%{urlformtextarea}" targets="main">AJAX Textarea</sj:a></li>
      <li><s:url id="urlformtextarearesize" action="form-textarea-resizeable"/><sj:a id="remoteformtextarearesizelink" href="%{urlformtextarearesize}" targets="main">AJAX Textarea / Resizable</sj:a></li>
      <li><s:url id="urlformtextfieldresize" action="form-textfield-resizeable"/><sj:a id="remoteformtextfieldresizelink" href="%{urlformtextfieldresize}" targets="main">AJAX Textfield / Resizable</sj:a></li>
      <li><s:url id="urlformbuttonsetcheckbox" action="form-buttonset-checkbox"/><sj:a id="remoteformbuttonsetcheckboxes" href="%{urlformbuttonsetcheckbox}" targets="main">Buttonset / Checkboxes</sj:a></li>
      <li><s:url id="urlformbuttonsetradio" action="form-buttonset-radio"/><sj:a id="remoteformbuttonsetradio" href="%{urlformbuttonsetradio}" targets="main">Buttonset / Radio Buttons</sj:a></li>
      <li><s:url id="urlformselect" action="form-select"/><sj:a id="remoteformselectlink" href="%{urlformselect}" targets="main">AJAX Select</sj:a></li>
      <li><s:url id="urlformdoubleselect" action="form-doubleselect"/><sj:a id="remoteformdoubleselectlink" href="%{urlformdoubleselect}" targets="main">AJAX Select (Doubleselect)</sj:a></li>
	    </ul>
  </div>
</div>
<div id="col3">
  <div id="col3_content" class="clearfix">
	<h2>Buttonset / Radio Buttons</h2>
	<p class="text">
	   Create a Buttonset from Radio Buttons Map.
	</p>
    <strong>Result Div :</strong>
	<div id="formResult" class="result ui-widget-content ui-corner-all">Submit form bellow.</div>
    
    <strong>Buttonset that was populated from a List with String values.</strong>
    <s:form id="form" action="echo" theme="simple">
            <label for="echo">Choose your Friend: </label>
		    <sj:radio
		    		id="radiobuttonset"
		            list="{'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
		            name="echo"
					onChangeTopics="submitForm1"
		    />
		    <br/>
            <sj:submit 
	           	targets="formResult" 
	           	value="AJAX Submit" 
	           	indicator="indicator"
	           	button="true"
	            listenTopics="submitForm1"
            	cssStyle="display:none;"
           	/>
    </s:form>
	<br/>
    <strong>Buttonset that was populated from AJAX JSON Result with onChangeTopic.</strong>
    <s:form id="form2" action="echo" theme="xhtml">
				<s:url id="remoteurl" action="jsonsample"/> 
				<sj:radio
					href="%{remoteurl}" 
					id="remoteRadiobuttons" 
					name="echo" 
					list="languageMap" 
					label="Language"
					onChangeTopics="submitForm2"
				/>
	            <sj:submit 
	            	id="form2button"
	            	targets="formResult" 
	            	value="AJAX Submit" 
	            	indicator="indicator"
	            	button="true"
	            	listenTopics="submitForm2"
	            	cssStyle="display:none;"
	            	/>
   </s:form>

   <img id="indicator" src="images/indicator.gif" alt="Loading..." style="display:none"/>    
    
	<div class="code ui-widget-content ui-corner-all">
	  <strong>Code:</strong>
	  <pre>
    &lt;strong&gt;Result Div :&lt;/strong&gt;
	&lt;div id=&quot;formResult&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Submit form bellow.&lt;/div&gt;
    
    &lt;strong&gt;Buttonset that was populated from a List with String values.&lt;/strong&gt;
    &lt;s:form id=&quot;form&quot; action=&quot;echo&quot; theme=&quot;simple&quot;&gt;
            &lt;label for=&quot;echo&quot;&gt;Choose your Friend: &lt;/label&gt;
		    &lt;sj:radio
		    		id=&quot;radiobuttonset&quot;
		            list=&quot;{'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}&quot;
		            name=&quot;echo&quot;
					onChangeTopics=&quot;submitForm1&quot;
		    /&gt;
		    &lt;br/&gt;
            &lt;sj:submit 
	           	targets=&quot;formResult&quot; 
	           	value=&quot;AJAX Submit&quot; 
	           	indicator=&quot;indicator&quot;
	           	button=&quot;true&quot;
	            listenTopics=&quot;submitForm1&quot;
            	cssStyle=&quot;display:none;&quot;
           	/&gt;
    &lt;/s:form&gt;
	&lt;br/&gt;
    &lt;strong&gt;Buttonset that was populated from AJAX JSON Result with onChangeTopic.&lt;/strong&gt;
    &lt;s:form id=&quot;form2&quot; action=&quot;echo&quot; theme=&quot;xhtml&quot;&gt;
				&lt;s:url id=&quot;remoteurl&quot; action=&quot;jsonsample&quot;/&gt; 
				&lt;sj:radio
					href=&quot;%{remoteurl}&quot; 
					id=&quot;remoteRadiobuttons&quot; 
					name=&quot;echo&quot; 
					list=&quot;languageMap&quot; 
					label=&quot;Language&quot;
					onChangeTopics=&quot;submitForm2&quot;
				/&gt;
	            &lt;sj:submit 
	            	id=&quot;form2button&quot;
	            	targets=&quot;formResult&quot; 
	            	value=&quot;AJAX Submit&quot; 
	            	indicator=&quot;indicator&quot;
	            	button=&quot;true&quot;
	            	listenTopics=&quot;submitForm2&quot;
	            	cssStyle=&quot;display:none;&quot;
	            	/&gt;
   &lt;/s:form&gt;

   &lt;img id=&quot;indicator&quot; src=&quot;images/indicator.gif&quot; alt=&quot;Loading...&quot; style=&quot;display:none&quot;/&gt;    
	  </pre>
	</div>
  </div>
  <!-- IE Column Clearing -->
  <div id="ie_clearing"> &#160; </div>
</div>
