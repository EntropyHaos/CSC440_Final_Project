<style>
    table th a {
        text-transform: capitalize;
    }
</style>

<div class="provider_report-template">

    <h2>${title}</h2>
    <p id="status"></p>
    <div class="form-group">
        <label for="id">Select Provider for Report.</label>
        <select id="providers" name="providerEntityProviderIdNumber"></select>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
    <p id="status"></p>

    <div id="provider_billables_heading"></div>

    <div class="providerBillableTable"></div>
    <div class="paginationContainer"></div>

    <div id="provider_billables_footer"></div>

</div>

<script src="js/awesomeTable.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
    var provider = ${providers};
    var sel = $('#providers');
    $.each(provider, function(key, val) {
        sel.append('<option value="' + val + '">' + val + '</option>');
    });
    $("button").on("click", function(e) {
        e.preventDefault();
        var this_ = $(this);
        var arr = $("#providers").val();

        var url_string_for_address = '/providerAddress/' + arr
        $(document).ready(function() {
            $.get(url_string_for_address, function(element) {
                if (element.length == 0) {
                    console.log("PROVIDER NOT FOUND (provider_report.ftl!)");
                    $('#provider_billables_heading').text("No Billables Found");
                }
                else {
                    // Clear Heading.
                    $('#provider_billables_heading').text("");
                    // Put the provider aadress on the heading.
                    $('#provider_billables_heading').append(element);
                }
            });
        });
        
        
        var url_string_for_report = '/providerReport/' + arr
        $(document).ready(function() {
            $.getJSON(url_string_for_report, function(json) {
                if (json.length == 0) {
                    console.log("NO DATA for REPORT (provider_report.ftl!)");
                    $(".providerBillableTable").text("No Billables Found for provider : " + arr);
                }
                else {

                    // Clear table.
                    $(".providerBillableTable").text("");
                    // Make a new table.
                    var tbl = new awesomeTableJs({
                        data: json,
                        tableWrapper: ".providerBillableTable",
                        paginationWrapper: ".paginationContainer",
                        buildPageSize: false,
                        buildSearch: false,
                    });
                    // Put the table on the page.
                    tbl.createTable();
                }
                
                // Put the tabulations on the page.
                var url_string_for_tabulations = '/providerBillablesTabulations/' + arr
                
                $(document).ready(function() {
                    $.get(url_string_for_tabulations, function(element) {
                        if (element.length == 0) {
                            console.log("PROVIDER NOT FOUND (provider_report.ftl!)");
                            $('#provider_billables_footer').text("No Billables Found");
                        }
                        else {
                            // Clear Footer.
                            $('#provider_billables_footer').text("");
                            $('#provider_billables_footer').append(element);
                        }
                    });
                });
                
            });
        });
        
        

        
        /*
        */
        //return false;
    });
});
</script>
 