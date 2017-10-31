<!-- Include stylesheet -->
<link href="/Project/company/pages/attendance/bbs/quill/quill.snow.css" rel="stylesheet">
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.2/quill.js"></script>

<!-- Create the editor container -->

<div id="editor">
</div>



<!-- Initialize Quill editor -->
<script>

var toolbarOptions = [
    [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
    [{ 'header': [6, 5, 4, 3, 2, 1] }],

    ['bold', 'italic', 'underline', 'strike'],        //bold, italic, underline, strike, align

    [{ 'color': [] }, { 'background': [] }], 		//letter-color, background-color

    [{ 'list': 'ordered'}, { 'list': 'bullet' }, { 'align': [] }],

    ['link', 'image', 'video'],
    
    ['clean']                                         // remove formatting button
    ];

  var quill = new Quill('#editor', {
    modules: {
      toolbar: toolbarOptions
    },
    theme: 'snow'
  });

</script>













