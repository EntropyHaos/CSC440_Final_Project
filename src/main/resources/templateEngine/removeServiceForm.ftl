<div class="starter-template">
	<h2> Remove Service </h2>
    	<p id="status"></p>
  	<div class="form-group">
      		<label for="id">Select Service.entityServiceIdNumber to Remove</label>
      		<select id="services" name="serviceEntityServiceIdNumber"></select>
    	</div>
      <button type="submit" class="btn btn-default">Submit</button>
      <p id="status"></p>
</div>	

<script>
$( document ).ready(function() {
      var service = ${services};
      var sel = $('#services');
      $.each(service, function(key,val){
        sel.append('<option value="' + val + '">' + val + '</option>');   
      });
      $("button").on("click", function(e) {
      	e.preventDefault();
        var this_ = $(this);
        var arr = $("#services").val();
        // Ajax Call
        $.ajax({
            type: "PUT",
            url: 'removeService/' + arr,
            success : function(e) {
                $("#services option:selected").remove();
                $("#status").text(e);
            },
            error : function(e) {
                $("#status").text(e);
            }
        });
        return false;
    });
});
	
</script>
