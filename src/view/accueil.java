package view;

import java.awt.EventQueue;

import javax.swing.JFrame;
import java.awt.Color;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.awt.event.ActionEvent;
import java.awt.Font;
import java.awt.Image;

import javax.swing.SwingConstants;
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
	 */
	public accueil() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.getContentPane().setBackground(new Color(70, 114, 196));
		frame.getContentPane().setForeground(new Color(70, 114, 196));
		frame.getContentPane().setLayout(null);
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JList list = new JList();
		list.setBounds(565, 61, 281, 462);
		frame.getContentPane().add(list);
		
		JButton infoPizzeria = new JButton("<html>Informations de la <br>Pizzeria</html>");
		infoPizzeria.setFocusPainted(false);
		infoPizzeria.setHorizontalAlignment(SwingConstants.CENTER);
		infoPizzeria.setFont(new Font("Arial", Font.PLAIN, 16));
		infoPizzeria.setForeground(new Color(70, 114, 196));
		infoPizzeria.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});

		
		infoPizzeria.setBounds(59, 213, 191, 88);
		frame.getContentPane().add(infoPizzeria);
		
		JButton infoClient = new JButton("Informations client");
		infoClient.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		infoClient.setHorizontalAlignment(SwingConstants.CENTER);
		infoClient.setForeground(new Color(70, 114, 196));
		infoClient.setFont(new Font("Arial", Font.PLAIN, 16));
		infoClient.setFocusPainted(false);
		infoClient.setBounds(318, 213, 191, 88);
		frame.getContentPane().add(infoClient);
		
		JButton infoLivreurs = new JButton("Informations Livreurs");
		infoLivreurs.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		infoLivreurs.setHorizontalAlignment(SwingConstants.CENTER);
		infoLivreurs.setForeground(new Color(70, 114, 196));
		infoLivreurs.setFont(new Font("Arial", Font.PLAIN, 16));
		infoLivreurs.setFocusPainted(false);
		infoLivreurs.setBounds(59, 374, 191, 88);
		frame.getContentPane().add(infoLivreurs);
		
		JButton menuClient = new JButton("Menu client");
		menuClient.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		menuClient.setHorizontalAlignment(SwingConstants.CENTER);
		menuClient.setForeground(new Color(70, 114, 196));
		menuClient.setFont(new Font("Arial", Font.PLAIN, 16));
		menuClient.setFocusPainted(false);
		menuClient.setBounds(318, 374, 191, 88);
		frame.getContentPane().add(menuClient);
		
		ImageIcon imageIcon = new ImageIcon("images/pizza.png");
		Image newSizeIcon = imageIcon.getImage().getScaledInstance(109, 107, imageIcon.getImage().SCALE_SMOOTH); 
		JLabel imageAccueil = new JLabel();
		imageAccueil.setOpaque(false);
		imageAccueil.setBackground(new Color(0, 0, 0));
		imageAccueil.setIcon(new ImageIcon(newSizeIcon));
		imageAccueil.setBounds(41, 70, 109, 107);
		frame.getContentPane().add(imageAccueil);
		
		JLabel imageAccueil_1 = new JLabel();
		imageAccueil_1.setOpaque(false);
		imageAccueil_1.setOpaque(false);
		imageAccueil_1.setBackground(Color.BLACK);
		imageAccueil_1.setIcon(new ImageIcon(newSizeIcon));
		imageAccueil_1.setBounds(371, 70, 109, 107);
		frame.getContentPane().add(imageAccueil_1);
		
		JLabel lblNewLabel = new JLabel("Bellissimo Pizza");
		lblNewLabel.setFont(new Font("Broadway", Font.PLAIN, 23));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setBounds(156, 61, 217, 88);
		frame.getContentPane().add(lblNewLabel);
		
		
		
		
	}
}
