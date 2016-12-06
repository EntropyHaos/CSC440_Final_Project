<div class="starter-template">
	<h2> Remove Provider </h2>
    	<p id="status"></p>
  	<div class="form-group">
      		<label for="id">Select Provider.entityProviderIdNumber to Remove</label>
      		<select id="providers" name="providerEntityProviderIdNumber"></select>
    	</div>
      <button type="submit" class="btn btn-default">Submit</button>
      <p id="status"></p>
</div>	

<script>
$( document ).ready(function() {
      var provider = ${providers};
      var sel = $('#providers');
      $.each(provider, function(key,val){
        sel.append('<option value="' + val + '">' + val + '</option>');   
      });
      $("button").on("click", function(e) {
      	e.preventDefault();
        var this_ = $(this);
        var arr = $("#providers").val();
        // Ajax Call
        $.ajax({
            type: "PUT",
            url: 'removeProvider/' + arr,
            success : function(e) {
                $("#providers option:selected").remove();
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
