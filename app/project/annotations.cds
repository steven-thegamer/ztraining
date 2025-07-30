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
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.EntityContainer/checkID',
            Label : '{i18n>CheckId}',
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
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Comments}',
            ID : 'i18nComments',
            Target : 'Comments/@UI.LineItem#i18nComments',
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
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.createComment',
            Label : '{i18n>CreateComment}',
        },
    ],
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

annotate service.Comments with @(
    UI.LineItem #i18nComments : [
        {
            $Type : 'UI.DataField',
            Value : User,
            Label : 'User',
            @UI.Importance : #Medium,
        },
        {
            $Type : 'UI.DataField',
            Value : Comment,
            Label : 'Comment',
            @UI.Importance : #High,
        },
    ]
);

