using db.schema from '../db/schemas.cds';

service MainService {

    entity Employee as projection on schema.Trainee;
    entity Manager as projection on schema.Manager;
    entity Emp2Pro as projection on schema.Emp2Pro;
    entity Projects as projection on schema.Project
    actions{
        action createComment(user : String, comment : String);
    };
    entity Comments as projection on schema.Comments;
}

annotate MainService.Manager with @odata.draft.enabled;
annotate MainService.Projects with @odata.draft.enabled;
