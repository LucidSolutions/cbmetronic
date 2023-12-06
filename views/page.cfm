<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">

<!--- If homepage, present homepage jumbotron --->
<div class="main">
	<div class="container">
		<!--- BreadCrumbs --->
		<ul class="breadcrumb">
		    <li><a href="#cb.linkHome()#">Home</a></li>
		    <cfset pageHH = cb.getCurrentPage()>
             <cfif pageHH.hasParent()>
             	<li><a href="#prc.page.getParent().getSlug()#">#prc.page.getParent().getTitle()#</a></li>
             </cfif>
		    <li class="active">#prc.page.getTitle()#</li>
		</ul>

		<div class="row margin-bottom-40">
			<cfif cb.isHomePage() OR !args.sidebar>
				<cfset variables.span = 12>
			<cfelse>
				<cfset variables.span = 9>
			</cfif>
			<div class="col-md-#variables.span# col-sm-#variables.span#">
				#cb.event( "cbui_prePageDisplay" )#
				<h1>#prc.page.getTitle()#</h1>
				<div class="text-divider5">
					#prc.page.renderExcerpt()#
				</div>
				<div class="content-page">
					<div class="row">
						#prc.page.renderContent()#
					</div>
				</div>
			</div>
			<cfif args.sidebar and !cb.isHomePage()>
				<div class="col-sm-3 sidenav">
					#cb.quickView( view='_pagesidebar' )#
				</div>
	    	</cfif>
		</div>
	</div>
</div>

#cb.event("cbui_postPageDisplay")#
</cfoutput>