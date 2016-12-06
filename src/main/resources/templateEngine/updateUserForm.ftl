<h2>Enter Details of Exisiting User to Update.</h2>
   <p id="status"></p>
  <form action="" method="POST" role="form">
    <div class="form-group">

    <div class="form-group">
      <label for="entityUserIdNumber">User entity ID number</label>
      <input type="text" pattern="[0-9]{9}" title="Nine Digit Member ID." class="form-control" id="entityUserIdNumber" name="entityUserIdNumber" placeholder="Enter ID number User being updated.">
    </div>

    <div class="form-group">
      <label for="entityUserEmailAddress">User email address</label>
      <input type="email" title="User's email address." class="form-control" id="entityUserEmailAddress" name="entityUserEmailAddress" placeholder="Enter user's email address">
    </div>

    <div class="form-group">
      <label for="memberName">Name</label>
      <input type="text" maxlength="25" title="Maximum of 25 characters." class="form-control" id="memberName" name="memberName" placeholder="Enter name of member.">
    </div>

    <div class="form-group">
      <label for="memberStreetAddress">Street Address</label>
      <input type="text" maxlength="25" title="Maximum of 25 characters." class="form-control" id="memberStreetAddress" name="memberStreetAddress" placeholder="Enter street address for member.">
    </div>

    <div class="form-group">
      <label for="memberCity">City</label>
      <input type="text" maxlength="14" title="Maximum of 14 characters." class="form-control" id="memberCity" name="memberCity" placeholder="Enter City for member.">
    </div>

    <div class="form-group">
      <label for="memberState">STATE</label>
      <input type="text" pattern="[A-Z]{2}" title="Must be two uppercase letters." class="form-control" id="memberState" name="memberState" placeholder="Enter State for member.">
    </div>

    <div class="form-group">
      <label for="memberZip">ZIP CODE</label>
      <input type="text" pattern="[0-9]{5}" title="Must be 5 digit zip code" class="form-control" id="memberZip" name="memberZip">
    </div>

    <div class="form-group" id="dateInput">
		<label for="memberValidThrough">Valid Through</label><br>
        <input  type="text" class="form-control" id="memberValidThrough" name="memberValidThrough" data-provide="datepicker">
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
            url: "updateUser",
            data: json,
            dataType: "json",
            success : function() {
                $("#status").text("User SuccesFully Updated");
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
