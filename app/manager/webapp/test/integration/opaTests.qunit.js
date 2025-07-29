sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'manager/test/integration/FirstJourney',
		'manager/test/integration/pages/ManagerList',
		'manager/test/integration/pages/ManagerObjectPage',
		'manager/test/integration/pages/Emp2ProObjectPage'
    ],
    function(JourneyRunner, opaJourney, ManagerList, ManagerObjectPage, Emp2ProObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('manager') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheManagerList: ManagerList,
					onTheManagerObjectPage: ManagerObjectPage,
					onTheEmp2ProObjectPage: Emp2ProObjectPage
                }
            },
            opaJourney.run
        );
    }
);