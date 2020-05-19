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
 
import converter.matconver;
import modelo.materia;

public class materiadao {
	

    private MongoCollection<Document> coll;
    
    public materiadao(MongoClient mongo) {
        this.coll = mongo.getDatabase("col").getCollection("materias");
    }
    
    public materia create(materia a) {
        Document doc = matconver.toDocument(a);
        this.coll.insertOne(doc);
        ObjectId id = (ObjectId) doc.get("_id");
        a.setId(id.toString());
        return a;
    }
    
    public void update(materia a) {
        this.coll.updateOne(Filters.eq("_id", new ObjectId(a.getId())), new Document("$set", matconver.toDocument(a)));
    }
    
    public void delete(String id) {
        this.coll.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }
    
    public boolean exists(String id) {
        FindIterable<Document>  doc = this.coll.find(Filters.eq("_id", id)).limit(1);
        return doc != null;
    }
    
    public List<materia> getList() {
        List<materia> list = new ArrayList<materia>();
        MongoCursor<Document>  cursor = coll.find().iterator();
        try {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                materia e = matconver.tomateria(doc);
                list.add(e);
            }
        } finally {
            cursor.close();
        }
        return list;
    }
    
    public materia getmateria(String id) {
        Document doc = this.coll.find(Filters.eq("_id", new ObjectId(id))).first();
        return matconver.tomateria(doc);
    }
	

}
