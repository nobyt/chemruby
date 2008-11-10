#!/usr/local/bin/ruby


if __FILE__ == $0
  def make_nucleic
    nucleic = "gtggcgatctttccgaaagcgatgactggagcgaagaaccaaagcagtgacatttgtctgatgccgcacgtaggcctgataagacgcggacagcgtcgcatcaggcatcttgtgcaaatgtcggatgcggcgtga"
    require 'bio'
    open("|nucleic", "w") do |out|
      out.puts "nnn"
      out.puts "Generated by Ruby"
      out.puts "amber98.prm"
      out.puts
      nucleic.each_byte do |c|
        out.puts c.chr
      end
      out.puts
      sleep(1)
      out.puts "Y"
    end
  end
#  make_nucleic
#  sleep(1)
  mol = TinkerReader.new(open('nnn.xyz', 'r')).mol
  require 'pov_writer'
  pov = PovWriter.new
  output = open("nucleic.pov", 'w')
  output.puts pov.atom('O', 0.90, 0.00, 0.00)
  output.puts pov.atom('H', 0.50, 0.50, 0.90)
  output.puts pov.atom('N', 0.50, 0.00, 0.50)
  output.puts pov.atom('C', 0.50, 0.50, 0.50)
  output.puts pov.atom('S', 0.50, 0.50, 0.10)
  output.puts pov.atom('P', 0.50, 0.50, 0.10)
  mol.atoms.each do |index, atom|
    output.puts "object {atom_#{atom.element} translate <#{atom.x}, #{atom.y}, #{atom.z}>}"
  end
  mol.bonds.each do |bond|
    output.puts pov.bond(bond.b, bond.e)
  end
#  output.puts(pov.helix(mol))
  output.puts pov.light
  output.puts pov.camera(120, -50, -100, 120, 0, -100)
  output.close
end
