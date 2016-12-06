<h2>Create Billable</h2>
   <p id="status"></p>
  <form action="" method="POST" role="form">

    <div class="form-group">
      <label for="entityBillableIdNumber">Billable entity ID number</label>
      <input type="text" class="form-control" pattern="[0-9]{1,}" title="Must be digits." id="entityBillableIdNumber" name="entityBillableIdNumber" placeholder="Enter ID number for new Billable entity.">
    </div>

    <div class="form-group">
      <label for="memberNumberService">Serviced Member ID</label>
      <input type="text" class="form-control" pattern="[0-9]{9}" title="Nine Digit Member ID." id="memberNumberService" name="memberNumberService" placeholder="Enter ID of serviced member.">
    </div>

    <div class="form-group">
      <label for="providerNumberServicing">Servicing Provider ID</label>
      <input type="text" class="form-control" pattern="[0-9]{9}" title="Nine Digit Provider ID." id="providerNumberServicing" name="providerNumberServicing" placeholder="Enter ID of servicing provider.">
    </div>





    <div class="form-group">
      <label for="serviceNumberServiced">Service Provided Code</label>
      <input type="text" class="form-control" pattern="[0-9]{6}" title="Six Digit Service." id="serviceNumberServiced" name="serviceNumberServiced" placeholder="Enter Code for Service Provided.">
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
      <label for="serviceCost">Cost</label>
      <input type="number" step="any" class="form-control currency" id="serviceCost" name="serviceCost" min="0.00" max="999.99" value="0.00" />
    </div>

    <div class="form-group">
      <label for="serviceComment">Comment</label>
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

<!-- Sauce : http://stackoverflow.com/questions/14650932/set-value-to-currency-in-input-type-number -->
<script>

(function($) {
  $.fn.currencyInput = function() {
    this.each(function() {
      var wrapper = $("<div class='currency-input' />");
      $(this).wrap(wrapper);
      $(this).before("<span class='currency-symbol'>$</span>");
      $(this).change(function() {
        var min = parseFloat($(this).attr("min"));
        var max = parseFloat($(this).attr("max"));
        var value = this.valueAsNumber;
        if(value < min)
          value = min;
        else if(value > max)
          value = max;
        $(this).val(value.toFixed(2)); 
      });
    });
  };
})(jQuery);

$(document).ready(function() {
  $('input.currency').currencyInput();
});
</script>

<!-- Simple JS Function to convert the data into JSON and Pass it as ajax Call -->
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
