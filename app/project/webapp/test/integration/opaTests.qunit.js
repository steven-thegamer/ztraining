sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project/test/integration/FirstJourney',
		'project/test/integration/pages/ProjectsList',
		'project/test/integration/pages/ProjectsObjectPage',
		'project/test/integration/pages/Emp2ProObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectsList, ProjectsObjectPage, Emp2ProObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectsList: ProjectsList,
					onTheProjectsObjectPage: ProjectsObjectPage,
					onTheEmp2ProObjectPage: Emp2ProObjectPage
                }
            },
            opaJourney.run
        );
    }
);