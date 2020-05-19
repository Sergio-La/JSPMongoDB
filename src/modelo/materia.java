package modelo;

public class materia {
	private String id;
	private String codigo;
	private String materia;
	private String estcod;
	private String estnom;
	private String nota;
	
	public materia() {
		
	}
	
	public materia(String codigo, String materia, String estcod, String estnom, String nota) {
		this.codigo = codigo;
		this.materia = materia;
		this.estcod = estcod;
		this.estnom = estnom;
		this.nota = nota;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getMateria() {
		return materia;
	}

	public void setMateria(String materia) {
		this.materia = materia;
	}

	public String getEstcod() {
		return estcod;
	}

	public void setEstcod(String estcod) {
		this.estcod = estcod;
	}

	public String getEstnom() {
		return estnom;
	}

	public void setEstnom(String estnom) {
		this.estnom = estnom;
	}

	public String getNota() {
		return nota;
	}

	public void setNota(String nota) {
		this.nota = nota;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
