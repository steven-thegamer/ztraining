package cap.training.ztraining.handlers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.services.ServiceException;
import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Projects_;

@Component
@ServiceName("MainService")
public class CreateProjectHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @Before(event=CqnService.EVENT_CREATE, entity=Projects_.CDS_NAME)
    public void beforeCreateProject(CdsCreateEventContext context){
        List<Map<String,Object>> entries = context.getCqn().entries();
        entries.forEach(entry -> {
            String title = (String) entry.get("Title");
            if(title == null || title.trim().isEmpty()){
                throw new ServiceException("Title must not be empty!");
            }
        });
    }

}
