package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.JLabel;

public class infolivreur {

	private JFrame frame;
	private JTable table;

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
		precedent.setBounds(692, 36, 139, 47);
		frame.getContentPane().add(precedent);
		
		table = new JTable();
		table.setForeground(new Color(70, 114, 196));
		table.setFont(new Font("Arial", Font.PLAIN, 12));
		table.setBounds(53, 303, 778, 230);
		frame.getContentPane().add(table);
		
		JComboBox comboBox = new JComboBox();
		comboBox.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		comboBox.setMaximumRowCount(1000);
		comboBox.setForeground(new Color(70, 114, 196));
		comboBox.setFont(new Font("Arial", Font.PLAIN, 12));
		comboBox.setBounds(53, 126, 778, 47);
		frame.getContentPane().add(comboBox);
		
		JLabel affichage = new JLabel("Liste des commandes par livreur");
		affichage.setOpaque(false);
		affichage.setHorizontalAlignment(SwingConstants.CENTER);
		affichage.setForeground(new Color(255, 255, 255));
		affichage.setFont(new Font("Arial", Font.PLAIN, 20));
		affichage.setBackground(Color.WHITE);
		affichage.setBounds(257, 25, 385, 75);
		frame.getContentPane().add(affichage);
		
		
		
		frame.setBounds(100, 100, 900, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

}
