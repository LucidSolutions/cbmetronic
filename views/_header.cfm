<cfoutput>
<!-- BEGIN TOP BAR -->
<div class="pre-header">
    <div class="container">
        <div class="row">
            <!-- BEGIN TOP BAR LEFT PART -->
            <div class="col-md-6 col-sm-6 additional-shop-info">
                <ul class="list-unstyled list-inline">
                    <li><i class="fa fa-phone"></i><span>#cb.themeSetting( 'locphone' )#</span></li>
                    <li><i class="fa fa-envelope-o"></i><span>#cb.themeSetting( 'locEmail' )#</span></li>
                </ul>
            </div>
            <!-- END TOP BAR LEFT PART -->
            <!-- BEGIN TOP BAR MENU -->
            <div class="col-md-6 col-sm-6 additional-nav">
                <ul class="list-unstyled list-inline pull-right">
                    <cfif cb.themeSetting( 'socialFB', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialFB' )#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialIG', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialIG' )#" target="_blank"><i class="fa fa-instagram"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialGP', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialGP' )#" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialD', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialD' )#" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialLD', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialLD' )#" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialT', '' ) is not "">
                        <li><a href="#cb.themeSetting( 'socialT' )#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialS', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialS' )#" target="_blank"><i class="fa fa-skype"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialGH', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialGH' )#" target="_blank"><i class="fa fa-github"></i></a></li>
                    </cfif>
                    <cfif cb.themeSetting( 'socialYT', '' ) is not "">
                      <li><a href="#cb.themeSetting( 'socialYT' )#" target="_blank"><i class="fa fa-youtube"></i></a></li>
                    </cfif>
                </ul>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>        
</div>
<!-- END TOP BAR -->
<!-- BEGIN HEADER -->
<div class="header">
  <div class="container">
    <cfif cb.themeSetting( 'headerLogo', '' ) is "">
      <div class="col-sm-6 col-md-6">
        <a href="#cb.linkHome()#" class="site-title" title="#cb.siteTagLine()#" data-toggle="tooltip"><strong>#cb.siteName()#</strong></a>
      </div>
    <cfelse>
      <div class="col-sm-6 col-md-6">
        <a href="#cb.linkHome()#" class="site-logo" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#"></a>
      </div>
    </cfif>

    <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

    <!-- BEGIN NAVIGATION -->
    <div class="header-navigation pull-right font-transform-inherit">
      <ul>
      	<cfset menuData = cb.rootMenu( type="data", levels="2" )>
      	<cfloop array="#menuData#" index="menuItem">
      		<cfif structKeyExists( menuItem, "subPageMenu" )>
      			<cfif cb.isPageView() >
      			  <cfset pageHH = cb.getCurrentPage()>
      			      <cfif pageHH.hasParent() and cb.linkPage( pageHH.getParent() ) EQ menuItem.link>
      			         <li class="dropdown active">
      			      <cfelseif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
      			          <li class="active">
      			      <cfelse>
      			             <li class="dropdown">
      			      </cfif>
      			<cfelse>
      			  <li class="dropdown">
      			</cfif>
      			  <a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>
      			    #buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
      			</li>
      			<cfelse>
      			  <cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
      			    <li class="active">
      			  <cfelse>
      			    <li>
      			  </cfif>
      			    <a href="#menuItem.link#">#menuItem.title#</a>
      			  </li>
      		</cfif>
        </cfloop>

        <!--- Blog Link, verify active --->
        <cfif ( !prc.cbSettings.cb_site_disable_blog )>
          <cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
            <a href="#cb.linkBlog()#">Blog</a>
          </li>
        </cfif>

        <!-- BEGIN TOP SEARCH -->
        <li class="menu-search">
          <span class="sep"></span>
          <i class="fa fa-search search-btn"></i>
          <div class="search-box">
            <form id="searchForm" name="searchForm" method="post" action="#cb.linkContentSearch()#">
              <div class="input-group">
                <input type="text" placeholder="Search" class="form-control" name="q" id="q" value="#cb.getSearchTerm()#">
                <span class="input-group-btn">
                  <button class="btn btn-primary" type="submit">Search</button>
                </span>
              </div>
            </form>
          </div> 
        </li>
        <!-- END TOP SEARCH -->
      </ul>
    </div>
    <!-- END NAVIGATION -->
  </div>
</div>
<!-- Header END -->


<cfscript>
any function buildSubMenu( required menuData ){
  var menu = '<ul class="dropdown-menu">';
  if(cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) EQ #menuItem.link#){
      menu &= '<li class="active"><a href="#parentLink#"><strong>#parentTitle#</strong></a></li><li role="separator" class="divider"></li>';
  }else{
      menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
  }
  
  for( var menuItem in arguments.menuData ){
    if( !structKeyExists( menuItem, "subPageMenu" ) ){
      if(cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) EQ #menuItem.link#){
          menu &= '<li class="active"><a href="#menuItem.link#">#menuItem.title#</a></li>';
      }else{
          menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
      }
      
    } else {
      menu &= '<li class="dropdown"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
      menu &= buildSubMenu( menuItem.subPageMenu );
      menu &= '</li>';
    }
  }
  menu &= '</ul>';

  return menu;
}
</cfscript>
</cfoutput>