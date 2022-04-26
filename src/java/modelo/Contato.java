package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

public class Contato {

    private long id;
    private String nome;
    private String sobrenome;
    private String sexo;
    private Date dataNascimento;
    private String email;
    private String ddd;
    private String telefone;
    private String escolaridade;
    private Timestamp dtCadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDdd() {
        return ddd;
    }

    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEscolaridade() {
        return escolaridade;
    }

    public void setEscolaridade(String escolaridade) {
        this.escolaridade = escolaridade;
    }

    public Timestamp getDtCadastro() {
        return dtCadastro;
    }

    public void setDtCadastro(Timestamp dtCadastro) {
        this.dtCadastro = dtCadastro;
    }

    public long Cadastrar() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO tb_contato ";
            sql += " (nome, sobrenome,"
                    + "sexo, dtnascimento, email, ddd, telefone, "
                    + "escolaridade) ";
            sql += " VALUES (?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getSobrenome());
            ps.setString(3, this.getSexo());
            ps.setDate(4, this.getDataNascimento());
            ps.setString(5, this.getEmail());
            ps.setString(6, this.getDdd());
            ps.setString(7, this.getTelefone());
            ps.setString(8, this.getEscolaridade());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final long lastId = rs.getLong(1);
                    System.out.println("O numero do id é:"
                            + lastId);
                    return lastId;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public List<Contato> ListarContato() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM tb_contato; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Contato> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contato con = new Contato();
                con.setNome(rs.getString("nome"));
                con.setSobrenome(rs.getString("sobrenome"));
                con.setSexo(rs.getString("sexo"));
                con.setDataNascimento(rs.getDate("datanascimento"));
                con.setEmail(rs.getString("email"));
                con.setDdd(rs.getString("ddd"));
                con.setTelefone(rs.getString("telefone"));
                con.setEscolaridade(rs.getString("escolaridade"));
                con.setDtCadastro(rs.getTimestamp("datacadastro"));
                lista.add(con);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public static boolean Excluir(long id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "DELETE FROM tb_contato  WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("Apagou!!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

    public boolean BuscarPorId(String id) {
        try {
            long idcont = Long.parseLong(id);
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM tb_contato WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idcont);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                //id, nome, sobrenome, sexo, dtnascimento, email, ddd, telefone, escolaridade, dtcadastro
                this.setId(rs.getInt("id"));
                this.setNome(rs.getString("nome"));
                this.setSobrenome(rs.getString("sobrenome"));
                this.setSexo(rs.getString("sexo"));
                this.setDataNascimento(rs.getDate("dtnascimento"));
                this.setEmail(rs.getString("email"));
                this.setDdd(rs.getString("ddd"));
                this.setTelefone(rs.getString("telefone"));
                this.setEscolaridade(rs.getString("escolaridade"));
                this.setDtCadastro(rs.getTimestamp("datacadastro"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean Atualizar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "UPDATE tb_contato ";
            sql += " SET nome = ?, ";
            sql += " sobrenome = ?, ";
            sql += " sexo = ?, ";
            sql += " dtnascimento = ?, ";
            sql += " email = ?, ";
            sql += " ddd = ?, ";
            sql += " telefone = ?, ";
            sql += " escolaridade = ? ";
            sql += " WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getSobrenome());
            ps.setString(3, this.getSexo());
            ps.setDate(4, this.getDataNascimento());
            ps.setString(5, this.getEmail());
            ps.setString(6, this.getDdd());
            ps.setString(7, this.getTelefone());
            ps.setString(8, this.getEscolaridade());
            ps.setLong(9, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("atualizou!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
}
