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
    <h2>Grid (Local Data)</h2>
    <p class="text">
        A Grid that loads data only once on initialization. The column Credit Limit is editable.
    </p>
    <s:url id="remoteurl" action="jsontable">
    	<s:param name="loadonce" value="%{true}" />
    </s:url>
    <s:url id="editcellurl" action="edit-cell-entry"/>
    <sjg:grid
    	id="gridloadtable"
    	loadonce="true"
    	caption="Customers Examples (Local Data)"
    	href="%{remoteurl}"
    	gridModel="gridModel"
    	rowNum="-1"
    	hidegrid="true"
    	scroll="true"
    	cellEdit="true"
    	cellurl="%{editcellurl}"
    	altRows="true"
    	sortable="true"
    	sortableOpacity="0.8"
    	sortablePlaceholder="ui-state-highlight"
    	sortableForcePlaceholderSize="true"
    >
    	<sjg:gridColumn name="id" index="id" key="true" title="ID" width="30" formatter="integer" sortable="true" sorttype="int"/>
    	<sjg:gridColumn name="name" index="name" title="Company" width="250" sortable="true"/>
    	<sjg:gridColumn name="lastName" index="lastName" title="Last Name" sortable="true" hidden="true"/>
    	<sjg:gridColumn name="firstName" index="firstName" title="First Name" sortable="true" hidden="true"/>
    	<sjg:gridColumn name="addressLine1" index="addressLine1" title="Adress" sortable="true" hidden="true"/>
    	<sjg:gridColumn name="country" index="country" title="Country" sortable="true"/>
    	<sjg:gridColumn name="city" index="city" title="City" sortable="true"/>
    	<sjg:gridColumn 	name="creditLimit"
    					index="creditLimit"
    					title="Credit Limit"
    					align="right"
    					editable="true"
    					editrules="{
    									number: true,
    									required: true,
    									minValue : 100.0,
    									maxValue : 10000.0
    								}"
    					formatter="currency"
    					sortable="true"
    					sorttype="currency"/>
    </sjg:grid>
	<br/>
    <sj:submit id="grid_load_colsbutton"
    		value="Show/Hide Columns"
    		onClickTopics="showloadcolumns"
    		button="true"/>
	<br/>
  </div>

	<br/>
    <sj:tabbedpanel id="localtabs" cssClass="list">
      <sj:tab id="tab1" target="jsp" label="JSP"/>
      <sj:tab id="tab2" target="java" label="Struts2 Action"/>
      <div id="jsp">
	  <pre>
   &lt;s:url id=&quot;remoteurl&quot; action=&quot;jsontable&quot;&gt;
    	&lt;s:param name=&quot;loadonce&quot; value=&quot;%{true}&quot; /&gt;
    &lt;/s:url&gt;
    &lt;s:url id=&quot;editcellurl&quot; action=&quot;edit-cell-entry&quot;/&gt;
    &lt;sj:grid
    	id=&quot;gridloadtable&quot;
    	loadonce=&quot;true&quot;
    	caption=&quot;Customer Examples (Local Data)&quot;
    	href=&quot;%{remoteurl}&quot;
    	gridModel=&quot;gridModel&quot;
    	rowNum=&quot;-1&quot;
    	hidegrid=&quot;true&quot;
    	scroll=&quot;true&quot;
    	cellEdit=&quot;true&quot;
    	cellurl=&quot;%{editcellurl}&quot;
    &gt;
    	&lt;sj:gridColumn name=&quot;id&quot; index=&quot;id&quot; key=&quot;true&quot; title=&quot;ID&quot; formatter=&quot;integer&quot; sortable=&quot;true&quot;/&gt;
    	&lt;sj:gridColumn name=&quot;name&quot; index=&quot;name&quot; title=&quot;Company&quot; sortable=&quot;true&quot;/&gt;
    	&lt;sj:gridColumn name=&quot;lastName&quot; index=&quot;lastName&quot; title=&quot;Last Name&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
    	&lt;sj:gridColumn name=&quot;firstName&quot; index=&quot;firstName&quot; title=&quot;First Name&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
    	&lt;sj:gridColumn name=&quot;addressLine1&quot; index=&quot;addressLine1&quot; title=&quot;Adress&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
    	&lt;sj:gridColumn name=&quot;country&quot; index=&quot;country&quot; title=&quot;Country&quot; sortable=&quot;true&quot;/&gt;
    	&lt;sj:gridColumn name=&quot;city&quot; index=&quot;city&quot; title=&quot;City&quot; sortable=&quot;true&quot;/&gt;
    	&lt;sj:gridColumn 	name=&quot;creditLimit&quot;
    					index=&quot;creditLimit&quot;
    					title=&quot;Credit Limit&quot;
    					editable=&quot;true&quot;
    					editrules=&quot;{
    									number: true,
    									required: true,
    									minValue : 100.0,
    									maxValue : 10000.0
    								}&quot;
    					formatter=&quot;currency&quot;
    					sortable=&quot;true&quot;/&gt;
    &lt;/sj:grid&gt;
	&lt;br/&gt;
    &lt;sj:submit id=&quot;grid_load_colsbutton&quot;
    		value=&quot;Show/Hide Columns&quot;
    		onClickTopics=&quot;showloadcolumns&quot;
    		button=&quot;true&quot;/&gt;
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
<script type="text/javascript">
$(document).ready(function() {
    $('.buttonlink').hover(
            function() { $(this).addClass('ui-state-hover'); },
            function() { $(this).removeClass('ui-state-hover'); }
    );
});
</script>
