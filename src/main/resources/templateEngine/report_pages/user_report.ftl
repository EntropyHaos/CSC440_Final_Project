<style>
    table th a {
        text-transform: capitalize;
    }
</style>


<div class="user_report-template">

    <h2>${title}</h2>
    <p id="status"></p>
    <div class="form-group">
        <label for="id">Select User for Report.</label>
        <select id="users" name="userEntityUserIdNumber"></select>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
    <p id="status"></p>

    <div id="users_billables_heading"></div>

    <div class="usersBillableTable"></div>
    <div class="paginationContainer"></div>

</div>

<script src="js/awesomeTable.js" type="text/javascript"></script>


<script>
$(document).ready(function() {
    var user = ${users};
    var sel = $('#users');
    $.each(user, function(key, val) {
        sel.append('<option value="' + val + '">' + val + '</option>');
    });
    $("button").on("click", function(e) {
        e.preventDefault();
        var this_ = $(this);
        var arr = $("#users").val();

        var url_string_for_address = '/userAddress/' + arr
        $(document).ready(function() {
            $.get(url_string_for_address, function(element) {
                if (element.length == 0) {
                    console.log("USER NOT FOUND (user_report.ftl!)");
                    $('#users_billables_heading').text("No Billables Found");
                }
                else {
                    
                    // Clear Heading.
                    $('#users_billables_heading').text("");
                    $('#users_billables_heading').append(element);

                }
            });
        });
        
        
        var url_string_for_report = '/userReport/' + arr
        $(document).ready(function() {
            $.getJSON(url_string_for_report, function(json) {
                if (json.length == 0) {
                    console.log("NO DATA for REPORT (user_report.ftl!)");
                    $(".usersBillableTable").text("No Billables Found for user : " + arr);
                }
                else {

                    // Clear Table.
                    $(".usersBillableTable").text("");

                    var tbl = new awesomeTableJs({
                        data: json,
                        tableWrapper: ".usersBillableTable",
                        paginationWrapper: ".paginationContainer",
                        buildPageSize: false,
                        buildSearch: false,
                    });
                    tbl.createTable();
                }
            });
        });
        /*
        */
        //return false;
    });
});
</script>
 