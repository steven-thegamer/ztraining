using { cuid } from '@sap/cds/common';

namespace db.schema;

aspect Employee {
    @mandatory
    FirstName : String;
    LastName : String;
    //FullName : String = FirstName || ' ' || LastName;
    FullName : String = case when LastName is null then FirstName
                            else FirstName || ' ' || LastName end;
    @readonly
    Department : String;
    @mandatory
    DOB : Date;
    @mandatory
    Email : Email;
}

entity Trainee : Employee, cuid {
}

entity Manager : Employee, cuid {
    Project : Association to  many Emp2Pro
        on Project.Employee = $self;
}

type Email : String;

entity Project {
    key ID : String;
    Title : String;
    Description : String;
    PIC : Association to many Emp2Pro on PIC.Project = $self;
    Comments : Association to many Comments on Comments.Project = $self;
}

entity Comments : cuid {
    Project : Association to one Project;
    User : String;
    Comment : String;
}

entity Emp2Pro {
    key Employee : Association to one Manager;
    key Project : Association to one Project;
}