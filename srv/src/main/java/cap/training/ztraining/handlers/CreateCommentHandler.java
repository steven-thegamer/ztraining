package cap.training.ztraining.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Comments;
import cds.gen.mainservice.Comments_;
import cds.gen.mainservice.Projects;
import cds.gen.mainservice.ProjectsCreateCommentContext;
import cds.gen.mainservice.Projects_;

@Component
@ServiceName("MainService")
public class CreateCommentHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @Before(event=ProjectsCreateCommentContext.CDS_NAME, entity=Projects_.CDS_NAME)
    public void beforeCreateComment(ProjectsCreateCommentContext context){

    }

    public Projects getProject(CqnSelect select){
        return db.run(select).single(Projects.class);
    }

    public void insertComment(Comments comment){
        CqnInsert insert = Insert.into(Comments_.CDS_NAME).entry(comment);
        db.run(insert);
    }

    @On(event=ProjectsCreateCommentContext.CDS_NAME, entity=Projects_.CDS_NAME)
    public void onCreateComment(ProjectsCreateCommentContext context){
        Projects currentProject = getProject(context.getCqn());
        Comments comment = Comments.create();
        comment.setUser(context.getUser());
        comment.setComment(context.getComment());
        comment.setProject(currentProject);
        insertComment(comment);
        //comment.setProjectId();
        //System.out.println(entry);
        context.setCompleted();
    }

    @After(event=ProjectsCreateCommentContext.CDS_NAME, entity=Projects_.CDS_NAME)
    public void afterCreateComment(ProjectsCreateCommentContext context){
        
    }

}
