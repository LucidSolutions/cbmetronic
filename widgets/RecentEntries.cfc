component extends="contentbox.models.ui.BaseWidget" singleton{

	RecentEntries function init(){
		// Widget Properties
		setName( "RecentEntries" );
		setVersion( "1.1" );
		setDescription( "A cool basic widget that shows N recent blog entries, which can be filtered by category." );
		setAuthor( "Lucid Solutions" );
		setAuthorURL( "http://www.ortussolutions.com" );
		setIcon( "list" );
		setCategory( "Blog" );
		return this;
	}

	/**
	* Show n recent entries with some cool orderings
	* @max.hint The number of recent entries to show. By default it shows 5
	* @title.hint An optional title to display using an H2 tag.
	* @titleLevel.hint The H{level} to use, by default we use H2
	* @category.hint The list of categories to filter on
	* @category.multiOptionsUDF getAllCategories
	* @searchTerm.hint The search term to filter on
	* @searchTerm.label Search Term
	* @sortOrder.hint How to order the results, defaults to publishedDate
	* @sortOrder.label Sort Order
	* @sortOrder.options Most Recent,Most Popular,Most Commented
	*/
	any function renderIt(
		numeric max=5,
		title="",
		string titleLevel="2",
		string category="",
		string searchTerm="",
		string sortOrder="Most Recent"
	){
		var event 			= getRequestContext();
		var cbSettings 		= event.getValue( name="cbSettings", private=true );
		
		// Determine Sort Order
		// Determine Sort Order
		switch ( arguments.sortOrder ) {
			case "Most Popular": {
				arguments.sortOrder = "hits DESC";
				break;
			}
			case "Most Commented": {
				arguments.sortOrder = "numberOfComments DESC";
				break;
			}
			default: {
				arguments.sortOrder = "publishedDate DESC";
			}
		}

		var entryResults = variables.entryService.findPublishedContent(
			max       : arguments.max,
			category  : arguments.category,
			searchTerm: arguments.searchTerm,
			sortOrder : arguments.sortOrder,
			siteID    : getSite().getsiteID()
		);

		var rString			= "";

		// iteration cap
		if( entryResults.count lt arguments.max){
			arguments.max = entryResults.count;
		}

		// generate recent comments
		saveContent variable="rString"{
			// title
			if( len(arguments.title) ){ writeOutput( "<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>" ); }
			// UL start
			writeOutput('<div class="recent-news margin-bottom-10">');
			// iterate and create
			for(var x=1; x lte arguments.max; x++){
				writeOutput('<li class="row margin-bottom-10">');
				
				if(entryResults.content[ x ].getFeaturedImageURL() NEQ ''){
					writeOutput('<div class="col-md-3 col-sm-3">');
					writeOutput('<img class="img-responsive" alt="" src="#entryResults.content[ x ].getFeaturedImageURL()#">');
					writeOutput('</div>');
					writeOutput('<div class="col-md-9 col-sm-9">');
					writeOutput('<h3><a href="#cb.linkEntry(entryResults.content[ x ])#" rel="bookmark" title="#entryResults.content[ x ].getTitle()#">');
					writeOutput(#left(entryResults.content[ x ].getTitle(),20)#);
					writeOutput('</a></h3>');
					writeOutput(#left(entryResults.content[ x ].renderContent(),50)#);
					writeoutput('...');
					writeOutput('</div>');
				}
				else{
					writeOutput('<div class="col-md-12 col-sm-12">');
					writeOutput('<h3><a href="#cb.linkEntry(entryResults.content[ x ])#" rel="bookmark" title="#entryResults.content[ x ].getTitle()#">');
					writeOutput(#left(entryResults.content[ x ].getTitle(),40)#);
					writeOutput('</a></h3>');
					writeOutput(#left(entryResults.content[ x ].renderContent(),60)#);
					writeoutput('...');
					writeOutput('</div>');
				}
				
				writeOutput('</li>');
			}
			writeOutput( "</div>" );
		}

		return rString;
	}

	/**
	* Get all the categories
	*/
	array function getAllCategories() cbIgnore{
		return variables.categoryService.getAllNames();
	}

}
