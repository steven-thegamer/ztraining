package cap.training.ztraining.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.CheckIDContext;

@Component
@ServiceName("MainService")
public class CheckIDHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @On(event=CheckIDContext.CDS_NAME)
    public String onCheckID(CheckIDContext context){
        System.out.println(context.getService());
        return "";

    }

}
