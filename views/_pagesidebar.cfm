<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event("cbui_BeforeSideBar")#
	<h2 class="no-top-space">Sub Pages</h2>
	<div class="sidebar-nav">
		<ul class="nav sidebar-categories margin-bottom-40">
			<li>#cb.subPageMenu( page=cb.getCurrentPage(), type="li" )#</li>
		</ul>
	</div>
	

	<!--- ContentBoxEvent --->
	#cb.event("cbui_afterSideBar")#
</cfoutput>