package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;

import controller.main;

import javax.swing.JLabel;
import javax.swing.JList;

public class infolivreur {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					infolivreur window = new infolivreur();
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
	public infolivreur() {
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
		
		JButton precedent = new JButton("Precedent");
		precedent.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frame.setVisible(false);
			}
		});
		precedent.setHorizontalAlignment(SwingConstants.CENTER);
		precedent.setForeground(Color.WHITE);
		precedent.setFont(new Font("Arial", Font.PLAIN, 12));
		precedent.setFocusPainted(false);
		precedent.setBackground(new Color(189, 208, 233));
		precedent.setBounds(692, 36, 139, 47);
		frame.getContentPane().add(precedent);
		
		
		DefaultTableModel tableModel = new DefaultTableModel(){
			public boolean isCellEditable(int i, int i1) {
		        return false; //To change body of generated methods, choose Tools | Templates.
		    }
		};
		tableModel.addColumn("");
		
		JComboBox comboBox = new JComboBox();
		comboBox.setMaximumRowCount(1000);
		comboBox.setForeground(new Color(70, 114, 196));
		comboBox.setFont(new Font("Arial", Font.PLAIN, 12));
		comboBox.setBounds(53, 126, 778, 47);
		frame.getContentPane().add(comboBox);
		
		for(int i=0;i!=main.getM().getListelivreur().size();i++) {
			String data = main.getM().getListelivreur().get(i).getNom()+" - "+main.getM().getListelivreur().get(i).getPrenom()+ " - " +main.getM().getListelivreur().get(i).getNombreRetard();
			comboBox.addItem(data);
		}
		
		JLabel affichage = new JLabel("Liste des commandes par livreur");
		affichage.setOpaque(false);
		affichage.setHorizontalAlignment(SwingConstants.CENTER);
		affichage.setForeground(new Color(255, 255, 255));
		affichage.setFont(new Font("Arial", Font.PLAIN, 20));
		affichage.setBackground(Color.WHITE);
		affichage.setBounds(257, 25, 385, 75);
		frame.getContentPane().add(affichage);
		
		DefaultListModel listModel = new DefaultListModel(){
			public boolean isCellEditable(int i, int i1) {
		        return false; //To change body of generated methods, choose Tools | Templates.
		    }
		};
		JList list = new JList(listModel);
		list.setBounds(53, 226, 778, 290);
		frame.getContentPane().add(list);
		
		comboBox.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(comboBox.getSelectedIndex()!=-1) {
					list.removeAll();
					listModel.removeAllElements();
					String idlivreur = main.getM().getListelivreur().get(comboBox.getSelectedIndex()).getId();
					try {
						main.getM().getCommandeLivreur(idlivreur);
						for(int i=0;i<main.getM().getListecommandeLivreur().size();i++) {
							listModel.addElement(main.getM().getListecommandeLivreur().get(i));
						}
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
		});
		
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

}
