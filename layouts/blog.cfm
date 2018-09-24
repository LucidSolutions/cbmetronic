<cfoutput>
<!--- Global Layout Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">
<!DOCTYPE html>
<html lang="en">
<head>
	<!--- Page Includes --->
	#cb.quickView( "_blogIncludes" )#

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeHeadEnd" )#
</head>
<body>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_afterBodyStart" )#
	
	<!--- Header --->
	#cb.quickView( view='_header' )#

	<!--- Main Body --->
	<div class="main">
		<div class="container">
			<ul class="breadcrumb">
			    <li><a href="#cb.linkHome()#">Home</a></li>
			    <cfif cb.isArchivesView()>
			    	<li><a href="#cb.linkBlog()#">Blog</a></li>
			    	<li class="active">Blog Archives</a>
			   	<cfelseif cb.isEntryView()>
			    	<li><a href="#cb.linkBlog()#">Blog</a></li>
			    	<li class="active">#prc.entry.getTitle()#</a>
		    	<cfelse>
		    		<li class="active">Blog</li>
			    </cfif>
			</ul>
			<div class="row margin-bottom-40">
				<div class="col-md-12 col-sm-12">
					<cfif !cb.isArchivesView() AND !cb.isEntryView()><h1>Blog Page</h1></cfif>
					<div class="content-page">
						<div class="row">
							<!--- ContentBoxEvent --->
							#cb.event( "cbui_beforeContent" )#

							<!--- Main View --->
							#cb.mainView( args=args )#

							<!--- ContentBoxEvent --->
							#cb.event( "cbui_afterContent" )#
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	#cb.quickView( view='_footer' )#
	
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeBodyEnd" )#
</body>
</html>
</cfoutput>