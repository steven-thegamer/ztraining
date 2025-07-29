using MainService as service from '../../srv/services';
annotate service.Manager with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : FullName,
            Label : '{i18n>FullName}',
        },
        {
            $Type : 'UI.DataField',
            Value : DOB,
            Label : '{i18n>DateOfBirth}',
        },
        {
            $Type : 'UI.DataField',
            Value : Department,
            Label : '{i18n>Department}',
        },
        {
            $Type : 'UI.DataField',
            Value : Email,
            Label : '{i18n>Email}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            ID : 'i18nGeneral',
            Target : '@UI.FieldGroup#i18nGeneral',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Projects}',
            ID : 'i18nProjects',
            Target : 'Project/@UI.LineItem#i18nProjects',
        },
    ],
    UI.FieldGroup #i18nGeneral : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : FirstName,
                Label : '{i18n>FirstName}',
            },
            {
                $Type : 'UI.DataField',
                Value : LastName,
                Label : '{i18n>LastName}',
            },
            {
                $Type : 'UI.DataField',
                Value : Department,
                Label : '{i18n>Department}',
            },
            {
                $Type : 'UI.DataField',
                Value : DOB,
                Label : '{i18n>DateOfBirth}',
            },
            {
                $Type : 'UI.DataField',
                Value : Email,
                Label : '{i18n>Email}',
            },
        ],
    },
);

annotate service.Emp2Pro with @(
    UI.LineItem #i18nProjects : [
        {
            $Type : 'UI.DataField',
            Value : Project.Title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : Project.Description,
            Label : '{i18n>Description}',
        },
    ]
);

