# manual http://prawnpdf.org/manual.pdf'
require 'prawn'

module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 50]
  }

  def self.curriculum(personal_data,phones,idioms,instituitions,
                      complementary_trainnings,about,jobs )

    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      #/home/daniel/.rvm/gems/ruby-2.3.0/gems/prawn-2.1.0/data/lib/mano.ttf
      # Define a cor do traçado /home/daniel/workspaceruby/gerador_curriculo/lib

      pdf.fill_color "252525"
      pdf.font "Times-Roman", :style => :normal
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centroon

      pdf.text "#{personal_data.name.titleize}", :size => 30, :align => :center

      # Move 80 PDF points para baixo o cursor
      pdf.move_down 40
      # Identificaçao Nome, idade, Telefone, email
      pdf.text "<b>Identificação</b>", :size => 16, :align => :justify, :inline_format => true
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      pdf.text "<b>Nome:</b> #{personal_data.name.titleize}", :size => 11, :align => :justify, :inline_format =>true
      pdf.text "<b>Idade:</b> #{personal_data.age}",:size => 11, :align => :justify, :inline_format => true
      if personal_data.cnh.blank?
        pdf.text ""
      else
        pdf.text "<b>CNH:</b> #{personal_data.cnh.upcase}", :size => 11, :align => :justify, :inline_format => true
      end
      if personal_data.email.blank?
        pdf.text ""
      else
        pdf.text "<b>Email:</b> #{personal_data.email}", :size => 11, :align => :justify, :inline_format => true
      end
      pdf.text "<b>Telefone:</b> ",:size => 11, :align => :justify, :inline_format => true
      phones.each do |phone|
          pdf.text " #{phone.phone_user}",:size => 11, :align => :justify, :inline_format => true

      end

      pdf.move_down 10
      pdf.text "<b>Idiomas</b>", :size => 16, :align => :justify, :inline_format => true
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      idioms.each do |idiom|
          pdf.text " #{idiom.language_idiom}",:size => 11, :align => :justify, :inline_format => true
      end

      pdf.move_down 10
      pdf.text "<b>Formação Acadêmica</b>", :size => 16, :align => :justify, :inline_format => true
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      instituitions.each do |inst|
        pdf.text "#{inst.start_year_grad} - #{inst.exit_year_grad}", :size => 11, :align => :justify, :inline_format => true
        pdf.text "<b>Instituição:</b> #{inst.name_instituition}", :size => 11, :align => :justify, :inline_format => true
        pdf.text "<b>Titulação:</b> #{inst.graduation}", :size => 11, :align => :justify, :inline_format => true
        pdf.text "<b>Curso:</b> #{inst.course}", :size => 11, :align => :justify, :inline_format => true
        # pdf.text "<b>Ano de término:</b> #{inst.exit_year_grad}", :size => 11, :align => :justify, :inline_format => true
      end


      pdf.move_down 10
      pdf.text "<b>Formação Complementar</b>", :size => 16, :align => :justify, :inline_format => true
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      complementary_trainnings.each do |ct|
        pdf.text "<b>Instituição:</b> #{ct.name_instituition_comp}", :size => 11, :align => :justify, :inline_format => true
        pdf.text "<b>Curso:</b> #{ct.course_comp}", :size => 11, :align => :justify, :inline_format => true
        pdf.text "<b>Carga horária:</b> #{ct.workload}hrs", :size => 11, :align => :justify, :inline_format => true
        pdf.move_down 8
      end


      pdf.move_down 10
      pdf.text "<b>Áreas de Interesse</b>", :size => 16, :align => :justify, :inline_format => true
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      pdf.text "#{about.resume}",:size => 11, :align => :justify, :inline_format => true

      pdf.move_down 10
      pdf.text "<b>Experiência Profissional</b>", :size => 16, :align => :justify, :inline_format => true
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      jobs.each do |job|
        pdf.text " #{job.start_year_job} - #{job.exit_year_job}", :size => 11, :align => :justify, :inline_format => true
        pdf.text "<b>Empresa:</b> #{job.employer}", :size => 11, :align => :justify, :inline_format => true
        pdf.text "<b>Cargo:</b> #{job.office}", :size => 11, :align => :justify, :inline_format => true
        #pdf.text "<b>Ano de saída:</b> #{job.exit_year_job}", :size => 11, :align => :justify, :inline_format => true
        pdf.move_down 6
      end

      pdf.move_down 10
      pdf.text "<b>Informações Adicionais</b>", :size => 16, :align => :justify, :inline_format => true
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      pdf.text "#{about.objective}", :size => 11, :align => :justify, :inline_format => true

      pdf.move_down 10

      pdf.render_file('public/curriculum.pdf')
   end #end Prawn

 end #end method
end #END MODULE
