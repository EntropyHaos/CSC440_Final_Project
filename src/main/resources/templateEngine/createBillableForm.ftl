<h2>Create Billable</h2>
   <p id="status"></p>
  <form action="" method="POST" role="form">

    <div class="form-group">
      <label for="entityBillableIdNumber">Billable entity ID number</label>
      <input type="text" class="form-control" id="entityBillableIdNumber" name="entityBillableIdNumber" placeholder="Enter ID number for new Billable entity.">
    </div>

    <div class="form-group">
      <label for="memberNumberService">Serviced Member ID</label>
      <input type="text" class="form-control" id="memberNumberService" name="memberNumberService" placeholder="Enter ID of serviced member.">
    </div>

    <div class="form-group">
      <label for="providerNumberServicing">Servicing Provider ID</label>
      <input type="text" class="form-control" id="providerNumberServicing" name="providerNumberServicing" placeholder="Enter ID of servicing provider.">
    </div>

    <div class="form-group" id="dateInput">
		<label for="dateServiced">Date Serviced</label><br>
        <input  type="text" class="form-control" id="dateServiced" name="dateServiced" data-provide="datepicker">
    </div>

    <div class="form-group" id="dateInput">
		<label for="dateServicedRecorded">Date Recorded</label><br>
        <input  type="text" class="form-control" id="dateServicedRecorded" name="dateServicedRecorded" data-provide="datepicker">
    </div>

    <div class="form-group">
      <label for="serviceComment">COMMENT</label>
      <input type="text" class="form-control" id="serviceComment" name="serviceComment" placeholder="Enter comment if any.">
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
            url: "createBillable",
            data: json,
            dataType: "json",
            success : function() {
                $("#status").text("Billable SuccesFully Added");
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
