package view;

import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JTable;
import java.awt.Font;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;

import controller.main;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;
import java.awt.event.ActionEvent;
import javax.swing.JComboBox;
import javax.swing.JList;

public class infoclient {

	private JFrame frame;
	private JLabel nbCommande;
	private JLabel texte;
	private JButton plusMoyenne;
	private boolean buttonSelected = false;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					infoclient window = new infoclient();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 * @throws SQLException 
	 */
	public infoclient() throws SQLException {
		initialize();
		frame.setVisible(true);
	}

	/**
	 * Initialize the contents of the frame.
	 * @throws SQLException 
	 */
	private void initialize() throws SQLException {
		frame = new JFrame();
		frame.getContentPane().setBackground(new Color(70, 114, 196));
		frame.getContentPane().setForeground(new Color(70, 114, 196));
		frame.getContentPane().setLayout(null);
		
		String moyenne = "-";
		try {
			float float_moyenne = main.getM().getMoyenCommande();
			float_moyenne = Math.round(float_moyenne * 100) / 100f;
			moyenne = Float.toString(float_moyenne);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Erreur de la recuperation de moyenne prix de chaque commande");
		}
		
		JLabel moyenCommande = new JLabel(moyenne+" par commande");
		moyenCommande.setHorizontalAlignment(SwingConstants.CENTER);
		moyenCommande.setOpaque(true);
		moyenCommande.setForeground(new Color(70, 114, 196));
		moyenCommande.setFont(new Font("Arial", Font.PLAIN, 12));
		moyenCommande.setBackground(new Color(255, 255, 255));
		moyenCommande.setBounds(53, 36, 147, 47);
		frame.getContentPane().add(moyenCommande);
		
		int nbCommandes = 0;
		nbCommande = new JLabel("Nombre de commande du client selectionne : "+nbCommandes);
		nbCommande.setOpaque(true);
		nbCommande.setHorizontalAlignment(SwingConstants.CENTER);
		nbCommande.setForeground(new Color(70, 114, 196));
		nbCommande.setFont(new Font("Arial", Font.PLAIN, 12));
		nbCommande.setBackground(Color.WHITE);
		nbCommande.setBounds(258, 36, 307, 47);
		frame.getContentPane().add(nbCommande);
		
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
		
		texte = new JLabel("Uniquement des clients ayant commande plus que la moyenne");
		texte.setOpaque(true);
		texte.setHorizontalAlignment(SwingConstants.CENTER);
		texte.setForeground(new Color(70, 114, 196));
		texte.setFont(new Font("Arial", Font.PLAIN, 12));
		texte.setBackground(Color.WHITE);
		texte.setBounds(53, 219, 381, 47);
		frame.getContentPane().add(texte);
		
		plusMoyenne = new JButton("");
		plusMoyenne.setFocusPainted(false);
		plusMoyenne.setForeground(new Color(70, 114, 196));
		plusMoyenne.setFont(new Font("Arial", Font.PLAIN, 16));
		plusMoyenne.setBounds(463, 219, 47, 47);
		if(buttonSelected) {
			plusMoyenne.setBackground(new Color(0, 255, 0));
		}
		else {
			plusMoyenne.setBackground(new Color(255, 0, 0));
		}
		frame.getContentPane().add(plusMoyenne);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setMaximumRowCount(1000);
		comboBox.setForeground(new Color(70, 114, 196));
		comboBox.setFont(new Font("Arial", Font.PLAIN, 12));
		comboBox.setBounds(53, 126, 778, 47);
		frame.getContentPane().add(comboBox);

		DefaultListModel listModel = new DefaultListModel(){
			public boolean isCellEditable(int i, int i1) {
		        return false; //To change body of generated methods, choose Tools | Templates.
		    }
		};
		JList list = new JList(listModel);
		list.setBounds(53, 295, 778, 229);
		frame.getContentPane().add(list);
		
		plusMoyenne.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(!buttonSelected) {
					comboBox.setSelectedIndex(1);
					buttonSelected = true;
					plusMoyenne.setBackground(new Color(0, 255, 0));
					comboBox.removeAllItems();
					for(int i=0;i<main.getM().getListeclientBis().size();i++) {
						String data = main.getM().getListeclientBis().get(i).getId()+" - "+main.getM().getListeclientBis().get(i).getNom()+" - "+main.getM().getListeclientBis().get(i).getPrenom()+" - "+main.getM().getListeclientBis().get(i).getAdresse()+" - "+main.getM().getListeclientBis().get(i).getEmail()+" - "+main.getM().getListeclientBis().get(i).getNumeroTelephone()+" - "+main.getM().getListeclientBis().get(i).getSoldeCompte()+" €";
						comboBox.addItem(data);
					}
				}
				else {
					buttonSelected = false;
					plusMoyenne.setBackground(new Color(255, 0, 0));
					comboBox.removeAllItems();
					for(int i=0;i<main.getM().getListeclient().size();i++) {
						String data = main.getM().getListeclient().get(i).getId()+" - "+main.getM().getListeclient().get(i).getNom()+" - "+main.getM().getListeclient().get(i).getPrenom()+" - "+main.getM().getListeclient().get(i).getAdresse()+" - "+main.getM().getListeclient().get(i).getEmail()+" - "+main.getM().getListeclient().get(i).getNumeroTelephone()+" - "+main.getM().getListeclient().get(i).getSoldeCompte()+" €";
						comboBox.addItem(data);
					}
				}
			}
		});
		
		comboBox.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				list.removeAll();
				listModel.removeAllElements();
				if(!buttonSelected) {
					if(comboBox.getSelectedIndex()!=-1) {
						int idclient = main.getM().getListeclient().get(comboBox.getSelectedIndex()).getId();
						try {
							int nbCommandes = main.getM().getNbCommandes(idclient);
							nbCommande.setText("Nombre de commande du client selectionne : "+nbCommandes);
							main.getM().getCommandeClient(idclient);
							for(int i=0;i<main.getM().getListecommandeClient().size();i++) {
								listModel.addElement(main.getM().getListecommandeClient().get(i));
							}	
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					}
				}
				else {
					if(comboBox.getSelectedIndex()!=-1) {
						int idclient = main.getM().getListeclientBis().get(comboBox.getSelectedIndex()).getId();
						try {
							int nbCommandes = main.getM().getNbCommandes(idclient);
							nbCommande.setText("Nombre de commande du client selectionne : "+nbCommandes);
							main.getM().getCommandeClient(idclient);
							for(int i=0;i<main.getM().getListecommandeClient().size();i++) {
								listModel.addElement(main.getM().getListecommandeClient().get(i));
							}	
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					}
				}
			}
		});
		
		if(!buttonSelected) {
			comboBox.removeAllItems();
			for(int i=0;i<main.getM().getListeclient().size();i++) {
				String data = main.getM().getListeclient().get(i).getId()+" - "+main.getM().getListeclient().get(i).getNom()+" - "+main.getM().getListeclient().get(i).getPrenom()+" - "+main.getM().getListeclient().get(i).getAdresse()+" - "+main.getM().getListeclient().get(i).getEmail()+" - "+main.getM().getListeclient().get(i).getNumeroTelephone()+" - "+main.getM().getListeclient().get(i).getSoldeCompte()+" €";
				comboBox.addItem(data);
			}
		}
		else {
			comboBox.removeAllItems();
			for(int i=0;i<main.getM().getListeclientBis().size();i++) {
				String data = main.getM().getListeclientBis().get(i).getId()+" - "+main.getM().getListeclientBis().get(i).getNom()+" - "+main.getM().getListeclientBis().get(i).getPrenom()+" - "+main.getM().getListeclientBis().get(i).getAdresse()+" - "+main.getM().getListeclientBis().get(i).getEmail()+" - "+main.getM().getListeclientBis().get(i).getNumeroTelephone()+" - "+main.getM().getListeclientBis().get(i).getSoldeCompte()+" €";
				comboBox.addItem(data);
			}
		}
		
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
