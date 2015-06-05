CKEDITOR.editorConfig = function(config) {
	config.resize_enabled = false;
	config.toolbar = 'Complex';
	config.toolbar_Simple = [ [ 'Bold', 'Italic', '-', 'NumberedList',
			'BulletedList', '-', 'Link', 'Unlink', '-', 'About' ] ];
//	config.toolbar_Complex = [
//			[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript',
//					'Superscript', 'TextColor', 'BGColor', '-', 'Cut', 'Copy',
//					'Paste', 'Link', 'Unlink', 'Image' ],
//			[ 'Undo', 'Redo', '-', 'JustifyLeft', 'JustifyCenter',
//					'JustifyRight', 'JustifyBlock' ],
//			[ 'Table', 'Smiley', 'SpecialChar', 'PageBreak', 'Styles',
//					'Format', 'Font', 'FontSize', 'Maximize' ] ];

	config.toolbar_Complex = [
	              			[ 'Bold', 'Italic', 'Underline', 'Strike', 'TextColor', 'BGColor', '-', 'Cut', 'Copy', 'Paste', 'Link', 'Unlink' ],
	              			[ 'Undo', 'Redo', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
          					[ 'NumberedList', 'BulletedList' ],
	              			[ 'Table', 'Styles', 'Format', 'Font', 'FontSize', 'Maximize' ] ];

	
//	CKEDITOR.stylesSet.add("default",[{name:"Italic Title",element:"h2",styles:{"font-style":"italic"}},{name:"Subtitle",element:"h3",styles:{color:"#aaa","font-style":"italic"}},{name:"Special Container",element:"div",styles:{padding:"5px 10px",background:"#eee",border:"1px solid #ccc"}},{name:"Marker",element:"span",attributes:{"class":"marker"}},{name:"Big",element:"big"},{name:"Small",element:"small"},{name:"Typewriter",element:"tt"},{name:"Computer Code",element:"code"},{name:"Keyboard Phrase",element:"kbd"},{name:"Sample Text",element:"samp"},{name:"Variable",element:"var"},{name:"Deleted Text",element:"del"},{name:"Inserted Text",element:"ins"},{name:"Cited Work",element:"cite"},{name:"Inline Quotation",element:"q"},{name:"Language: RTL",element:"span",attributes:{dir:"rtl"}},{name:"Language: LTR",element:"span",attributes:{dir:"ltr"}},{name:"Styled image (left)",element:"img",attributes:{"class":"left"}},{name:"Styled image (right)",element:"img",attributes:{"class":"right"}},{name:"Compact table",element:"table",attributes:{cellpadding:"5",cellspacing:"0",border:"1",bordercolor:"#ccc"},styles:{"border-collapse":"collapse"}},{name:"Borderless Table",element:"table",styles:{"border-style":"hidden","background-color":"#E6E6FA"}},{name:"Square Bulleted List",element:"ul",styles:{"list-style-type":"square"}}]);
};