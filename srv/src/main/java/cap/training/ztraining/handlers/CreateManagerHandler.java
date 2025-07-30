package cap.training.ztraining.handlers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Manager;
import cds.gen.mainservice.Manager_;

@Component
@ServiceName("MainService")
public class CreateManagerHandler implements EventHandler {

    @Autowired
    private PersistenceService db;
    
    public Manager findManagerFromID(String id){
        CqnSelect search = Select.from(Manager_.CDS_NAME).where(t -> t.get("ID").eq(id));
        Result searchResult = db.run(search);
        return searchResult.single(Manager.class);
    }

    public Manager setDepartmentToSAPTrainee(Manager manager){
        manager.setDepartment("SAP Trainee");
        return manager;
    }

    public Manager setFullName(Manager manager){
        if ("".equals(manager.getLastName()) || manager.getLastName() == null){
            manager.setFullName(manager.getFirstName());
        }
        return manager;
    }

    @After(event=CqnService.EVENT_CREATE, entity=Manager_.CDS_NAME)
    public void afterCreateEvent(CdsCreateEventContext context){
        List<Map<String,Object>> entries = context.getCqn().entries();
        entries.forEach(entry -> {
            String entry_key = (String) entry.get("ID");
            Manager selectedManager = findManagerFromID(entry_key);
            /*
            CqnSelect search = Select.from(Manager_.CDS_NAME).where( t -> t.get("ID").eq(entry_key));
            Result searchResult = db.run(search);
            Manager selectedEntry = searchResult.single(Manager.class);
            */
            System.out.println("selectedEntry: " + selectedManager.toString());
            selectedManager = setFullName(selectedManager);
            selectedManager = setDepartmentToSAPTrainee(selectedManager);
            CqnUpdate updateData = Update.entity(Manager_.CDS_NAME).entry(selectedManager);
            db.run(updateData);
        });
    }

}
