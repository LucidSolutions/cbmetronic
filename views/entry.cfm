<cfoutput>
<div class="row">
	<div class="<cfif args.sidebar>col-sm-9<cfelse>col-sm-12</cfif> blog-posts">
		<!--- ContentBoxEvent --->
		#cb.event("cbui_preEntryDisplay")#


		<!--- post --->
		<div class="blog-item" id="post_#prc.entry.getContentID()#">

			<!--- Title --->
			<div class="post-title">
				<!--- Image --->
				<cfif prc.entry.getFeaturedImageURL() NEQ ''>
					<div class="blog-item-img">
						<img class="img-responsive" alt="#prc.entry.getTitle()#" src="#prc.entry.getFeaturedImageURL()#" width="800px" height="600px">
					</div>
				</cfif>
				<!--- Title --->
				<h2>#prc.entry.getTitle()#</h2>
				<!--- content --->
				#prc.entry.renderContent()#
				
				<ul class="blog-info">
				  <li title="Author"><i class="fa fa-user"></i> #prc.entry.getAuthorName()#</li>
				  <li title="Publish Date"><i class="fa fa-calendar"></i> #prc.entry.getDisplayPublishedDate()#</li>
				  <li title="Comments"><i class="fa fa-comments"></i> #prc.entry.getNumberOfApprovedComments()#</li>
				  </ul>
			</div>
			<cfif prc.entry.getNumberOfApprovedComments() GT 0>
				<div id="comments">
					<div class="row margin-bottom-40">
						<h2>Comments</h2>	
						<div class="col-sm-12 margin-bottom-40">						
							#cb.quickComments()#
						</div>				
					</div>
				</div>
			</cfif>
			<!--- Separator --->
			<div class="separator"></div>
			<cfif !args.print>
			<!--- Comments Bar --->
			#html.anchor(name="comments")#
			<div class="post-comments">
				<div class="infoBar">
					<cfif NOT cb.isCommentsEnabled(prc.entry)>
					<i class="icon-warning-sign icon-2x"></i>
					Comments are currently closed
					<cfelse>
						<div id="commentFormShell">
							<div class="row margin-bottom-40">
								<h2>Leave a Comment</h2>
								#cb.quickCommentForm( prc.entry )#
							</div>
						</div>
						
					</cfif>
				</div>
			</div>
			</cfif>
			<div class="clr"></div>
		</div>

		<!--- ContentBoxEvent --->
		#cb.event("cbui_postEntryDisplay")#

	</div>

	<cfif args.sidebar>
		<div class="col-sm-3">
			#cb.quickView(view='_blogsidebar', args=args)#
		</div>
	</cfif>
</div>

</cfoutput>