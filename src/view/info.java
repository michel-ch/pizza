package view;

import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JLabel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class info {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					info window = new info();
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
	public info() {
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
		
		JButton precedent = new JButton("Precedent");
		precedent.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		precedent.setHorizontalAlignment(SwingConstants.CENTER);
		precedent.setForeground(Color.WHITE);
		precedent.setFont(new Font("Arial", Font.PLAIN, 12));
		precedent.setFocusPainted(false);
		precedent.setBackground(new Color(189, 208, 233));
		precedent.setBounds(706, 38, 124, 37);
		frame.getContentPane().add(precedent);
		
		JLabel affichage = new JLabel("LABEL");
		affichage.setOpaque(true);
		affichage.setBackground(new Color(255, 255, 255));
		affichage.setHorizontalAlignment(SwingConstants.CENTER);
		affichage.setForeground(new Color(70, 114, 196));
		affichage.setFont(new Font("Arial", Font.PLAIN, 12));
		affichage.setBounds(122, 38, 522, 75);
		frame.getContentPane().add(affichage);
		
		JButton ca = new JButton("Chiffre d'affaires");
		ca.setForeground(new Color(70, 114, 196));
		ca.setFont(new Font("Arial", Font.PLAIN, 16));
		ca.setBackground(new Color(255, 255, 255));
		ca.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		ca.setBounds(122, 184, 230, 75);
		frame.getContentPane().add(ca);
		
		JButton meilleurClient = new JButton("Meilleur client");
		meilleurClient.setForeground(new Color(70, 114, 196));
		meilleurClient.setBackground(new Color(255, 255, 255));
		meilleurClient.setFont(new Font("Arial", Font.PLAIN, 16));
		meilleurClient.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		meilleurClient.setBounds(414, 184, 230, 75);
		frame.getContentPane().add(meilleurClient);
		
		JButton mauvaisLivreur = new JButton("Mauvais livreur");
		mauvaisLivreur.setForeground(new Color(70, 114, 196));
		mauvaisLivreur.setFont(new Font("Arial", Font.PLAIN, 16));
		mauvaisLivreur.setBackground(new Color(255, 255, 255));
		mauvaisLivreur.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		mauvaisLivreur.setBounds(122, 308, 230, 75);
		frame.getContentPane().add(mauvaisLivreur);
		
		JButton pizzaFavori = new JButton("Pizza la plus demandee");
		pizzaFavori.setForeground(new Color(70, 114, 196));
		pizzaFavori.setFont(new Font("Arial", Font.PLAIN, 16));
		pizzaFavori.setBackground(new Color(255, 255, 255));
		pizzaFavori.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		pizzaFavori.setBounds(414, 308, 230, 75);
		frame.getContentPane().add(pizzaFavori);
		
		JButton ingredientFavori = new JButton("Ingredient favori");
		ingredientFavori.setForeground(new Color(70, 114, 196));
		ingredientFavori.setFont(new Font("Arial", Font.PLAIN, 16));
		ingredientFavori.setBackground(new Color(255, 255, 255));
		ingredientFavori.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		ingredientFavori.setBounds(414, 432, 230, 75);
		frame.getContentPane().add(ingredientFavori);
		
		JButton vehiculeLibre = new JButton("Vehicule non utilise");
		vehiculeLibre.setForeground(new Color(70, 114, 196));
		vehiculeLibre.setFont(new Font("Arial", Font.PLAIN, 16));
		vehiculeLibre.setBackground(new Color(255, 255, 255));
		vehiculeLibre.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		vehiculeLibre.setBounds(122, 432, 230, 75);
		frame.getContentPane().add(vehiculeLibre);
		
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

}
