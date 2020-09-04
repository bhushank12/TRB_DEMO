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