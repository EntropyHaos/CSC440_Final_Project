<div class="starter-template">
	<h2> Remove Billable </h2>
    	<p id="status"></p>
  	<div class="form-group">
      		<label for="id">Select Billable.entityBillableIdNumber to Remove</label>
      		<select id="billables" name="billableEntityBillableIdNumber"></select>
    	</div>
      <button type="submit" class="btn btn-default">Submit</button>
      <p id="status"></p>
</div>	

<script>
$( document ).ready(function() {
      var billable = ${billables};
      var sel = $('#billables');
      $.each(billable, function(key,val){
        sel.append('<option value="' + val + '">' + val + '</option>');   
      });
      $("button").on("click", function(e) {
      	e.preventDefault();
        var this_ = $(this);
        var arr = $("#billables").val();
        // Ajax Call
        $.ajax({
            type: "PUT",
            url: 'removeBillable/' + arr,
            success : function(e) {
                $("#billables option:selected").remove();
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
