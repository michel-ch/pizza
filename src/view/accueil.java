package view;

import java.awt.EventQueue;

import javax.swing.JFrame;
import java.awt.Color;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import java.awt.Font;
import java.awt.Image;
import java.util.Timer;
import java.util.TimerTask;

import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;

import controller.main;

import javax.swing.JLabel;

public class accueil {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					accueil window = new accueil();
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
	public accueil() throws SQLException {
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
		
		JButton infoPizzeria = new JButton("<html>Informations de la <br>Pizzeria</html>");
		infoPizzeria.setFocusPainted(false);
		infoPizzeria.setHorizontalAlignment(SwingConstants.CENTER);
		infoPizzeria.setFont(new Font("Arial", Font.PLAIN, 12));
		infoPizzeria.setForeground(new Color(70, 114, 196));
		infoPizzeria.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				info vca = new info();
			}
		});

		infoPizzeria.setBounds(59, 236, 121, 74);
		frame.getContentPane().add(infoPizzeria);
		
		JButton infoClient = new JButton("<html>Informations<br> client</html>");
		infoClient.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					infoclient vca = new infoclient();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		infoClient.setHorizontalAlignment(SwingConstants.CENTER);
		infoClient.setForeground(new Color(70, 114, 196));
		infoClient.setFont(new Font("Arial", Font.PLAIN, 12));
		infoClient.setFocusPainted(false);
		infoClient.setBounds(205, 236, 129, 74);
		frame.getContentPane().add(infoClient);
		
		JButton infoLivreurs = new JButton("<html>Informations<br> livreur</html>");
		infoLivreurs.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				infolivreur vca = new infolivreur();
			}
		});
		infoLivreurs.setHorizontalAlignment(SwingConstants.CENTER);
		infoLivreurs.setForeground(new Color(70, 114, 196));
		infoLivreurs.setFont(new Font("Arial", Font.PLAIN, 12));
		infoLivreurs.setFocusPainted(false);
		infoLivreurs.setBounds(59, 362, 121, 74);
		frame.getContentPane().add(infoLivreurs);
		
		JButton menuClient = new JButton("Menu client");
		menuClient.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				menu vca = new menu();		
			}
		});
		menuClient.setHorizontalAlignment(SwingConstants.CENTER);
		menuClient.setForeground(new Color(70, 114, 196));
		menuClient.setFont(new Font("Arial", Font.PLAIN, 12));
		menuClient.setFocusPainted(false);
		menuClient.setBounds(205, 362, 129, 74);
		frame.getContentPane().add(menuClient);
		
		ImageIcon imageIcon = new ImageIcon("images/pizza.png");
		Image newSizeIcon = imageIcon.getImage().getScaledInstance(74, 74, imageIcon.getImage().SCALE_SMOOTH); 
		JLabel imageAccueil = new JLabel();
		imageAccueil.setOpaque(false);
		imageAccueil.setBackground(new Color(0, 0, 0));
		imageAccueil.setIcon(new ImageIcon(newSizeIcon));
		imageAccueil.setBounds(37, 70, 74, 74);
		frame.getContentPane().add(imageAccueil);
		
		JLabel imageAccueil_1 = new JLabel();
		imageAccueil_1.setOpaque(false);
		imageAccueil_1.setOpaque(false);
		imageAccueil_1.setBackground(Color.BLACK);
		imageAccueil_1.setIcon(new ImageIcon(newSizeIcon));
		imageAccueil_1.setBounds(288, 70, 74, 74);
		frame.getContentPane().add(imageAccueil_1);
		
		JLabel lblNewLabel = new JLabel("Bellissimo Pizza");
		lblNewLabel.setFont(new Font("Broadway", Font.PLAIN, 20));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setBounds(89, 61, 217, 88);
		frame.getContentPane().add(lblNewLabel);
		
		
		DefaultListModel listModel = new DefaultListModel(){
			public boolean isCellEditable(int i, int i1) {
		        return false; //To change body of generated methods, choose Tools | Templates.
		    }
		};
		JList list = new JList (listModel);
		list.setFont(new Font("Arial", Font.PLAIN, 10));
		
		list.setForeground(new Color(70, 114, 196));
		list.setBounds(371, 61, 475, 462);
		frame.getContentPane().add(list);
		
		JLabel lblCommandesEnCours = new JLabel("Commandes en cours");
		lblCommandesEnCours.setHorizontalAlignment(SwingConstants.CENTER);
		lblCommandesEnCours.setFont(new Font("Broadway", Font.PLAIN, 20));
		lblCommandesEnCours.setBounds(466, 11, 290, 49);
		frame.getContentPane().add(lblCommandesEnCours);
		
		Timer timer = new Timer();
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				list.removeAll();
				listModel.removeAllElements();
				try {
					main.getM().getAll();
					for(int i=0; i<main.getM().getListecommandeEncours().size();i++) {
						listModel.addElement(main.getM().getListecommandeEncours().get(i));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			};
			
		};
		timer.schedule(task, 500,100);
		
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
