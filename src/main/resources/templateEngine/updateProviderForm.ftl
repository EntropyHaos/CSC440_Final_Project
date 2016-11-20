<h2>Enter Details of Exisiting Provider to Update.</h2>
   <p id="status"></p>
  <form action="" method="POST" role="form">
    <div class="form-group">

    <div class="form-group">
      <label for="entityProviderIdNumber">Provider entity ID number</label>
      <input type="text" class="form-control" id="entityProviderIdNumber" name="entityProviderIdNumber" placeholder="Enter ID number for new Provider entity.">
    </div>

    <div class="form-group">
      <label for="providerName">Name</label>
      <input type="text" class="form-control" id="providerName" name="providerName" placeholder="Enter name of provider.">
    </div>

    <div class="form-group">
      <label for="providerStreetAddress">Street Address</label>
      <input type="text" class="form-control" id="providerStreetAddress" name="providerStreetAddress" placeholder="Enter street address for provider.">
    </div>

    <div class="form-group">
      <label for="providerCity">City</label>
      <input type="text" class="form-control" id="providerCity" name="providerCity" placeholder="Enter City for provider.">
    </div>

    <div class="form-group">
      <label for="providerState">STATE</label>
      <input type="text" class="form-control" id="providerState" name="providerState" placeholder="Enter State for provider.">
    </div>

    <div class="form-group">
      <label for="providerZip">ZIP CODE</label>
      <input type="number" class="form-control" id="providerZip" name="providerZip">
    </div>

    <div class="form-group">
		<label for="isDietitian">Provider is a Dietitian</label><br>
		<input type="radio" name="isDietitian" value="True"> True
		<input type="radio" name="isDietitian" value="False" checked> False
    </div>

    <div class="form-group">
		<label for="isExerciseExpert">Provider is an Exercise Expert</label><br>
		<input type="radio" name="isExerciseExpert" value="True"> True
		<input type="radio" name="isExerciseExpert" value="False" checked> False
    </div>

    <div class="form-group">
		<label for="isInternist">Provider is an Internist</label><br>
		<input type="radio" name="isInternist" value="True"> True
		<input type="radio" name="isInternist" value="False" checked> False
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>

<!-- Simple JS Function to convert the data into JSON and Pass it as ajax Call --!>
<script>
$(function() {
    $('form').submit(function(e) {
        e.preventDefault();
        var this_ = $(this);
        var array = this_.serializeArray();
        var json = {};
        $.each(array, function() {
            json[this.name] = this.value || '';
        });
        json = JSON.stringify(json);
    
        // Ajax Call
        $.ajax({
            type: "POST",
            url: "updateProvider",
            data: json,
            dataType: "json",
            success : function() {
                $("#status").text("Provider SuccesFully Updated");
                this_.find('input, select').val('');
            },
            error : function(e) {
                $("#status").text(e.responseText);
            }
        });
        $("html, body").animate({ scrollTop: 0 }, "slow");
        return false;
    });
});

</script>
