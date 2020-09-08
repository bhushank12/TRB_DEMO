$( document ).ready(function(){
  $('#call_table').DataTable({
    serverSide: true,
    ordering: false,
    ajax: {
      url: '/calls',
      contentType: 'application/json',
      dataType: 'json'
    },
  });
});

$(document).on('change', '#call_vehicle_type', function() {
  vehicle_type = $('#call_vehicle_type').val()
  if (vehicle_type == 'pcv' || vehicle_type == 'gcv')
  {
    $('#call_vcategory').html('')
    $.get("/calls/get_vehicle_categories", function(data) {
      vehicle_categories = data[vehicle_type]
      Object.keys(vehicle_categories).forEach(function (key) { 
        $('#call_vcategory').append(`<option value="${key}">
                                       ${vehicle_categories[key]}
                                  </option>`)
      })
    });
    $('#vehicle_category').show()
    $('#vehicle_subcategory').show()

  }
  else
  {
    $('#vehicle_category').hide()
    $('#vehicle_subcategory').hide()
  }
});