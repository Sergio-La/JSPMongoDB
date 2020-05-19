package converter;

import org.bson.Document;
import org.bson.types.ObjectId;

import modelo.materia;

public class matconver {
	public static Document toDocument(materia a) {
        Document doc = new Document("codigo", a.getCodigo()).append("materia", a.getMateria()).append("estcod", a.getEstcod())
        		.append("estnom", a.getEstnom()).append("nota", a.getNota());
        if (a.getId() != null) {
            doc.append("_id", new ObjectId(a.getId()));
        }
        return doc;
    }
	
	public static materia tomateria(Document doc) {
        materia a = new materia();
        
        a.setCodigo((String) doc.get("codigo"));
        a.setMateria((String) doc.get("materia"));
        a.setEstcod((String) doc.get("estcod"));
        a.setEstnom((String) doc.get("estnom"));
        a.setNota((String) doc.get("nota"));
        a.setId(((ObjectId) doc.get("_id")).toString());
        return a;
    }
}
