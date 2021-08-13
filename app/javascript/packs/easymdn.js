import 'easymde/dist/easymde.min.css'
import EasyMDE from 'easymde'

document.addEventListener("turbolinks:load", function(){
  var editor = new EasyMDE({
    autofocus: true,
    blockStyles: {
      bold: "__",
      italic: "_",
    },
    element: document.getElementById("editor"),
    forceSync: true,
    hideIcons: ["guide", "heading"],
    indentWithTabs: false,
    insertTexts: {
      horizontalRule: ["", "\n\n-----\n\n"],
      image: ["![](http://", ")"],
      link: ["[", "](http://)"],
      table: ["", "\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
    },
    lineWrapping: false,
    parsingConfig: {
      allowAtxHeaderWithoutSpace: true,
      strikethrough: false,
      underscoresBreakWords: true,
    },
    placeholder: "Type here...",
    shortcuts: {
      "toggleSideBySide": "Cmd-B",
      "toggleFullScreen": "Cmd-H"
    },
    spellChecker: false,
    syncSideBySidePreviewScroll: false,
    tabSize: 2,
  });

});
