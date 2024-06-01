package view;

import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JTable;
import java.awt.Font;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import controller.main;

import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JComboBox;

public class infoclient {

	private JFrame frame;
	private JTable table;
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
	 */
	public infoclient() {
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
		
		table = new JTable();
		table.setForeground(new Color(70, 114, 196));
		table.setFont(new Font("Arial", Font.PLAIN, 12));
		table.setBounds(53, 303, 778, 230);
		frame.getContentPane().add(table);
		
		JLabel moyenCommande = new JLabel("par commande");
		moyenCommande.setHorizontalAlignment(SwingConstants.CENTER);
		moyenCommande.setOpaque(true);
		moyenCommande.setForeground(new Color(70, 114, 196));
		moyenCommande.setFont(new Font("Arial", Font.PLAIN, 12));
		moyenCommande.setBackground(new Color(255, 255, 255));
		moyenCommande.setBounds(53, 36, 147, 47);
		frame.getContentPane().add(moyenCommande);
		
		nbCommande = new JLabel("Nombre de commande du client selectionne : ");
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
		plusMoyenne.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		plusMoyenne.setFocusPainted(false);
		plusMoyenne.setForeground(new Color(70, 114, 196));
		plusMoyenne.setFont(new Font("Arial", Font.PLAIN, 16));
		plusMoyenne.setBackground(new Color(255, 0, 0));
		plusMoyenne.setBounds(463, 219, 47, 47);
		frame.getContentPane().add(plusMoyenne);
		
		JComboBox comboBox = new JComboBox();
		comboBox.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(!buttonSelected) {
					buttonSelected = true; 
				}
				else {
					buttonSelected = false;
				}
			}
		});
		comboBox.setMaximumRowCount(1000);
		comboBox.setForeground(new Color(70, 114, 196));
		comboBox.setFont(new Font("Arial", Font.PLAIN, 12));
		comboBox.setBounds(53, 126, 778, 47);
		frame.getContentPane().add(comboBox);
		
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
