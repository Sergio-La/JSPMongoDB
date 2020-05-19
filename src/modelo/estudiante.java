package modelo;

public class estudiante {

	private String id;
	private String codigo;
	private String nombre;
	private String apellido;
	
	public estudiante() {
		
	}
	
	
	public estudiante(String id, String codigo, String nombre, String apellido) {
		this.id = id;
		this.codigo = codigo;
		this.nombre = nombre;
		this.apellido = apellido;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	
}
