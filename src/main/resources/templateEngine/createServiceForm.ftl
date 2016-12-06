<h2>Create Service</h2>
   <p id="status"></p>
  <form action="" method="POST" role="form">

    <div class="form-group">
      <label for="entityServiceIdNumber">Service entity ID number</label>
      <input type="text" pattern="[0-9]{6}" title="Six Digit Service ID code." class="form-control" id="entityServiceIdNumber" name="entityServiceIdNumber" placeholder="Enter ID number for new Service entity.">
    </div>

    <div class="form-group">
      <label for="providableServiceDescription">Service Descriptor</label>
      <input type="text" maxlength="20" title="Maximum of 20 characters." class="form-control" id="providableServiceDescription" name="providableServiceDescription" placeholder="Enter description for providable service.">
    </div>

    <div class="form-group">
		<label for="isProvidableByDietitian">Providable by Dietitian</label><br>
		<input type="radio" name="isProvidableByDietitian" value="True"> True
		<input type="radio" name="isProvidableByDietitian" value="False" checked> False
    </div>

    <div class="form-group">
		<label for="isProvidableByExerciseExpert">Providable by Exercise Expert</label><br>
		<input type="radio" name="isProvidableByExerciseExpert" value="True"> True
		<input type="radio" name="isProvidableByExerciseExpert" value="False" checked> False
    </div>

    <div class="form-group">
		<label for="isProvidableByInternist">Providable by Internist</label><br>
		<input type="radio" name="isProvidableByInternist" value="True"> True
		<input type="radio" name="isProvidableByInternist" value="False" checked> False
    </div>

    <button type="submit" class="btn btn-default">Submit</button>
  </form>

<!-- Simple JS function to for datepicker -->
<script>
$('#dateInput input').datepicker({
    format: "mm/dd/yyyy",
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
});
</script>

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
            url: "createService",
            data: json,
            dataType: "json",
            success : function() {
                $("#status").text("Service SuccesFully Added");
                this_.find('input,select').val('');
            },
            error : function(e) {
                console.log(e.responseText);
                $("#status").text(e.responseText);
            }
        });
        $("html, body").animate({ scrollTop: 0 }, "slow");
        return false;
    });
});

</script>
