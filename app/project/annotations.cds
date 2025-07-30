using MainService as service from '../../srv/services';
annotate service.Projects with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : Description,
            Label : '{i18n>Description}',
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
            Label : '{i18n>EmployeesInCharge}',
            ID : 'i18nEmployeesInCharge',
            Target : 'PIC/@UI.LineItem#i18nEmployeesInCharge',
        },
    ],
    UI.FieldGroup #i18nGeneral : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : Description,
                Label : '{i18n>Description}',
            },
        ],
    },
);

annotate service.Emp2Pro with @(
    UI.LineItem #i18nEmployeesInCharge : [
        {
            $Type : 'UI.DataField',
            Value : Employee.FullName,
            Label : '{i18n>FullName}',
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : Employee.Department,
            Label : '{i18n>Department}',
            @UI.Importance : #Medium,
        },
        {
            $Type : 'UI.DataField',
            Value : Employee.Email,
            Label : '{i18n>Email}',
            @UI.Importance : #Low,
        },
    ]
);

