package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTable;
import javax.swing.JLabel;

public class menu {

	private JFrame frame;
	private JTable table;

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
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.getContentPane().setBackground(new Color(70, 114, 196));
		frame.getContentPane().setForeground(new Color(70, 114, 196));
		frame.getContentPane().setLayout(null);
		
		JButton menu1 = new JButton("MENU 1");
		menu1.setBackground(new Color(255, 255, 255));
		menu1.setForeground(new Color(70, 114, 196));
		menu1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		menu1.setFocusPainted(false);
		menu1.setHorizontalAlignment(SwingConstants.CENTER);
		menu1.setFont(new Font("Arial", Font.PLAIN, 12));
		menu1.setBounds(58, 208, 165, 99);
		frame.getContentPane().add(menu1);
		
		JButton menu2 = new JButton("MENU 2");
		menu2.setBackground(new Color(255, 255, 255));
		menu2.setFont(new Font("Arial", Font.PLAIN, 12));
		menu2.setForeground(new Color(70, 114, 196));
		menu2.setFocusPainted(false);
		menu2.setHorizontalAlignment(SwingConstants.CENTER);
		menu2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		menu2.setBounds(265, 208, 165, 99);
		frame.getContentPane().add(menu2);
		
		JButton menu3 = new JButton("MENU 3");
		menu3.setBackground(new Color(255, 255, 255));
		menu3.setFont(new Font("Arial", Font.PLAIN, 12));
		menu3.setFocusPainted(false);
		menu3.setHorizontalAlignment(SwingConstants.CENTER);
		menu3.setForeground(new Color(70, 114, 196));
		menu3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		menu3.setBounds(58, 365, 165, 99);
		frame.getContentPane().add(menu3);
		
		JButton menu4 = new JButton("MENU 4");
		menu4.setBackground(new Color(255, 255, 255));
		menu4.setFocusPainted(false);
		menu4.setHorizontalAlignment(SwingConstants.CENTER);
		menu4.setFont(new Font("Arial", Font.PLAIN, 12));
		menu4.setForeground(new Color(70, 114, 196));
		menu4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		menu4.setBounds(265, 365, 165, 99);
		frame.getContentPane().add(menu4);
		
		table = new JTable();
		table.setForeground(new Color(70, 114, 196));
		table.setBounds(533, 170, 279, 305);
		frame.getContentPane().add(table);
		
		JButton supprimer = new JButton("Supprimer");
		supprimer.setBackground(new Color(255, 255, 255));
		supprimer.setFont(new Font("Arial", Font.PLAIN, 12));
		supprimer.setForeground(new Color(70, 114, 196));
		supprimer.setFocusPainted(false);
		supprimer.setHorizontalAlignment(SwingConstants.CENTER);
		supprimer.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		supprimer.setBounds(534, 106, 124, 37);
		frame.getContentPane().add(supprimer);
		
		JButton retirer = new JButton("Retirer");
		retirer.setBackground(new Color(255, 255, 255));
		retirer.setFont(new Font("Arial", Font.PLAIN, 12));
		retirer.setFocusPainted(false);
		retirer.setHorizontalAlignment(SwingConstants.CENTER);
		retirer.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		retirer.setForeground(new Color(70, 114, 196));
		retirer.setBounds(688, 106, 124, 37);
		frame.getContentPane().add(retirer);
		
		JButton valider = new JButton("Validation");
		valider.setBackground(new Color(255, 255, 255));
		valider.setFont(new Font("Arial", Font.PLAIN, 12));
		valider.setFocusPainted(false);
		valider.setHorizontalAlignment(SwingConstants.CENTER);
		valider.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		valider.setForeground(new Color(70, 114, 196));
		valider.setBounds(595, 499, 165, 37);
		frame.getContentPane().add(valider);
		
		JButton precedent = new JButton("Precedent");
		precedent.setBackground(new Color(189, 208, 233));
		precedent.setFocusPainted(false);
		precedent.setHorizontalAlignment(SwingConstants.CENTER);
		precedent.setForeground(new Color(255, 255, 255));
		precedent.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		precedent.setFont(new Font("Arial", Font.PLAIN, 12));
		precedent.setBounds(688, 23, 124, 37);
		frame.getContentPane().add(precedent);
		
		JLabel affichage = new JLabel("LABEL");
		affichage.setFont(new Font("Arial", Font.PLAIN, 12));
		affichage.setForeground(new Color(255, 255, 255));
		affichage.setHorizontalAlignment(SwingConstants.CENTER);
		affichage.setBounds(59, 23, 522, 56);
		frame.getContentPane().add(affichage);
		
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
