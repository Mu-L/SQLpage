INSERT INTO component(name, icon, description, introduced_in_version) VALUES
    ('modal', 'app-window', 'Defines the content of a modal box. Useful for displaying additional information or help.', '0.36.0');

INSERT INTO parameter(component, name, description, type, top_level, optional) SELECT 'modal', * FROM (VALUES
    ('title','Description of the modal box.','TEXT',TRUE,FALSE),
    ('close','The text to display in the Close button.','TEXT',TRUE,TRUE),
    ('contents','A paragraph of text to display, without any formatting, without having to make additional queries.','TEXT',FALSE,TRUE),
    ('contents_md','Rich text in the markdown format. Among others, this allows you to write bold text using **bold**, italics using *italics*, and links using [text](https://example.com).','TEXT',FALSE,TRUE),
    ('scrollable','Create a scrollable modal that allows scroll the modal body.','BOOLEAN',TRUE,TRUE),
    ('class','Class attribute added to the container in HTML. It can be used to apply custom styling to this item through css.','TEXT',TRUE,TRUE),
    ('id','ID attribute added to the container in HTML. It can be used to target this item through css or for displaying this item.','TEXT',TRUE,FALSE),
    ('large','Indicates that the modal box has an increased width.','BOOLEAN',TRUE,TRUE),
    ('small','Indicates that the modal box has a reduced width.','BOOLEAN',TRUE,TRUE),
    ('embed','Embed remote content in an iframe.','TEXT',TRUE,TRUE),
    ('embed_mode','Use "iframe" to display embedded content within an iframe.','TEXT',TRUE,TRUE),
    ('height','Height of the embedded content.','INTEGER',TRUE,TRUE),
    ('allow','For embedded content, this attribute specifies the features or permissions that can be used.','TEXT',TRUE,TRUE),
    ('sandbox','For embedded content, this attribute specifies the security restrictions on the loaded content.','TEXT',TRUE,TRUE),
    ('style','Applies CSS styles to the embedded content.','TEXT',TRUE,TRUE)
) x;

INSERT INTO example(component, description, properties) VALUES
    ('modal', 
    'This example shows how to create a modal box that displays a paragraph of text. The modal window is opened with the help of a button.',
    json('[
        {"component": "modal","id": "my_modal","title": "A modal box","close": "Close"},
        {"contents":"I''m a modal window, and I allow you to display additional information or help for the user."},
        {"component": "button"},
        {"title":"Open a simple modal","modal":"my_modal"}
        ]')
    ),
    ('modal',
    'Example of modal form content',
    json('[
        {
            "component":"modal",
            "id":"my_embed_form_modal",
            "title":"Embeded form content",
            "large":true,
            "embed":"/examples/form.sql?_sqlpage_embed"
        },
        {"component": "button"},
        {"title":"Open a modal with a form","modal":"my_embed_form_modal"}
        ]')
    ),
    ('modal',
    'Example of modal chart content',
    json('[
        {
            "component":"modal",
            "id":"my_embed_chart_modal",
            "title":"Embeded chart content",
            "close":"Close",
            "embed":"/examples/chart.sql?_sqlpage_embed"
        },
        {"component": "button"},
        {"title":"Open a modal with a chart","modal":"my_embed_chart_modal"}
        ]')
    ),
    ('modal',
    'Example of modal video content',
    json('[
        {
            "component":"modal",
            "id":"my_embed_video_modal",
            "title":"Embeded video content",
            "close":"Close",
            "embed":"https://www.youtube.com/embed/mXdgmSdaXkg",
            "allow":"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share",
            "embed_mode":"iframe",
            "height":"350"
        },
        {"component": "button"},
        {"title":"Open a modal with a video","modal":"my_embed_video_modal"}
        ]')
    );

INSERT INTO parameter(component, name, description, type, top_level, optional) SELECT 'button', * FROM (VALUES
    ('modal','Display the modal window corresponding to the specified ID.','TEXT',FALSE,TRUE)
) x;