<cfoutput>
<!-- BEGIN PRE-FOOTER -->
<div class="pre-footer">
  <div class="container">
    <div class="row">
      <!-- BEGIN BOTTOM ABOUT BLOCK -->
      <div class="col-md-4 col-sm-6 pre-footer-col">
        <h2>About us</h2>
        #cb.themeSetting( 'aboutcontent' )#
      </div>
      <!-- END BOTTOM ABOUT BLOCK -->

      <!-- BEGIN BOTTOM CONTACTS -->
      <div class="col-md-4 col-sm-6 pre-footer-col">
        <h2>Our Contacts</h2>
        <address class="margin-bottom-40">
          #cb.themeSetting( 'locaddress' )#<br>
          #cb.themeSetting( 'locCity' )#, #cb.themeSetting( 'locState' )# - #cb.themeSetting( 'locZip' )#<br>
          Phone: #cb.themeSetting( 'locphone' )#<br>
          Email: <a href="mailto:#cb.themeSetting( 'locEmail' )#">#cb.themeSetting( 'locEmail' )#</a><br>
        </address>
      </div>
      <!-- END BOTTOM CONTACTS -->

      <!-- BEGIN TWITTER BLOCK --> 
      <div class="col-md-4 col-sm-6 pre-footer-col">
        <h2 class="margin-bottom-0">Latest Tweets</h2>
          <cfif cb.themeSetting( 'socialT', '' ) is not "">
              <a class="twitter-timeline" href="#cb.themeSetting( 'socialT' )#" data-tweet-limit="2" data-theme="dark" data-link-color="##57C8EB" data-chrome="noheader nofooter noscrollbar noborders transparent"></a>
              <!--- <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> --->
          </cfif>
      </div>
      <!-- END TWITTER BLOCK -->
    </div>
  </div>
</div>
<!-- END PRE-FOOTER -->				
<!-- BEGIN FOOTER -->
<div class="footer">
  <div class="container">
    <div class="row">
    	<!--- contentboxEvent --->
    	#cb.event( "cbui_footer" )#
      <!-- BEGIN COPYRIGHT -->
      <div class="col-md-4 col-sm-4 padding-top-10">
        2018 &copy; #cb.siteName()#. ALL Rights Reserved.
      </div>
      <!-- END COPYRIGHT -->
      <!-- BEGIN PAYMENTS -->
      <div class="col-md-4 col-sm-4">
        <ul class="social-footer list-unstyled list-inline pull-left">
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
      <!-- END PAYMENTS -->
      <!-- BEGIN POWERED -->
      <div class="col-md-4 col-sm-4 text-right">
        <p class="powered">Powered by: <a href="#cb.linkHome()#">#cb.siteName()#</a></p>
      </div>
      <!-- END POWERED -->
    </div>
  </div>
</div>
<!-- END FOOTER -->
</cfoutput>