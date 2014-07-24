/**
 * @author Chorch
 *
 * Clase hecha por Chorch el dia 23/01/2006 
 * para el proyecto Framework
 */
package com.jkt.xmlreader;

public class XMLEntityCustomRestConc extends XMLEntity {
   
   private String nickName;
   private String clasif;
   private String label;
   private String codigo;
   private String descripcion;
   private String displayError;
   private String paramKey;
   private String paramValue;
   private boolean requerido;
   private String inputType;
   private int inputSize; 
   private int inputDec;
   
   public String getCodigo() {   
      return codigo;
   }
   
   public void setCodigo(String codigo) {      
      this.codigo = codigo;
   }
   
   public String getDescripcion() {      
      return descripcion;
   }
   
   public void setDescripcion(String descripcion) {   
      this.descripcion = descripcion;
   }
   
   public String getDisplayError() {      
      return displayError;
   }
   
   public void setDisplayError(String displayError) {   
      this.displayError = displayError;
   }
   
   public String getParamKey() {   
      return paramKey;
   }
   
   public void setParamKey(String paramKey) {   
      this.paramKey = paramKey;
   }
   
   public String getClasif() {   
      return clasif;
   }
   
   public void setClasif(String clasif) {   
      this.clasif = clasif;
   }
   
   public String getLabel() {   
      return label;
   }
   
   public void setLabel(String label) {   
      this.label = label;
   }
   
   public String getNickName() {   
      return nickName;
   }
   
   public void setNickName(String nickName) {   
      this.nickName = nickName;
   }
   
   public String getParamValue() {   
      return paramValue;
   }
   
   public void setParamValue(String paramValue) {   
      this.paramValue = paramValue;
   }
   
   public boolean isRequerido() {      
      return requerido;
   }
   
   public void setRequerido(boolean requerido) {   
      this.requerido = requerido;
   }
   
   public String getInputType() {      
      return inputType;
   }
   
   public void setInputType(String inputType) {   
      this.inputType = inputType;
   }
   
   public int getInputSize() {      
      return inputSize;
   }
   
   public void setInputSize(int inputSize) {   
      this.inputSize = inputSize;
   }
   
   public int getInputDec() {      
      return inputDec;
   }
   
   public void setInputDec(int inputDec) {   
      this.inputDec = inputDec;
   }
}
