<cfoutput>
<!--- post --->

<div class="row">
	<div class="post" id="post_#entry.getContentID()#">
	<cfif entry.getFeaturedImageURL() NEQ ''>
		<div class="col-md-4 col-sm-4">
			<a href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#"><img class="img-responsive" alt="#entry.getTitle()#" src="#entry.getFeaturedImageURL()#" width="800px" height="600px"></a>
		</div>
	</cfif>
    	
    
		<!--- Title --->
	<cfif entry.getFeaturedImageURL() NEQ ''>
	  <div class="col-md-8 col-sm-8 blog-posts">
	<cfelse>
	  	<div class="col-md-12 col-sm-12 blog-posts">
	</cfif>
	    <h2>
	    	<a href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#">#entry.getTitle()#</a>
	    </h2>
	    <ul class="blog-info">
	      <li title="Publish Date"><i class="fa fa-calendar"></i> #entry.getDisplayPublishedDate()#</li>
	      <li title="Comments"><i class="fa fa-comments"></i> #entry.getNumberOfApprovedComments()#</li>
	      <li title="Author"><i class="fa fa-user"></i> #entry.getAuthorName()#</li>
	    </ul>
	    <cfif entry.hasExcerpt()>
	    	#entry.getExcerpt()#
	    	<div class="post-more">
	    		<a href="#cb.linkEntry(entry)#" class="more" title="Read More">Read more <i class="fa fa-angle-right"></i></a>
	    	</div>
	    <cfelse>
	    	#left(entry.renderContent(),200)#
	    	<div class="post-more">
	    		<a href="#cb.linkEntry(entry)#" class="more" title="Read More">Read more <i class="fa fa-angle-right"></i></a>
	    	</div>
	    </cfif>
	    
	  </div>
	</div>
</div>
	<hr class="blog-post-sep">	
</cfoutput>