<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#
<div class="blog-sidebar">
  <!-- CATEGORIES START -->
  <cfif cb.themeSetting( "showCategoriesBlogSide", true )>
    <h2 class="no-top-space">Categories</h2>
    <ul class="nav sidebar-categories margin-bottom-40">
      #cb.quickCategories()#
    </ul>
  </cfif>
  <!-- CATEGORIES END -->

  <!-- BEGIN RECENT NEWS -->
  <cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>                            
    <h2 class="no-top-space">Recent Entries</h2>
      <div class="recent-news margin-bottom-40 nav">
      #cb.widget( 'RecentEntries' )#
    </div>
  </cfif>
  <!-- END RECENT NEWS -->

  <cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
  <!--- RSS Buttons --->
  <h2 class="no-top-space">Site Updates</h2>
    <ul class="nav sidebar-categories margin-bottom-40">
      <li>
        
        <a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fa fa-rss"></i> RSS Feed</a>
      </li>
    </ul>
  </cfif>
                              
  <cfif cb.themeSetting( "showArchivesBlogSide", true )>
  <h2 class="no-top-space">Archives</h2>
  <ul class="nav sidebar-categories">
    #cb.widget( "Archives" )#
  </ul>
  </cfif>
</div>
<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>