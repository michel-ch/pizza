package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.util.ArrayList;
import javax.swing.JFrame;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import controller.main;
import model.model;
import javax.swing.JTextField;
import javax.swing.JLabel;

public class menu {

    private JFrame frame;
    private JTable menu;
    private JTextField idclient;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    menu window = new menu();
                    window.frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the application.
     */
    public menu() {
        initialize();
        frame.setVisible(true);
    }

    /**
     * Initialize the contents of the frame.
     */
    private void initialize() {
        frame = new JFrame();
        frame.getContentPane().setBackground(new Color(70, 114, 196));
        frame.getContentPane().setForeground(new Color(70, 114, 196));
        frame.getContentPane().setLayout(null);
        
        idclient = new JTextField();
        idclient.setBounds(595, 175, 233, 52);
        frame.getContentPane().add(idclient);
        idclient.setColumns(10);
        
        JLabel label = new JLabel("Veuillez saisir votre identifiant client :");
        label.setFont(new Font("Arial", Font.PLAIN, 14));
        label.setForeground(new Color(255, 255, 255));
        label.setBounds(595, 123, 233, 41);
        frame.getContentPane().add(label);
        
        JLabel affichage = new JLabel("");
        affichage.setHorizontalAlignment(SwingConstants.CENTER);
        affichage.setFont(new Font("Arial", Font.BOLD, 14));
        affichage.setBounds(578, 360, 279, 138);
        frame.getContentPane().add(affichage);

        JButton precedent = new JButton("Precedent");
        precedent.setBackground(new Color(189, 208, 233));
        precedent.setFocusPainted(false);
        precedent.setHorizontalAlignment(SwingConstants.CENTER);
        precedent.setForeground(new Color(255, 255, 255));
        precedent.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                frame.setVisible(false);
            }
        });
        precedent.setFont(new Font("Arial", Font.PLAIN, 12));
        precedent.setBounds(688, 23, 124, 37);
        frame.getContentPane().add(precedent);
        
        DefaultTableModel tableModel = new DefaultTableModel(){
			public boolean isCellEditable(int i, int i1) {
		        return false; //To change body of generated methods, choose Tools | Templates.
		    }
		};
		menu = new JTable(tableModel);
		tableModel.addColumn("");
        menu.setForeground(new Color(70, 114, 196));
        menu.setFont(new Font("Arial", Font.PLAIN, 10));
        menu.setBounds(20, 40, 490, 430);
        frame.getContentPane().add(menu);

        frame.setBounds(100, 100, 900, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        menu.removeAll();
        tableModel.getDataVector().removeAllElements();
        
		for (int i=0;i!= main.getM().getMenuItems().size();i++) {
			String pizza = main.getM().getMenuItems().get(i);
			Object[] data = {pizza};
			tableModel.addRow(data);
		}
		
		JButton valider = new JButton("Validation");
        valider.setBackground(new Color(255, 255, 255));
        valider.setFont(new Font("Arial", Font.PLAIN, 12));
        valider.setFocusPainted(false);
        valider.setHorizontalAlignment(SwingConstants.CENTER);
        valider.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
            	affichage.setText("");
            	String pizza = main.getM().getMenuItems().get(menu.getSelectedRow());
    			String[] parts = pizza.split(" - ");
            	if(menu.getSelectedRow()!= -1 || !idclient.getText().isEmpty()) {
            		try {
            			String idpizza = parts[0];
            			String pre_prix = parts[3];
            			pre_prix = pre_prix.substring(0, pre_prix.length()-1);
            			float prix = Float.parseFloat(pre_prix);
						String a = main.getM().insertCommande(Integer.parseInt(idclient.getText()), idpizza, prix);
						affichage.setText(a);
						main.getM().getAll();
					} catch (NumberFormatException | SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						System.out.println("INSERT ERROR");
					}
            	}
            	else {
            		affichage.setText("<html>Veuillez saisir une pizza <br>et votre identifiant !</html>");
            	}
            	menu.clearSelection();
            }
        });
        valider.setForeground(new Color(70, 114, 196));
        valider.setBounds(633, 291, 165, 37);
        frame.getContentPane().add(valider);
    }
}
