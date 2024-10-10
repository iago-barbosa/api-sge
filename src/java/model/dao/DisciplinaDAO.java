/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Area;
import model.bean.Disciplina;

/**
 *
 * @author aluno
 */
public class DisciplinaDAO {
    public List<Disciplina> lerDisciplinas() {
        List<Disciplina> lista = new ArrayList();
        try {
            Connection conn = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            stmt = conn.prepareStatement("SELECT dis.id_disciplina, dis.nome_disciplina,\n" +
                "area.id AS id_area, area.nome AS nome_area,\n" +
                "area.descricao AS descricao_area\n" +
                "FROM disciplina AS dis\n" +
                "INNER JOIN area ON dis.fk_id_area = area.id;");
            
            rs = stmt.executeQuery();
            
            while(rs.next()) {
                Disciplina dis = new Disciplina();
                dis.setId_disciplina(rs.getInt("id_disciplina"));
                dis.setNome_disciplina(rs.getString("nome_disciplina"));
                
                // Inicio do objeto area
                Area area = new Area();
                area.setId(rs.getInt("id_area"));
                area.setNome(rs.getString("nome_area"));
                area.setDescricao(rs.getString("descricao_area"));
                dis.setArea(area);
                
                lista.add(dis);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    public List<Disciplina> lerDisciplinasProfessores(int id_professor) {
        List<Disciplina> lista = new ArrayList();
        try {
            Connection conn = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            stmt = conn.prepareStatement("SELECT d.id_disciplina, d.nome_disciplina, \n" +
                "a.id_area, a.nome, a.descricao \n" +
                "FROM disciplina AS d\n" +
                "INNER JOIN professor_disciplina AS pd ON pd.fk_id_disciplina = d.id_disciplina\n" +
                "INNER JOIN area AS a ON a.id_area = d.fk_id_area\n" +
                "WHERE pd.fk_id_professor = ?");
            stmt.setInt(1, id_professor);
            
            rs = stmt.executeQuery();
            
            while(rs.next()) {
                Disciplina dis = new Disciplina();
                dis.setId_disciplina(rs.getInt("id_disciplina"));
                dis.setNome_disciplina(rs.getString("nome_disciplina"));
                
                // Inicio do objeto area
                Area area = new Area();
                area.setId(rs.getInt("id_area"));
                area.setNome(rs.getString("nome"));
                area.setDescricao(rs.getString("descricao"));
                dis.setArea(area);
                
                lista.add(dis);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    

}
