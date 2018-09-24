<cfoutput>
<title>#cb.getContentTitle()#</title>

<!--- ********************************************************************************* --->
<!--- 					META TAGS														--->
<!--- ********************************************************************************* --->
<meta charset="utf-8" /> 
<meta name="generator" 	 	content="ContentBox powered by ColdBox" />
<meta name="robots" 	 	content="index,follow" />
<meta name="viewport" 		content="width=device-width, initial-scale=1">
<meta name="description" 	content="#cb.getContentDescription()#" />
<meta name="keywords" 	 	content="#cb.getContentKeywords()#" />

#cb.getOpenGraphMeta()#

<!--- Base HREF for SES enabled URLs --->
<base href="#cb.siteBaseURL()#" />

<!--- ********************************************************************************* --->
<!--- 					RSS DISCOVERY													--->
<!--- ********************************************************************************* --->
<cfif cb.themeSetting( "rssDiscovery", true )>
	<link rel="alternate" type="application/rss+xml" title="Recent Blog Updates" href="#cb.linkRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Blog Comment Updates" href="#cb.linkRSS(comments=true)#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Page Updates" href="#cb.linkPageRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Page Comment Updates" href="#cb.linkPageRSS(comments=true)#" />	
	<link rel="alternate" type="application/rss+xml" title="Recent Content Updates" href="#cb.linkSiteRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Content Comment Updates" href="#cb.linkSiteRSS(comments=true)#" />
	<cfif cb.isEntryView()>
		<link rel="alternate" type="application/rss+xml" title="Entry's Recent Comments" href="#cb.linkRSS( comments=true, entry=cb.getCurrentEntry() )#" />
	</cfif>
</cfif>

<!--- ********************************************************************************* --->
<!--- 					CSS 															--->
<!--- ********************************************************************************* --->
<link href="#cb.themeRoot()#/includes/assets/corporate/css/googlefonts.css" rel="stylesheet" type="text/css">
<!-- Global styles START -->          
<link href="#cb.themeRoot()#/includes/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="#cb.themeRoot()#/includes/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Global styles END --> 

<!-- Page level plugin styles START -->
<link href="#cb.themeRoot()#/includes/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="#cb.themeRoot()#/includes/assets/pages/css/components.css" rel="stylesheet">
<link href="#cb.themeRoot()#/includes/assets/corporate/css/style.css" rel="stylesheet">
<link href="#cb.themeRoot()#/includes/assets/corporate/css/style-responsive.css" rel="stylesheet">
<link href="#cb.themeRoot()#/includes/assets/corporate/css/themes/#lcase(cb.themeSetting('cbBootswatchTheme', 'cb_theme_default_cbBootswatchTheme'))#.css" rel="stylesheet" id="style-color">
<!-- Theme styles END -->

<!--- ********************************************************************************* --->
<!--- 					JAVASCRIPT														--->
<!--- ********************************************************************************* --->
<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="#cb.themeRoot()#/includes/assets/plugins/jquery.min.js" type="text/javascript"></script>
<script src="#cb.themeRoot()#/includes/assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="#cb.themeRoot()#/includes/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
<script src="#cb.themeRoot()#/includes/assets/corporate/scripts/back-to-top.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="#cb.themeRoot()#/includes/assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->

<script src="#cb.themeRoot()#/includes/assets/corporate/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initTwitter();
    });
</script>
</cfoutput>