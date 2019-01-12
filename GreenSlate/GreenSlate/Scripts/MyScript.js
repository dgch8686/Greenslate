$(function () {
    debugger;
    $("#grid").jqGrid
        ({
            url: "/Project/GetProjects",
            datatype: 'json',
            postData: {
                userID: function () {return $("#Users option:selected").val();}
            },
            mtype: 'Get',
            // headers 
            colNames: ['Project ID', 'Start Date', 'Time To Start', 'End Date', 'Credits', 'Status'],
            //colModel takes the data from controller and binds to grid   
            colModel: [
                {
                    key: false,
                    name: 'projectID',
                    index: 'projectID',
                    editable: false
                },
                {
                    key: false,
                    name: 'startDate',
                    index: 'startDate',
                    editable: false,
                    formatter: 'date'
                },
                {
                    key: false,
                    name: 'timeToStart',
                    index: 'timeToStart',
                    editable: false
                    
                },
                {
                    key: false,
                    name: 'endDate',
                    index: 'endDate',
                    editable: false,
                    formatter: 'date'
                },
                {
                    key: false,
                    name: 'credits',
                    index: 'credits',
                    editable: false
                },
                {
                    key: false,
                    name: 'status',
                    index: 'status',
                    editable: false
                }
            ],
            height: '100%',
            viewrecords: true,
            caption: 'Projects',
            emptyrecords: 'No records to display',
            multiSort: true,
            jsonReader:
            {
                records: "records",
                repeatitems: false
            },
            autowidth: true
        });

});

var myReload = function () {
    $("#grid").trigger('reloadGrid');
}; 

$("#Users").change(myReload).keyup(function (e) {
    keyupHandler(e, myReload, this);
}); 