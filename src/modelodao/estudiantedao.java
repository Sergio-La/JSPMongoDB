package modelodao;



import java.util.ArrayList;
import java.util.List;
 
import org.bson.Document;
import org.bson.types.ObjectId;
 
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
 
import converter.estconver;
import modelo.estudiante;

public class estudiantedao {
    private MongoCollection<Document> coll;
    
    public estudiantedao(MongoClient mongo) {
        this.coll = mongo.getDatabase("col").getCollection("estudiantes");
    }
    
    public estudiante create(estudiante e) {
        Document doc = estconver.toDocument(e);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        e.setId(id.toString());
        return e;
    }
    
    public void update(estudiante e) {
        this.coll.updateOne(Filters.eq("_id", new ObjectId(e.getId())), new Document("$set", estconver.toDocument(e)));
    }
    
    public void delete(String id) {
        this.coll.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }
    
    public boolean exists(String id) {
        FindIterable<Document>  doc = this.coll.find(Filters.eq("_id", id)).limit(1);
        return doc != null;
    }
    
    public List<estudiante> getList() {
        List<estudiante> list = new ArrayList<estudiante>();
        MongoCursor<Document>  cursor = coll.find().iterator();
        try {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                estudiante e = estconver.toestudiante(doc);
                list.add(e);
            }
        } finally {
            cursor.close();
        }
        return list;
    }
    
    public estudiante getestudiante(String id) {
        Document doc = this.coll.find(Filters.eq("_id", new ObjectId(id))).first();
        return estconver.toestudiante(doc);
    }
	
}