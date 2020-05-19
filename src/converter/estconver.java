package converter;

import org.bson.Document;
import org.bson.types.ObjectId;

import modelo.estudiante;

public class estconver {
	public static Document toDocument(estudiante e) {
        Document doc = new Document("codigo", e.getCodigo()).append("nombre", e.getNombre()).append("apellido", e.getApellido());
        if (e.getId() != null) {
            doc.append("_id", new ObjectId(e.getId()));
        }
        return doc;
    }
	
	public static estudiante toestudiante(Document doc) {
        estudiante e = new estudiante();
        e.setCodigo((String) doc.get("codigo"));
        e.setNombre((String) doc.get("nombre"));
        e.setApellido((String) doc.get("apellido"));
        e.setId(((ObjectId) doc.get("_id")).toString());
        return e;
    }
}
