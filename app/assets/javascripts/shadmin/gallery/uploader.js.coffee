getIdForFile = (file) ->
  file.replace /[\s|&;$%@"<>()+,]/g, ""

$ ->
  $("#fileupload").fileupload
    dataType: "json"
    add: (e, data) ->
      fileId = getIdForFile(data.files[0].name)
      newElem = $("<li class=\"uploading\"><div class=\"progress\"><span id=\"" + fileId + "\" style=\"width: 0\" class=\"bar\"></span></div><div class=\"thumbnail-like\"><span class=\"text-container\"><p>" + data.files[0].name + "</p></span></div><div class=\"controls\"><a class=\"left\">set as cover</a><a class=\"right\">delete</a></div></li>")
      data.context = $("#uploader").before(newElem)
      data.submit()
      return

    progress: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $("#" + getIdForFile(data.files[0].name)).css "width", progress + "%"
      return

    done: (e, data) ->
      $.each data.result.files, (index, file) ->
        $("<p/>").text(file.name).appendTo document.body
        return

      return

  $(".sortable").sortable cancel: "#uploader"

  #placeholder: 'thumbnail-highlight' // introduces unneeded complexity, and layout issues.
  $(".sortable").disableSelection()
  return
