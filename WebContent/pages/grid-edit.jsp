<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
	<div id="col1">
  <div id="col1_content" class="clearfix">
    <ul>
      <li><s:url id="urlgrid" action="grid"/><sj:a href="%{urlgrid}" targets="main">Grid</sj:a></li>
      <li><s:url id="urlgridedit" action="grid-edit"/><sj:a href="%{urlgridedit}" targets="main">Grid (Editable)</sj:a></li>
      <li><s:url id="urlgridmulti" action="grid-multi"/><sj:a href="%{urlgridmulti}" targets="main">Grid (Editable/Multiselect)</sj:a></li>
      <li><s:url id="urlgridloadonce" action="grid-loadonce"/><sj:a href="%{urlgridloadonce}" targets="main">Grid (Local Data)</sj:a></li>
      <li><s:url id="urlgridgrouping" action="grid-grouping"/><sj:a href="%{urlgridgrouping}" targets="main">Grid (Grouping)</sj:a></li>
    </ul>
  </div>
</div>
<div id="col3">
  <div id="col3_content" class="clearfix">
    <h2>Grid (Editable)</h2>
    <p class="text">
        A editable Grid with pager and navigator. Entries are editable when a cell is selected. This Grid is sortable by name column and searchable by id. The first two Columns are frozen.
    </p>
    <s:url id="remoteurl" action="jsontable"/>
    <s:url id="editurl" action="edit-grid-entry"/>
    <sjg:grid
    	id="gridedittable"
    	caption="Customers Examples (Editable)"
    	dataType="json"
    	href="%{remoteurl}"
    	pager="true"
    	navigator="true"
    	navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
    	navigatorAddOptions="{height:280,reloadAfterSubmit:true}"
    	navigatorEditOptions="{height:280,reloadAfterSubmit:false}"
    	navigatorEdit="false"
    	navigatorView="false"
    	navigatorDelete="true"
    	navigatorDeleteOptions="{height:280,reloadAfterSubmit:true}"
    	navigatorInlineEditButtons="true"
    	navigatorExtraButtons="{
    		seperator: { 
    			title : 'seperator'  
    		}, 
    		hide : { 
	    		title : 'Show/Hide', 
	    		icon: 'ui-icon-wrench', 
	    		topic: 'showcolumns'
    		},
    		alert : { 
	    		title : 'Alert', 
	    		onclick: function(){ alert('Grid Button clicked!') }
    		}
    	}"
    	gridModel="gridModel"
    	rowList="10,15,20"
    	rowNum="15"
    	editurl="%{editurl}"
    	editinline="true"
    	onSelectRowTopics="rowselect"
    	onEditInlineSuccessTopics="oneditsuccess"
    	viewrecords="true"
    	width="700"
    	shrinkToFit="false"
    >
    	<sjg:gridColumn name="id" frozen="true" index="id" title="ID" width="60" formatter="integer" editable="false" sortable="false" search="true" searchoptions="{sopt:['eq','ne','lt','gt']}"/>
    	<sjg:gridColumn name="name" index="name" title="Name" width="250" editable="true" edittype="text" sortable="true" search="false"/>
    	<sjg:gridColumn name="lastName" index="lastName" title="Last Name" sortable="false" editable="true" edittype="text"/>
    	<sjg:gridColumn name="firstName" index="firstName" title="First Name" sortable="false" editable="true" edittype="text"/>
    	<sjg:gridColumn name="addressLine1" index="addressLine1" title="Adress" sortable="false" editable="true" edittype="text"/>
    	<sjg:gridColumn name="country" index="country" title="Country" editable="true" edittype="select" editoptions="{value:'France:France;USA:USA;Australia:Australia;Norway:Norway;Poland:Poland;Germany:Germany;Spain:Spain'}" sortable="false" search="false"/>
    	<sjg:gridColumn name="city" index="city" title="City" editable="true" edittype="text" sortable="false" search="false"/>
    	<sjg:gridColumn name="creditLimit" index="creditLimit" title="Credit Limit" align="right" formatter="currency" editable="true" edittype="text" sortable="false" search="false"/>
    </sjg:grid>
	<br/>
    <sj:submit id="grid_edit_addbutton" value="Add Row" onClickTopics="rowadd" button="true"/>
    <sj:submit id="grid_edit_searchbutton" value="Search" onClickTopics="searchgrid" button="true"/>
    <sj:submit id="grid_edit_colsbutton" value="Show/Hide Columns" onClickTopics="showcolumns" button="true"/>
	<br/>
	<br/>
    <div id="gridinfo" class="ui-widget-content ui-corner-all"><p>Edit Mode for Row :</p></div>
  </div>

	<br/>
    <sj:tabbedpanel id="localtabs" cssClass="list">
      <sj:tab id="tab1" target="javascript" label="JavaScript"/>
      <sj:tab id="tab2" target="jsp" label="JSP"/>
      <sj:tab id="tab3" target="java" label="Struts2 Action"/>
      <div id="javascript">
	  <pre>
    $.subscribe('rowselect', function(event,data) {
        $(&quot;#gridinfo&quot;).html('&lt;p&gt;Edit Mode for Row : '+event.originalEvent.id+'&lt;/p&gt;');
    });
    $.subscribe('oneditsuccess', function(event, data){
		var message = event.originalEvent.response.statusText;
		$(&quot;#gridinfo&quot;).html('&lt;p&gt;Status: ' + message + '&lt;/p&gt;');
	});
    $.subscribe('rowadd', function(event,data) {
        $(&quot;#gridedittable&quot;).jqGrid('editGridRow',&quot;new&quot;,{height:280,reloadAfterSubmit:false});
  	});
    $.subscribe('searchgrid', function(event,data) {
        $(&quot;#gridedittable&quot;).jqGrid('searchGrid', {sopt:['cn','bw','eq','ne','lt','gt','ew']} );
  	});
    $.subscribe('showcolumns', function(event,data) {
        $(&quot;#gridedittable&quot;).jqGrid('setColumns',{});
  	});
	  &lt;/pre&gt;
	  </div>
      <div id="jsp">
	  <pre>
    &lt;s:url id=&quot;remoteurl&quot; action=&quot;jsontable&quot;/&gt;
    &lt;s:url id=&quot;editurl&quot; action=&quot;edit-grid-entry&quot;/&gt;
    &lt;sjg:grid
    	id=&quot;gridedittable&quot;
    	caption=&quot;Customers Examples (Editable)&quot;
    	dataType=&quot;json&quot;
    	href=&quot;%{remoteurl}&quot;
    	pager=&quot;true&quot;
    	navigator=&quot;true&quot;
    	navigatorSearchOptions=&quot;{sopt:['eq','ne','lt','gt']}&quot;
    	navigatorAddOptions=&quot;{height:280,reloadAfterSubmit:true}&quot;
    	navigatorEditOptions=&quot;{height:280,reloadAfterSubmit:false}&quot;
    	navigatorEdit=&quot;false&quot;
    	navigatorView=&quot;false&quot;
    	navigatorDelete=&quot;true&quot;
    	navigatorDeleteOptions=&quot;{height:280,reloadAfterSubmit:true}&quot;
    	navigatorExtraButtons=&quot;{
    		seperator: { 
    			title : 'seperator'  
    		}, 
    		hide : { 
	    		title : 'Show/Hide', 
	    		icon: 'ui-icon-wrench', 
	    		topic: 'showcolumns'
    		},
    		alert : { 
	    		title : 'Alert', 
	    		onclick: function(){ alert('Grid Button clicked!') }
    		}
    	}&quot;
    	gridModel=&quot;gridModel&quot;
    	rowList=&quot;10,15,20&quot;
    	rowNum=&quot;15&quot;
    	editurl=&quot;%{editurl}&quot;
    	editinline=&quot;true&quot;
    	onSelectRowTopics=&quot;rowselect&quot;
    	onEditInlineSuccessTopics=&quot;oneditsuccess&quot;
    	viewrecords=&quot;true&quot;
    	width=&quot;700&quot;
    	shrinkToFit=&quot;false&quot;
    &gt;
    	&lt;sjg:gridColumn name=&quot;id&quot; frozen=&quot;true&quot; index=&quot;id&quot; title=&quot;ID&quot; width=&quot;60&quot; formatter=&quot;integer&quot; editable=&quot;false&quot; sortable=&quot;false&quot; search=&quot;true&quot; searchoptions=&quot;{sopt:['eq','ne','lt','gt']}&quot;/&gt;
    	&lt;sjg:gridColumn name=&quot;name&quot; frozen=&quot;true&quot; index=&quot;name&quot; title=&quot;Name&quot; width=&quot;250&quot; editable=&quot;true&quot; edittype=&quot;text&quot; sortable=&quot;true&quot; search=&quot;false&quot;/&gt;
    	&lt;sjg:gridColumn name=&quot;lastName&quot; index=&quot;lastName&quot; title=&quot;Last Name&quot; sortable=&quot;false&quot;/&gt;
    	&lt;sjg:gridColumn name=&quot;firstName&quot; index=&quot;firstName&quot; title=&quot;First Name&quot; sortable=&quot;false&quot;/&gt;
    	&lt;sjg:gridColumn name=&quot;addressLine1&quot; index=&quot;addressLine1&quot; title=&quot;Adress&quot; sortable=&quot;false&quot;/&gt;
    	&lt;sjg:gridColumn name=&quot;country&quot; index=&quot;country&quot; title=&quot;Country&quot; editable=&quot;true&quot; edittype=&quot;select&quot; editoptions=&quot;{value:'France:France;USA:USA;Australia:Australia;Norway:Norway;Poland:Poland;Germany:Germany;Spain:Spain'}&quot; sortable=&quot;false&quot; search=&quot;false&quot;/&gt;
    	&lt;sjg:gridColumn name=&quot;city&quot; index=&quot;city&quot; title=&quot;City&quot; editable=&quot;true&quot; edittype=&quot;text&quot; sortable=&quot;false&quot; search=&quot;false&quot;/&gt;
    	&lt;sjg:gridColumn name=&quot;creditLimit&quot; index=&quot;creditLimit&quot; title=&quot;Credit Limit&quot; align=&quot;right&quot; formatter=&quot;currency&quot; editable=&quot;true&quot; edittype=&quot;text&quot; sortable=&quot;false&quot; search=&quot;false&quot;/&gt;
    &lt;/sjg:grid&gt;
	&lt;br/&gt;
    &lt;sj:submit id=&quot;grid_edit_addbutton&quot; value=&quot;Add Row&quot; onClickTopics=&quot;rowadd&quot; button=&quot;true&quot;/&gt;
    &lt;sj:submit id=&quot;grid_edit_searchbutton&quot; value=&quot;Search&quot; onClickTopics=&quot;searchgrid&quot; button=&quot;true&quot;/&gt;
    &lt;sj:submit id=&quot;grid_edit_colsbutton&quot; value=&quot;Show/Hide Columns&quot; onClickTopics=&quot;showcolumns&quot; button=&quot;true&quot;/&gt;
	&lt;br/&gt;
	&lt;br/&gt;
    &lt;div id=&quot;gridinfo&quot; class=&quot;ui-widget-content ui-corner-all&quot;&gt;&lt;p&gt;Edit Mode for Row :&lt;/p&gt;&lt;/div&gt;
	  </pre>
	  </div>
      <div id="java">
	  <pre>
package com.jgeppert.struts2.jquery.showcase;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;

import com.jgeppert.struts2.jquery.showcase.model.Customer;
import com.jgeppert.struts2.jquery.showcase.model.CustomerDAO;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value = &quot;showcase&quot;)
public class JsonTable extends ActionSupport implements SessionAware {

  private static final long   serialVersionUID = 5078264277068533593L;
  private static final Log    log              = LogFactory.getLog(JsonTable.class);

  private List&lt;Customer&gt;      gridModel;
  private List&lt;Customer&gt;      myCustomers;
  private Integer             rows             = 0;
  private Integer             page             = 0;
  private Integer             total            = 0;
  private Integer             record           = 0;
  private String              sord;
  private String              sidx;
  private String              searchField;
  private String              searchString;
  private String              searchOper;
  private boolean             loadonce         = false;
  private Map&lt;String, Object&gt; session;

  @Actions( {
    @Action(value = &quot;/jsontable&quot;, results = {
      @Result(name = &quot;success&quot;, type = &quot;json&quot;)
    })
  })
  public String execute()
  {
    log.debug(&quot;Page &quot; + getPage()+&quot; Rows &quot; + getRows() +&quot; Sorting Order &quot;+ getSord()+&quot; Index Row :&quot; + getSidx());
    log.debug(&quot;Search :&quot; + searchField + &quot; &quot; + searchOper + &quot; &quot; + searchString);

    Object list = session.get(&quot;mylist&quot;);
    if (list != null)
    {
      myCustomers = (List&lt;Customer&gt;) list;
    }
    else
    {
      log.debug(&quot;Build new List&quot;);
      myCustomers = CustomerDAO.buildList();
    }

    if (getSord() != null &amp;&amp; getSord().equalsIgnoreCase(&quot;asc&quot;))
    {
      Collections.sort(myCustomers);
    }
    if (getSord() != null &amp;&amp; getSord().equalsIgnoreCase(&quot;desc&quot;))
    {
      Collections.sort(myCustomers);
      Collections.reverse(myCustomers);
    }

    setRecord(CustomerDAO.getCustomersCount(myCustomers));

    int to = (getRows() * getPage());
    int from = to - getRows();

    if (to &gt; getRecord()) to = getRecord();

    if (loadonce)
    {
      setGridModel(myCustomers);
    }
    else
    {
      if (searchString != null &amp;&amp; searchOper != null)
      {
        int id = Integer.parseInt(searchString);
        if (searchOper.equalsIgnoreCase(&quot;eq&quot;))
        {
          log.debug(&quot;search id equals &quot; + id);
          List&lt;Customer&gt; cList = new ArrayList&lt;Customer&gt;();
          cList.add(CustomerDAO.findById(myCustomers, id));
          setGridModel(cList);
        }
        else if (searchOper.equalsIgnoreCase(&quot;ne&quot;))
        {
          log.debug(&quot;search id not &quot; + id);
          setGridModel(CustomerDAO.findNotById(myCustomers, id, from, to));
        }
        else if (searchOper.equalsIgnoreCase(&quot;lt&quot;))
        {
          log.debug(&quot;search id lesser then &quot; + id);
          setGridModel(CustomerDAO.findLesserAsId(myCustomers, id, from, to));
        }
        else if (searchOper.equalsIgnoreCase(&quot;gt&quot;))
        {
          log.debug(&quot;search id greater then &quot; + id);
          setGridModel(CustomerDAO.findGreaterAsId(myCustomers, id, from, to));
        }
      }
      else
      {
        setGridModel(CustomerDAO.getCustomers(myCustomers, from, to));
      }
    }

    setTotal((int) Math.ceil((double) getRecord() / (double) getRows()));

    session.put(&quot;mylist&quot;, myCustomers);

    return SUCCESS;
  }

  public String getJSON()
  {
    return execute();
  }

  /**
   * @return how many rows we want to have into the grid
   */
  public Integer getRows()
  {
    return rows;
  }

  /**
   * @param rows
   *          how many rows we want to have into the grid
   */
  public void setRows(Integer rows)
  {
    this.rows = rows;
  }

  /**
   * @return current page of the query
   */
  public Integer getPage()
  {
    return page;
  }

  /**
   * @param page
   *          current page of the query
   */
  public void setPage(Integer page)
  {
    this.page = page;
  }

  /**
   * @return total pages for the query
   */
  public Integer getTotal()
  {
    return total;
  }

  /**
   * @param total
   *          total pages for the query
   */
  public void setTotal(Integer total)
  {
    this.total = total;
  }

  /**
   * @return total number of records for the query. e.g. select count(*) from
   *         table
   */
  public Integer getRecord()
  {
    return record;
  }

  /**
   * @param record
   *          total number of records for the query. e.g. select count(*) from
   *          table
   */
  public void setRecord(Integer record)
  {

    this.record = record;

    if (this.record &gt; 0 &amp;&amp; this.rows &gt; 0)
    {
      this.total = (int) Math.ceil((double) this.record / (double) this.rows);
    }
    else
    {
      this.total = 0;
    }
  }

  /**
   * @return an collection that contains the actual data
   */
  public List&lt;Customer&gt; getGridModel()
  {
    return gridModel;
  }

  /**
   * @param gridModel
   *          an collection that contains the actual data
   */
  public void setGridModel(List&lt;Customer&gt; gridModel)
  {
    this.gridModel = gridModel;
  }

  /**
   * @return sorting order
   */
  public String getSord()
  {
    return sord;
  }

  /**
   * @param sord
   *          sorting order
   */
  public void setSord(String sord)
  {
    this.sord = sord;
  }

  /**
   * @return get index row - i.e. user click to sort.
   */
  public String getSidx()
  {
    return sidx;
  }

  /**
   * @param sidx
   *          get index row - i.e. user click to sort.
   */
  public void setSidx(String sidx)
  {
    this.sidx = sidx;
  }

  public void setSearchField(String searchField)
  {
    this.searchField = searchField;
  }

  public void setSearchString(String searchString)
  {
    this.searchString = searchString;
  }

  public void setSearchOper(String searchOper)
  {
    this.searchOper = searchOper;
  }

  public void setLoadonce(boolean loadonce)
  {
    this.loadonce = loadonce;
  }

  public void setSession(Map&lt;String, Object&gt; session)
  {
    this.session = session;
  }

}
	  </pre>
	  </div>
    </sj:tabbedpanel>
  <!-- IE Column Clearing -->
  <div id="ie_clearing"> &#160; </div>
</div>